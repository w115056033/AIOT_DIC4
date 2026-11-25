param(
    [Parameter(Mandatory=$true)]
    [string]$Message
)

$ErrorActionPreference = "Stop"

Write-Host "=== 開始同步 AIOT_DIC4 到 GitHub 與 Overleaf ===" -ForegroundColor Cyan

# 步驟 1：Git add
Write-Host "[1/4] git add . ..." -ForegroundColor Yellow
git add .
if ($LASTEXITCODE -ne 0) { Write-Host "git add 失敗" -ForegroundColor Red; exit 1 }

# 步驟 2：Git commit
Write-Host "[2/4] git commit -m '$Message' ..." -ForegroundColor Yellow
git commit -m "$Message"
if ($LASTEXITCODE -ne 0) { Write-Host "git commit 失敗（可能無變更）" -ForegroundColor Yellow }

# 步驟 3：Git push
Write-Host "[3/4] git push origin master ..." -ForegroundColor Yellow
git push origin master
if ($LASTEXITCODE -ne 0) { Write-Host "git push 失敗" -ForegroundColor Red; exit 1 }

# 步驟 4：Overleaf push
Write-Host "[4/4] olcli push main2.tex -> Overleaf ..." -ForegroundColor Yellow
olcli push main2.tex --project 6b06bc71056e29946462642e
if ($LASTEXITCODE -ne 0) { Write-Host "olcli push 失敗" -ForegroundColor Red; exit 1 }

Write-Host "=== 同步完成：GitHub 與 Overleaf 已更新 ===" -ForegroundColor Green