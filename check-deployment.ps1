# ============================================
# Cloudflare 部署状态检查脚本
# ============================================

Write-Host ""
Write-Host "╔═══════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                   ║" -ForegroundColor Cyan
Write-Host "║        🔍 检查 Cloudflare 部署状态                ║" -ForegroundColor Cyan
Write-Host "║                                                   ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# 1. 检查 Git 状态
Write-Host "📋 Git 状态检查：" -ForegroundColor Yellow
git log -1 --oneline
Write-Host "✅ 最新提交已同步" -ForegroundColor Green
Write-Host ""

# 2. Cloudflare 链接
Write-Host "📊 Cloudflare Dashboard 链接：" -ForegroundColor Yellow
Write-Host "https://dash.cloudflare.com/" -ForegroundColor Cyan
Write-Host ""

# 3. 部署时间线
Write-Host "⏱️  预计部署时间线：" -ForegroundColor Yellow
Write-Host "  00:00 - Git 推送完成 ✅" -ForegroundColor Green
Write-Host "  00:15 - Cloudflare 检测更新 🔄" -ForegroundColor White
Write-Host "  00:30 - 开始构建 🔄" -ForegroundColor White
Write-Host "  01:00 - 构建完成 🔄" -ForegroundColor White
Write-Host "  01:30 - 部署到全球节点 🔄" -ForegroundColor White
Write-Host "  02:00 - 部署完成 ✅" -ForegroundColor Green
Write-Host ""

# 4. 等待提示
Write-Host "⏳ 当前状态：正在部署中..." -ForegroundColor Yellow
Write-Host ""
Write-Host "请按照以下步骤操作：" -ForegroundColor Cyan
Write-Host "  1. 打开浏览器访问 Cloudflare Dashboard" -ForegroundColor White
Write-Host "  2. 选择 decarsauto.de" -ForegroundColor White
Write-Host "  3. 进入 Pages 查看部署状态" -ForegroundColor White
Write-Host "  4. 等待状态变为 'Success' ✅" -ForegroundColor White
Write-Host ""

# 5. 部署完成后的操作
Write-Host "🎯 部署完成后执行：" -ForegroundColor Yellow
Write-Host ""
Write-Host "  第1步：清除 Cloudflare 缓存" -ForegroundColor Cyan
Write-Host "    → Caching → Configuration → Purge Everything" -ForegroundColor White
Write-Host ""
Write-Host "  第2步：清除浏览器缓存" -ForegroundColor Cyan
Write-Host "    → Ctrl + Shift + Delete" -ForegroundColor White
Write-Host "    → 或 Ctrl + F5 强制刷新" -ForegroundColor White
Write-Host ""
Write-Host "  第3步：验证功能" -ForegroundColor Cyan
Write-Host "    → 访问 https://decarsauto.de/" -ForegroundColor White
Write-Host "    → 按 F12 打开控制台" -ForegroundColor White
Write-Host "    → 运行验证命令（见下方）" -ForegroundColor White
Write-Host ""

# 6. 验证命令
Write-Host "✅ 验证命令（在浏览器控制台运行）：" -ForegroundColor Green
Write-Host ""
Write-Host "// 验证系统主题检测" -ForegroundColor Gray
Write-Host "console.log('🌓 System theme:', " -ForegroundColor Gray
Write-Host "  window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');" -ForegroundColor Gray
Write-Host ""
Write-Host "// 验证浏览器语言检测" -ForegroundColor Gray
Write-Host "console.log('🌍 Browser language:', navigator.language);" -ForegroundColor Gray
Write-Host "console.log('🌍 Detected language:', " -ForegroundColor Gray
Write-Host "  navigator.language.startsWith('zh') ? 'ZH' :" -ForegroundColor Gray
Write-Host "  navigator.language.startsWith('de') ? 'DE' : 'EN');" -ForegroundColor Gray
Write-Host ""

# 7. 测试页面
Write-Host "🧪 测试页面链接：" -ForegroundColor Yellow
Write-Host "  • 主页: https://decarsauto.de/" -ForegroundColor Cyan
Write-Host "  • 系统主题测试: https://decarsauto.de/test-system-theme.html" -ForegroundColor Cyan
Write-Host "  • 语言检测测试: https://decarsauto.de/test-browser-language.html" -ForegroundColor Cyan
Write-Host "  • 演示页面: https://decarsauto.de/demo-browser-language.html" -ForegroundColor Cyan
Write-Host ""

# 8. 快速链接
Write-Host "🔗 快速访问：" -ForegroundColor Yellow
Write-Host "按任意键打开 Cloudflare Dashboard..." -ForegroundColor White
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Start-Process "https://dash.cloudflare.com/"

Write-Host ""
Write-Host "✅ 已打开 Cloudflare Dashboard！" -ForegroundColor Green
Write-Host ""
