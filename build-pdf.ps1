param(
    [string]$Main = "main",
    [string]$Output = "Robotics-Software-State-of-Practice",
    [switch]$Fast,
    [int]$DockerReadyTimeoutSeconds = 20
)

$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

function Get-TrimmedFileText {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    $text = Get-Content -Path $Path -Raw -ErrorAction SilentlyContinue
    if ($null -eq $text) {
        return ""
    }

    return $text.Trim()
}

function Assert-DockerEngineReady {
    $stdout = New-TemporaryFile
    $stderr = New-TemporaryFile

    try {
        $process = Start-Process `
            -FilePath "docker" `
            -ArgumentList @("version", "--format={{.Server.Version}}") `
            -RedirectStandardOutput $stdout.FullName `
            -RedirectStandardError $stderr.FullName `
            -WindowStyle Hidden `
            -PassThru

        if (-not $process.WaitForExit($DockerReadyTimeoutSeconds * 1000)) {
            Stop-Process -Id $process.Id -Force -ErrorAction SilentlyContinue
            throw "Docker engine did not respond within ${DockerReadyTimeoutSeconds}s. Start or restart Docker Desktop, then run this script again."
        }

        $serverVersion = Get-TrimmedFileText -Path $stdout.FullName
        if ($serverVersion) {
            return
        }

        $message = Get-TrimmedFileText -Path $stderr.FullName
        if (-not $message) {
            $message = "No Docker server version was returned."
        }

        throw "Docker engine check failed. Start Docker Desktop and try again. $message"
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
    $jobName = "-jobname=$Output"

    Invoke-LatexCommand @("pdflatex", $jobName, "-interaction=nonstopmode", "-halt-on-error", $texFile)

    if (-not $Fast) {
        Invoke-LatexCommand @("bibtex", $Output)
    }

    Invoke-LatexCommand @("pdflatex", $jobName, "-interaction=nonstopmode", "-halt-on-error", $texFile)

    if (-not $Fast) {
        Invoke-LatexCommand @("pdflatex", $jobName, "-interaction=nonstopmode", "-halt-on-error", $texFile)
    }

    Write-Host "PDF generated: $ProjectRoot\$Output.pdf"
}
finally {
    Pop-Location
}
