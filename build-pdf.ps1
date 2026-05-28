param(
    [string]$Main = "main",
    [switch]$Fast,
    [int]$DockerReadyTimeoutSeconds = 20
)

$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

function Assert-DockerEngineReady {
    $stdout = New-TemporaryFile
    $stderr = New-TemporaryFile

    try {
        $process = Start-Process `
            -FilePath "docker" `
            -ArgumentList @("version", "--format", "{{.Server.Version}}") `
            -RedirectStandardOutput $stdout.FullName `
            -RedirectStandardError $stderr.FullName `
            -WindowStyle Hidden `
            -PassThru

        if (-not $process.WaitForExit($DockerReadyTimeoutSeconds * 1000)) {
            Stop-Process -Id $process.Id -Force -ErrorAction SilentlyContinue
            throw "Docker engine did not respond within ${DockerReadyTimeoutSeconds}s. Start or restart Docker Desktop, then run this script again."
        }

        if ($process.ExitCode -ne 0) {
            $message = (Get-Content -Path $stderr.FullName -Raw).Trim()
            if (-not $message) {
                $message = (Get-Content -Path $stdout.FullName -Raw).Trim()
            }
            throw "Docker engine check failed. Start Docker Desktop and try again. $message"
        }
    }
    finally {
        Remove-Item -LiteralPath $stdout.FullName, $stderr.FullName -Force -ErrorAction SilentlyContinue
    }
}

function Invoke-LatexCommand {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$Command
    )

    Write-Host "Running in Docker: $($Command -join ' ')"
    & docker compose run --rm latex @Command

    if ($LASTEXITCODE -ne 0) {
        throw "Docker LaTeX command failed with exit code ${LASTEXITCODE}: $($Command -join ' ')"
    }
}

Push-Location $ProjectRoot
try {
    Assert-DockerEngineReady

    $texFile = "${Main}.tex"

    Invoke-LatexCommand @("pdflatex", "-interaction=nonstopmode", "-halt-on-error", $texFile)

    if (-not $Fast) {
        Invoke-LatexCommand @("bibtex", $Main)
    }

    Invoke-LatexCommand @("pdflatex", "-interaction=nonstopmode", "-halt-on-error", $texFile)

    if (-not $Fast) {
        Invoke-LatexCommand @("pdflatex", "-interaction=nonstopmode", "-halt-on-error", $texFile)
    }

    Write-Host "PDF generated: $ProjectRoot\$Main.pdf"
}
finally {
    Pop-Location
}
