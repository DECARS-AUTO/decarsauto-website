# ===================================================================
# 简化部署脚本 - 推送现有提交
# ===================================================================

Write-Host "`n🚀 DecarsAuto 部署脚本`n" -ForegroundColor Cyan

Set-Location "C:\Users\Administrator\source\repos\decarsauto-website"

# 检查当前状态
Write-Host "━━━ 当前 Git 状态 ━━━`n" -ForegroundColor Green
git log -1 --oneline
Write-Host ""

# 方案 1：直接推送
Write-Host "方案 1: 直接推送到 GitHub..." -ForegroundColor Yellow
Write-Host "执行: git push origin main`n" -ForegroundColor Gray

$choice = Read-Host "是否执行推送? (Y/N)"
if ($choice -eq 'Y' -or $choice -eq 'y') {
    git push origin main
    if ($LASTEXITCODE -eq 0) {
        Write-Host "`n✅ 推送成功！" -ForegroundColor Green
    } else {
        Write-Host "`n❌ 推送失败。请检查网络连接。`n" -ForegroundColor Red
        Write-Host "💡 备选方案：" -ForegroundColor Yellow
        Write-Host "  1. 检查代理设置: git config --global http.proxy" -ForegroundColor Gray
        Write-Host "  2. 使用 SSH: git remote set-url origin git@github.com:DECARS-AUTO/decarsauto-website.git" -ForegroundColor Gray
        Write-Host "  3. 稍后重试或使用 GitHub Desktop" -ForegroundColor Gray
    }
}

Write-Host "`n按任意键退出..." -ForegroundColor DarkGray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
