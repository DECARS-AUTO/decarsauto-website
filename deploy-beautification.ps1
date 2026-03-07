# =============================================================================
# DecarsAuto Website - 界面美化部署脚本
# =============================================================================
# 
# 功能：将所有美化更改推送到 GitHub
# 运行：.\deploy-beautification.ps1
#
# =============================================================================

Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "    DecarsAuto 界面美化 - 部署脚本" -ForegroundColor White
Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# 检查 Git 状态
Write-Host "📊 检查 Git 状态..." -ForegroundColor Yellow
git status
Write-Host ""

# 显示待推送的提交
Write-Host "📦 待推送的提交：" -ForegroundColor Yellow
git log origin/main..HEAD --oneline
Write-Host ""

# 确认推送
$confirm = Read-Host "确认推送到 GitHub? (y/n)"

if ($confirm -ne 'y' -and $confirm -ne 'Y') {
    Write-Host "❌ 已取消部署" -ForegroundColor Red
    exit
}

Write-Host ""
Write-Host "🚀 开始推送到 GitHub..." -ForegroundColor Green
Write-Host ""

# 推送到 GitHub
try {
    git push origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Green
        Write-Host "    ✅ 部署成功！" -ForegroundColor White
        Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Green
        Write-Host ""
        Write-Host "🎉 界面美化已成功部署到 GitHub！" -ForegroundColor Green
        Write-Host ""
        Write-Host "📝 本次部署包含：" -ForegroundColor Cyan
        Write-Host "  ✨ 6个CSS关键帧动画" -ForegroundColor White
        Write-Host "  💫 页面加载渐进式动画" -ForegroundColor White
        Write-Host "  🎨 Intersection Observer动画系统" -ForegroundColor White
        Write-Host "  🌊 Header毛玻璃背景" -ForegroundColor White
        Write-Host "  💎 3级阴影系统" -ForegroundColor White
        Write-Host "  🎭 按钮涟漪效果" -ForegroundColor White
        Write-Host "  🎯 卡片微交互动画" -ForegroundColor White
        Write-Host "  🎪 章节标题装饰线" -ForegroundColor White
        Write-Host "  🌈 渐变色系统" -ForegroundColor White
        Write-Host ""
        Write-Host "📊 代码统计：" -ForegroundColor Cyan
        Write-Host "  • CSS: +200行" -ForegroundColor White
        Write-Host "  • JavaScript: +60行" -ForegroundColor White
        Write-Host "  • 新增文档: 2个" -ForegroundColor White
        Write-Host ""
        Write-Host "🌐 下一步：" -ForegroundColor Yellow
        Write-Host "  1. 等待 GitHub Pages 自动构建 (约1-2分钟)" -ForegroundColor White
        Write-Host "  2. 访问 https://decars-auto.github.io/decarsauto-website/" -ForegroundColor White
        Write-Host "  3. 清除浏览器缓存 (Ctrl+Shift+R)" -ForegroundColor White
        Write-Host "  4. 体验全新的界面效果！" -ForegroundColor White
        Write-Host ""
        Write-Host "✨ 美化效果预览：" -ForegroundColor Magenta
        Write-Host "  • 页面打开时内容优雅淡入" -ForegroundColor White
        Write-Host "  • 滚动时卡片依次显现" -ForegroundColor White
        Write-Host "  • 悬停卡片看到提升和阴影" -ForegroundColor White
        Write-Host "  • 按钮点击涟漪扩散" -ForegroundColor White
        Write-Host "  • 图标旋转缩放动画" -ForegroundColor White
        Write-Host "  • 表单输入发光效果" -ForegroundColor White
        Write-Host ""
        
    } else {
        throw "推送失败"
    }
    
} catch {
    Write-Host ""
    Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Red
    Write-Host "    ❌ 部署失败" -ForegroundColor White
    Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Red
    Write-Host ""
    Write-Host "可能的原因：" -ForegroundColor Yellow
    Write-Host "  1. 网络连接问题" -ForegroundColor White
    Write-Host "  2. GitHub 认证问题" -ForegroundColor White
    Write-Host "  3. 权限问题" -ForegroundColor White
    Write-Host ""
    Write-Host "解决方法：" -ForegroundColor Yellow
    Write-Host "  1. 检查网络连接" -ForegroundColor White
    Write-Host "  2. 确认 Git 凭据正确" -ForegroundColor White
    Write-Host "  3. 稍后重试: .\deploy-beautification.ps1" -ForegroundColor White
    Write-Host ""
    Write-Host "手动推送命令：" -ForegroundColor Cyan
    Write-Host "  git push origin main" -ForegroundColor White
    Write-Host ""
    exit 1
}

Write-Host "按任意键退出..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
