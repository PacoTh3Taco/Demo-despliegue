$archivoOrigen = Join-Path $PSScriptRoot 'Origen\index.php'
$archivoDestino = Join-Path $PSScriptRoot 'Pruebas\index.php'

& 'C:\xampp\php\php.exe' -l $archivoOrigen

if ($LASTEXITCODE -ne 0) {
    Write-Host "Hay un error de sintaxis. No es publicó el cambio."
    exit 1
}
Copy-Item $archivoOrigen $archivoDestino -Force -ErrorAction Stop
Write-Host "Versión publicada en el ambiente de pruebas."
& 'C:\xampp\php\php.exe' -S localhost:8000 -t .\pruebas