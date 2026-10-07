# Instala en Claude Code las skills de una persona (generales + especificas).
# Uso:
#       powershell -ExecutionPolicy Bypass -File .\instalar.ps1 kimberly-chocano
#       powershell -ExecutionPolicy Bypass -File .\instalar.ps1 carolina-valbuena
#       powershell -ExecutionPolicy Bypass -File .\instalar.ps1 lina-lancheros
param(
  [Parameter(Mandatory = $true)]
  [ValidateSet('kimberly-chocano', 'carolina-valbuena', 'lina-lancheros')]
  [string]$Persona
)
$ErrorActionPreference = 'Stop'
$destino = Join-Path $HOME '.claude\skills'
New-Item -ItemType Directory -Force -Path $destino | Out-Null
$n = 0
foreach ($grupo in 'generales', 'especificas') {
  Get-ChildItem -Directory -Path (Join-Path $PSScriptRoot "$Persona\$grupo") | ForEach-Object {
    $obj = Join-Path $destino $_.Name
    New-Item -ItemType Directory -Force -Path $obj | Out-Null
    Copy-Item -Path (Join-Path $_.FullName '*') -Destination $obj -Recurse -Force
    $n++
  }
}
Write-Host "Listo: $n skills instaladas en $destino. Reinicia Claude Code para que las cargue."
