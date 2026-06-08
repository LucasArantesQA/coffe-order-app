# ============================================================
# run-schemathesis.ps1
# Executa a bateria de testes Schemathesis via Docker
# ============================================================

# 1. Variaveis de configuracao
#    $PSScriptRoot garante que o caminho e sempre relativo ao script,
#    independente de onde voce o executa.
$RESULTS_DIR = Join-Path $PSScriptRoot "results"
$API_URL     = "http://host.docker.internal:8080/v3/api-docs"

# 2. Verifica se o Docker esta disponivel e em execucao
Write-Host "[*] Verificando disponibilidade do Docker..." -ForegroundColor Cyan

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "[ERRO] Docker nao encontrado no PATH. Instale o Docker Desktop." -ForegroundColor Red
    exit 1
}

docker info 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERRO] O daemon do Docker nao esta em execucao. Inicie o Docker Desktop." -ForegroundColor Red
    exit 1
}

# 3. Cria a pasta de resultados
Write-Host "[*] Preparando diretorio de resultados em: $RESULTS_DIR" -ForegroundColor Cyan
New-Item -ItemType Directory -Force -Path $RESULTS_DIR | Out-Null

Write-Host "[*] Iniciando bateria de testes do Schemathesis..." -ForegroundColor Green
Write-Host "[*] Alvo: $API_URL"

# Forca UTF-8 para que os caracteres graficos do Schemathesis sejam exibidos corretamente
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

# 4. Executa o Schemathesis via Docker
docker run --rm `
    -v "${RESULTS_DIR}:/app/results" `
    schemathesis/schemathesis run "$API_URL" `
    --checks all `
    --phases fuzzing,stateful `
    --coverage-format html `
    --coverage-report-html-path /app/results/coverage.html `
    | Tee-Object -FilePath (Join-Path $RESULTS_DIR "terminal.log")

# 5. Captura e propaga o exit code
#    Exit 0 = sem falhas | Exit 1 = falhas encontradas | Exit 2 = erro de configuracao
$exitCode = $LASTEXITCODE

Write-Host ""
if ($exitCode -eq 0) {
    Write-Host "[OK] Testes finalizados sem falhas criticas!" -ForegroundColor Green
} else {
    Write-Host "[FALHA] Schemathesis terminou com exit code $exitCode. Verifique os relatorios abaixo:" -ForegroundColor Red
    Write-Host "  - Log do terminal : $RESULTS_DIR\terminal.log"
    Write-Host "  - Cobertura HTML  : $RESULTS_DIR\coverage.html"
}

Write-Host "[*] Relatorios salvos em: $RESULTS_DIR" -ForegroundColor Cyan
exit $exitCode
