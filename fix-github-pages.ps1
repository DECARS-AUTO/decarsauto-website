# ╔═══════════════════════════════════════════════════════════════════════╗
# ║                                                                       ║
# ║          🔍 GitHub Pages 故障诊断和修复脚本 🔍                         ║
# ║                                                                       ║
# ╚═══════════════════════════════════════════════════════════════════════╝

Write-Host "`n╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                               ║" -ForegroundColor Cyan
Write-Host "║          🔧 GitHub Pages 诊断工具 🔧                          ║" -ForegroundColor Cyan
Write-Host "║                                                               ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

Write-Host "问题：https://decars-auto.github.io/decarsauto-website 无法访问`n" -ForegroundColor Yellow

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "步骤 1：检查本地仓库状态" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Set-Location "C:\Users\Administrator\source\repos\decarsauto-website"

$branch = git rev-parse --abbrev-ref HEAD
$commit = git log -1 --format="%h - %s"

Write-Host "  当前分支: $branch" -ForegroundColor White
Write-Host "  最新提交: $commit`n" -ForegroundColor White

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "步骤 2：可能的问题原因" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "  ❓ 原因 1：GitHub Pages 未启用" -ForegroundColor Yellow
Write-Host "     → 需要在仓库设置中启用`n" -ForegroundColor Gray

Write-Host "  ❓ 原因 2：分支或目录设置错误" -ForegroundColor Yellow
Write-Host "     → 需要配置为 main 分支 / (root)`n" -ForegroundColor Gray

Write-Host "  ❓ 原因 3：仓库是私有的" -ForegroundColor Yellow
Write-Host "     → 免费账户的私有仓库无法使用 GitHub Pages`n" -ForegroundColor Gray

Write-Host "  ❓ 原因 4：构建失败" -ForegroundColor Yellow
Write-Host "     → 需要检查 GitHub Actions`n" -ForegroundColor Gray

Write-Host "  ❓ 原因 5：缺少 index.html" -ForegroundColor Yellow
Write-Host "     → 需要确保根目录有 index.html`n" -ForegroundColor Gray

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "步骤 3：检查关键文件" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

if (Test-Path "index.html") {
    Write-Host "  ✅ index.html 存在" -ForegroundColor Green
} else {
    Write-Host "  ❌ index.html 不存在！这是主要问题！" -ForegroundColor Red
}

if (Test-Path "styles.css") {
    Write-Host "  ✅ styles.css 存在" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  styles.css 不存在" -ForegroundColor Yellow
}

if (Test-Path "features.js") {
    Write-Host "  ✅ features.js 存在" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  features.js 不存在" -ForegroundColor Yellow
}

Write-Host ""

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "步骤 4：解决方案" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "  🎯 解决方案 A：启用 GitHub Pages（最常见）" -ForegroundColor Cyan
Write-Host "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host ""
Write-Host "  1️⃣  访问仓库设置" -ForegroundColor White
Write-Host "     https://github.com/DECARS-AUTO/decarsauto-website/settings/pages`n" -ForegroundColor Blue
Write-Host "  2️⃣  在 'Build and deployment' 部分：" -ForegroundColor White
Write-Host "     Source: [Deploy from a branch ▼]`n" -ForegroundColor Gray
Write-Host "  3️⃣  Branch 设置：" -ForegroundColor White
Write-Host "     Branch: [main ▼]  [/ (root) ▼]  [Save]`n" -ForegroundColor Gray
Write-Host "  4️⃣  等待 1-2 分钟，看到绿色提示：" -ForegroundColor White
Write-Host "     ✅ Your site is live at https://decars-auto.github.io/decarsauto-website/`n" -ForegroundColor Green

Write-Host "  🎯 解决方案 B：检查仓库可见性" -ForegroundColor Cyan
Write-Host "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host ""
Write-Host "  1️⃣  访问仓库设置" -ForegroundColor White
Write-Host "     https://github.com/DECARS-AUTO/decarsauto-website/settings`n" -ForegroundColor Blue
Write-Host "  2️⃣  向下滚动到 'Danger Zone'" -ForegroundColor White
Write-Host "  3️⃣  检查仓库是 Public 还是 Private" -ForegroundColor White
Write-Host "     • 如果是 Private：需要升级到 Pro 账户" -ForegroundColor Gray
Write-Host "     • 或者改为 Public（点击 Change visibility）`n" -ForegroundColor Gray

