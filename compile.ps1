# =============================================================
# CORIOTLAB — Script de compilacion XeLaTeX
# Uso: .\compile.ps1 [tipo]
# Tipos: actividades | tecnicos | todos | plantillas
# =============================================================

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet("actividades","tecnicos","todos","plantillas",
                 "plantilla-actividades","plantilla-tecnico")]
    [string]$Tipo = "plantillas"
)

$BASE = Split-Path -Parent $MyInvocation.MyCommand.Path

$DOCUMENTOS = @{
    "actividades"           = @{ tex = "plantillas\actividades\plantilla_actividades.tex"; out = "output\actividades" }
    "tecnicos"              = @{ tex = "plantillas\tecnicos\plantilla_tecnico.tex";        out = "output\tecnicos"    }
    "plantilla-actividades" = @{ tex = "plantillas\actividades\plantilla_actividades.tex"; out = "output\actividades" }
    "plantilla-tecnico"     = @{ tex = "plantillas\tecnicos\plantilla_tecnico.tex";        out = "output\tecnicos"    }
}

$TODOS_PLANTILLAS = @("actividades","tecnicos")

$AUX_EXT = @("*.aux","*.log","*.out","*.toc","*.lof","*.lot","*.nav","*.snm",
              "*.vrb","*.synctex.gz","*.fls","*.fdb_latexmk","*.xdv","*.bcf","*.run.xml")

function Compilar-Documento {
    param([string]$NombreTipo, [hashtable]$Info)

    $texPath = Join-Path $BASE $Info.tex
    $outDir  = Join-Path $BASE $Info.out
    $texDir  = Split-Path $texPath -Parent
    $texFile = Split-Path $texPath -Leaf
    $pdfName = [System.IO.Path]::GetFileNameWithoutExtension($texFile) + ".pdf"

    Write-Host ""
    Write-Host "  Compilando: $NombreTipo" -ForegroundColor Yellow
    Write-Host "  Archivo:    $texPath" -ForegroundColor Gray

    if (-not (Test-Path $texPath)) {
        Write-Host "  ERROR: Archivo no encontrado: $texPath" -ForegroundColor Red
        return
    }

    $prevLoc = Get-Location
    Set-Location $texDir

    $xeArgs = @("-interaction=nonstopmode", "-halt-on-error", $texFile)

    # Primera pasada
    & xelatex @xeArgs 2>&1 | Out-Null
    # Segunda pasada (TOC, referencias cruzadas)
    & xelatex @xeArgs 2>&1 | Out-Null
    $exitCode = $LASTEXITCODE

    Set-Location $prevLoc

    $pdfSrc = Join-Path $texDir $pdfName
    if (Test-Path $pdfSrc) {
        New-Item -ItemType Directory -Force -Path $outDir | Out-Null
        Copy-Item $pdfSrc (Join-Path $outDir $pdfName) -Force
        $size = [math]::Round((Get-Item (Join-Path $outDir $pdfName)).Length / 1KB, 1)
        Write-Host "  OK  PDF generado: $outDir\$pdfName  ($size KB)" -ForegroundColor Green
    } else {
        Write-Host "  ERROR al compilar $NombreTipo. Revisa el .log en: $texDir" -ForegroundColor Red
    }

    # Limpiar auxiliares
    foreach ($ext in $AUX_EXT) {
        Get-ChildItem -Path $texDir -Filter $ext -ErrorAction SilentlyContinue |
            Remove-Item -Force -ErrorAction SilentlyContinue
    }
}

# -------------------------------------------------------------
Write-Host ""
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "  CORIOTLAB --- Compilador XeLaTeX"           -ForegroundColor Cyan
Write-Host "  Tipo: $Tipo"                                 -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan

if ($Tipo -eq "todos" -or $Tipo -eq "plantillas") {
    foreach ($key in $TODOS_PLANTILLAS) {
        Compilar-Documento -NombreTipo $key -Info $DOCUMENTOS[$key]
    }
} else {
    Compilar-Documento -NombreTipo $Tipo -Info $DOCUMENTOS[$Tipo]
}

Write-Host ""
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "  Compilacion finalizada."                     -ForegroundColor Green
Write-Host "  PDFs disponibles en: output/"                -ForegroundColor White
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host ""
