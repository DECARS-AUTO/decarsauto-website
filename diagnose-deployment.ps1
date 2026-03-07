# ===================================================================
# 部署诊断和修复脚本
# ===================================================================

Write-Host "`n╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                               ║" -ForegroundColor Cyan
Write-Host "║          🔍 部署状态诊断工具 🔍                               ║" -ForegroundColor Cyan
Write-Host "║                                                               ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

$projectPath = "C:\Users\Administrator\source\repos\decarsauto-website"
Set-Location $projectPath

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "第 1 步：检查 Git 状态" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

# 检查当前分支
$branch = git rev-parse --abbrev-ref HEAD
Write-Host "  当前分支: $branch" -ForegroundColor White

# 检查最新提交
$latestCommit = git log -1 --oneline
Write-Host "  最新提交: $latestCommit" -ForegroundColor White

# 检查远程状态
$status = git status -sb
Write-Host "  远程状态: $status`n" -ForegroundColor White

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "第 2 步：检查关键文件" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

$criticalFiles = @(
    "index.html",
    "styles.css",
    "features.js"
)

foreach ($file in $criticalFiles) {
    if (Test-Path $file) {
        $lastModified = (Get-Item $file).LastWriteTime
        $size = (Get-Item $file).Length
        Write-Host "  ✅ $file" -ForegroundColor Green
        Write-Host "     最后修改: $lastModified" -ForegroundColor Gray
        Write-Host "     文件大小: $([math]::Round($size/1KB, 2)) KB" -ForegroundColor Gray
    } else {
        Write-Host "  ❌ $file - 文件不存在！" -ForegroundColor Red
    }
}

Write-Host ""

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "第 3 步：检查 styles.css 内容" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

if (Test-Path "styles.css") {
    $cssContent = Get-Content "styles.css" -Raw
    
    # 检查关键动画
    $animations = @(
        "@keyframes fadeInUp",
        "@keyframes fadeIn",
        "@keyframes scaleIn",
        "@keyframes float",
        "@keyframes shimmer"
    )
    
    foreach ($animation in $animations) {
        if ($cssContent -like "*$animation*") {
            Write-Host "  ✅ $animation" -ForegroundColor Green
        } else {
            Write-Host "  ❌ $animation - 未找到！" -ForegroundColor Red
        }
    }
    
    Write-Host ""
    
    # 检查关键类
    $classes = @(
        ".fade-in",
        ".back-to-top",
        "header.scrolled",
        ".lang-dropdown-btn::before"
    )
    
    foreach ($class in $classes) {
        if ($cssContent -like "*$class*") {
            Write-Host "  ✅ $class" -ForegroundColor Green
        } else {
            Write-Host "  ❌ $class - 未找到！" -ForegroundColor Red
        }
    }
} else {
    Write-Host "  ❌ styles.css 文件不存在！" -ForegroundColor Red
}

Write-Host ""

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "第 4 步：检查 features.js 内容" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

if (Test-Path "features.js") {
    $jsContent = Get-Content "features.js" -Raw
    
    # 检查关键功能
    $features = @(
        "IntersectionObserver",
        "scrollAnimation",
        "backToTopButton",
        "headerScroll"
    )
    
    foreach ($feature in $features) {
        if ($jsContent -like "*$feature*") {
            Write-Host "  ✅ $feature" -ForegroundColor Green
        } else {
            Write-Host "  ❌ $feature - 未找到！" -ForegroundColor Red
        }
    }
} else {
    Write-Host "  ❌ features.js 文件不存在！" -ForegroundColor Red
}

Write-Host ""

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "第 5 步：GitHub Pages 状态检查" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "  📍 GitHub 仓库: https://github.com/DECARS-AUTO/decarsauto-website" -ForegroundColor Cyan
Write-Host "  📍 Actions 页面: https://github.com/DECARS-AUTO/decarsauto-website/actions" -ForegroundColor Cyan
Write-Host "  📍 GitHub Pages: https://decars-auto.github.io/decarsauto-website/" -ForegroundColor Cyan
Write-Host ""