Write-Host "  🎯 解决方案 C：检查 Actions 构建状态" -ForegroundColor Cyan
Write-Host "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host ""
Write-Host "  1️⃣  访问 Actions 页面" -ForegroundColor White
Write-Host "     https://github.com/DECARS-AUTO/decarsauto-website/actions`n" -ForegroundColor Blue
Write-Host "  2️⃣  查看最新的 workflow run" -ForegroundColor White
Write-Host "     • 绿色 ✓ = 成功" -ForegroundColor Green
Write-Host "     • 红色 ✗ = 失败（点击查看错误）" -ForegroundColor Red
Write-Host "     • 黄色 🔄 = 正在运行`n" -ForegroundColor Yellow

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "步骤 5：自动操作选项" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "  选择一个操作：" -ForegroundColor Cyan
Write-Host "  [1] 打开 GitHub Pages 设置页面" -ForegroundColor White
Write-Host "  [2] 打开 GitHub Actions 页面" -ForegroundColor White
Write-Host "  [3] 打开仓库设置页面" -ForegroundColor White
Write-Host "  [4] 查看详细配置指南" -ForegroundColor White
Write-Host "  [Q] 退出`n" -ForegroundColor White

$choice = Read-Host "请选择 (1/2/3/4/Q)"

switch ($choice) {
    "1" {
        Write-Host "`n🌐 正在打开 GitHub Pages 设置..." -ForegroundColor Green
        Start-Process "https://github.com/DECARS-AUTO/decarsauto-website/settings/pages"
        
        Write-Host "`n📋 配置步骤提醒：" -ForegroundColor Yellow
        Write-Host "  1. Source: Deploy from a branch" -ForegroundColor Gray
        Write-Host "  2. Branch: main" -ForegroundColor Gray
        Write-Host "  3. Folder: / (root)" -ForegroundColor Gray
        Write-Host "  4. 点击 Save" -ForegroundColor Gray
        Write-Host "  5. 等待 1-2 分钟`n" -ForegroundColor Gray
    }
    
    "2" {
        Write-Host "`n🌐 正在打开 GitHub Actions..." -ForegroundColor Green
        Start-Process "https://github.com/DECARS-AUTO/decarsauto-website/actions"
        
        Write-Host "`n📋 检查什么：" -ForegroundColor Yellow
        Write-Host "  • 查看最新的 workflow" -ForegroundColor Gray
        Write-Host "  • 绿色 ✓ = 成功" -ForegroundColor Green
        Write-Host "  • 红色 ✗ = 失败（点击查看日志）" -ForegroundColor Red
        Write-Host "  • 如果没有 workflow，说明 Pages 未启用`n" -ForegroundColor Gray
    }
    
    "3" {
        Write-Host "`n🌐 正在打开仓库设置..." -ForegroundColor Green
        Start-Process "https://github.com/DECARS-AUTO/decarsauto-website/settings"
        
        Write-Host "`n📋 检查什么：" -ForegroundColor Yellow
        Write-Host "  • 仓库可见性（Public vs Private）" -ForegroundColor Gray
        Write-Host "  • 如果是 Private，需要改为 Public" -ForegroundColor Gray
        Write-Host "  • 或升级到 GitHub Pro`n" -ForegroundColor Gray
    }
    
    "4" {
        Write-Host "`n📖 查看详细配置指南...`n" -ForegroundColor Green
        
        Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
        Write-Host "║          GitHub Pages 完整配置指南                            ║" -ForegroundColor Cyan
        Write-Host "╚═══════════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan
        
        Write-Host "方法 1：通过 Settings 配置（推荐）" -ForegroundColor Yellow
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray
        
        Write-Host "步骤 1：访问仓库设置" -ForegroundColor White
        Write-Host "  https://github.com/DECARS-AUTO/decarsauto-website`n" -ForegroundColor Blue
        
        Write-Host "步骤 2：点击 Settings 标签（顶部）`n" -ForegroundColor White
        
        Write-Host "步骤 3：点击左侧 Pages 菜单`n" -ForegroundColor White
        
        Write-Host "步骤 4：配置 Build and deployment" -ForegroundColor White
        Write-Host "  ┌────────────────────────────────────┐" -ForegroundColor Gray
        Write-Host "  │ Source:                            │" -ForegroundColor Gray
        Write-Host "  │ [Deploy from a branch ▼] ← 选这个  │" -ForegroundColor Gray
        Write-Host "  │                                    │" -ForegroundColor Gray
        Write-Host "  │ Branch:                            │" -ForegroundColor Gray
        Write-Host "  │ [main ▼] [/ (root) ▼] [Save]      │" -ForegroundColor Gray
        Write-Host "  └────────────────────────────────────┘`n" -ForegroundColor Gray
        
        Write-Host "步骤 5：等待部署" -ForegroundColor White
        Write-Host "  ⏳ GitHub 会自动构建和部署" -ForegroundColor Yellow
        Write-Host "  ⏳ 通常需要 1-2 分钟" -ForegroundColor Yellow
        Write-Host "  ✅ 完成后会显示绿色提示框`n" -ForegroundColor Green
        
        Write-Host "步骤 6：访问网站" -ForegroundColor White
        Write-Host "  https://decars-auto.github.io/decarsauto-website/`n" -ForegroundColor Blue
        
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray
        
        Write-Host "方法 2：通过 Actions 配置（高级）" -ForegroundColor Yellow
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray
        
        Write-Host "这需要创建 .github/workflows/pages.yml 文件" -ForegroundColor White
        Write-Host "但对于简单网站，方法 1 已经足够！`n" -ForegroundColor Gray
        
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray
        
        Write-Host "常见问题排查：" -ForegroundColor Yellow
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray
        
        Write-Host "问题 1：配置后仍然 404" -ForegroundColor Cyan
        Write-Host "  • 等待 2-3 分钟" -ForegroundColor Gray
        Write-Host "  • 检查 Actions 是否成功" -ForegroundColor Gray
        Write-Host "  • 确认 index.html 在根目录`n" -ForegroundColor Gray
        
        Write-Host "问题 2：显示 'There isn't a GitHub Pages site here'" -ForegroundColor Cyan
        Write-Host "  • 仓库可能是私有的" -ForegroundColor Gray
        Write-Host "  • Pages 可能未启用" -ForegroundColor Gray
        Write-Host "  • 分支设置可能错误`n" -ForegroundColor Gray
        
        Write-Host "问题 3：Actions 构建失败" -ForegroundColor Cyan
        Write-Host "  • 查看 Actions 日志" -ForegroundColor Gray
        Write-Host "  • 可能是 HTML 语法错误" -ForegroundColor Gray
        Write-Host "  • 可能是权限问题`n" -ForegroundColor Gray
    }
    
    default {
        Write-Host "`n👋 已退出`n" -ForegroundColor Gray
        exit
    }
}

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "下一步操作" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "1️⃣  配置完 GitHub Pages 后，等待 1-2 分钟" -ForegroundColor White
Write-Host "2️⃣  访问测试：https://decars-auto.github.io/decarsauto-website/" -ForegroundColor White
Write-Host "3️⃣  如果成功，再配置 Cloudflare" -ForegroundColor White
Write-Host "4️⃣  运行: .\clear-cloudflare-cache.ps1`n" -ForegroundColor White

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray

Write-Host "`n💡 提示：" -ForegroundColor Yellow
Write-Host "  GitHub Pages 是免费的，但有限制：" -ForegroundColor White
Write-Host "  • 必须是 Public 仓库（Free 账户）" -ForegroundColor Gray
Write-Host "  • 或者是 Pro/Team/Enterprise 账户" -ForegroundColor Gray
Write-Host "  • 每月 100GB 带宽" -ForegroundColor Gray
Write-Host "  • 每月 10 次构建`n" -ForegroundColor Gray

Write-Host "📚 相关文档：" -ForegroundColor Cyan
Write-Host "  • GitHub Pages: https://pages.github.com/" -ForegroundColor White
Write-Host "  • 故障排除: https://docs.github.com/pages/getting-started-with-github-pages/troubleshooting-404-errors-for-github-pages-sites`n" -ForegroundColor White

Write-Host "按任意键退出..." -ForegroundColor DarkGray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