Write-Host "  💡 检查 Actions 页面是否显示:" -ForegroundColor Yellow
Write-Host "     ✓ 绿色勾号 = 部署成功" -ForegroundColor Gray
Write-Host "     ✗ 红色叉号 = 部署失败" -ForegroundColor Gray
Write-Host "     🔄 黄色圆圈 = 正在部署`n" -ForegroundColor Gray

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "第 6 步：Cloudflare 状态检查" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "  如果你的域名通过 Cloudflare CDN：`n" -ForegroundColor Yellow

Write-Host "  问题诊断：" -ForegroundColor Cyan
Write-Host "  ❓ GitHub 上是最新的，但网站显示旧版本？" -ForegroundColor White
Write-Host "     → Cloudflare 缓存未清除`n" -ForegroundColor Gray

Write-Host "  ❓ 在 GitHub Pages 上是新的，但 www.decarsauto.de 是旧的？" -ForegroundColor White
Write-Host "     → Cloudflare 缓存未清除`n" -ForegroundColor Gray

Write-Host "  ❓ 在无痕模式下能看到，但正常模式看不到？" -ForegroundColor White
Write-Host "     → 浏览器本地缓存`n" -ForegroundColor Gray

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "第 7 步：推荐修复方案" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "  基于诊断，选择合适的方案：`n" -ForegroundColor Yellow

Write-Host "  方案 A：清除 Cloudflare 缓存（最常见）" -ForegroundColor Cyan
Write-Host "  ──────────────────────────────────────" -ForegroundColor Gray
Write-Host "    1. 运行: .\clear-cloudflare-cache.ps1" -ForegroundColor White
Write-Host "    2. 或访问 https://dash.cloudflare.com/" -ForegroundColor White
Write-Host "    3. 选择域名 → Caching → Purge Everything`n" -ForegroundColor White

Write-Host "  方案 B：重新推送到 GitHub（如果文件有问题）" -ForegroundColor Cyan
Write-Host "  ──────────────────────────────────────" -ForegroundColor Gray
Write-Host "    git add styles.css features.js" -ForegroundColor White
Write-Host "    git commit -m 'fix: 修复部署问题'" -ForegroundColor White
Write-Host "    git push origin main`n" -ForegroundColor White

Write-Host "  方案 C：验证 GitHub Pages 设置" -ForegroundColor Cyan
Write-Host "  ──────────────────────────────────────" -ForegroundColor Gray
Write-Host "    1. 访问仓库 Settings → Pages" -ForegroundColor White
Write-Host "    2. 确认 Source: Deploy from a branch" -ForegroundColor White
Write-Host "    3. Branch: main / (root)`n" -ForegroundColor White

Write-Host "  方案 D：强制刷新浏览器" -ForegroundColor Cyan
Write-Host "  ──────────────────────────────────────" -ForegroundColor Gray
Write-Host "    Windows: Ctrl + Shift + R" -ForegroundColor White
Write-Host "    Mac: Cmd + Shift + R" -ForegroundColor White
Write-Host "    或使用无痕模式测试`n" -ForegroundColor White

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "🎯 快速操作链接：" -ForegroundColor Cyan
Write-Host ""
Write-Host "  打开 GitHub Actions？" -ForegroundColor Yellow
$openActions = Read-Host "  (y/n)"
if ($openActions -eq 'y' -or $openActions -eq 'Y') {
    Start-Process "https://github.com/DECARS-AUTO/decarsauto-website/actions"
}

Write-Host "`n  打开 Cloudflare Dashboard？" -ForegroundColor Yellow
$openCF = Read-Host "  (y/n)"
if ($openCF -eq 'y' -or $openCF -eq 'Y') {
    Start-Process "https://dash.cloudflare.com/"
}

Write-Host "`n  打开网站查看？" -ForegroundColor Yellow
$openSite = Read-Host "  (y/n)"
if ($openSite -eq 'y' -or $openSite -eq 'Y') {
    Start-Process "https://www.decarsauto.de/"
}

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "诊断完成！" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "📚 详细文档：" -ForegroundColor Cyan
Write-Host "  • CLOUDFLARE-DEPLOYMENT.md" -ForegroundColor White
Write-Host "  • DEPLOYMENT-TROUBLESHOOTING.txt" -ForegroundColor White
Write-Host "  • DEPLOYMENT-STATUS.txt`n" -ForegroundColor White

Write-Host "按任意键退出..." -ForegroundColor DarkGray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
