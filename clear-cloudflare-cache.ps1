# ===================================================================
# Cloudflare 缓存清除脚本
# ===================================================================

Write-Host "`n╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                               ║" -ForegroundColor Cyan
Write-Host "║          🌐 Cloudflare 缓存清除工具 🌐                        ║" -ForegroundColor Cyan
Write-Host "║                                                               ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

Write-Host "📊 当前部署状态：" -ForegroundColor Yellow
Write-Host "  ✅ GitHub 推送完成" -ForegroundColor Green
Write-Host "  ✅ 最新提交: bf525ef" -ForegroundColor Green
Write-Host "  ⏳ Cloudflare 缓存需要清除`n" -ForegroundColor Yellow

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "📝 清除 Cloudflare 缓存有 3 种方法：`n" -ForegroundColor Cyan

Write-Host "方法 1: 使用 Cloudflare Dashboard（最简单）⭐⭐⭐⭐⭐" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "  1. 访问: https://dash.cloudflare.com/" -ForegroundColor White
Write-Host "  2. 登录并选择你的域名 (decarsauto.de)" -ForegroundColor White
Write-Host "  3. 点击 Caching → Configuration" -ForegroundColor White
Write-Host "  4. 点击 'Purge Everything' 按钮" -ForegroundColor White
Write-Host "  5. 确认清除`n" -ForegroundColor White

Write-Host "方法 2: 使用 Cloudflare API（需要配置）⭐⭐⭐⭐" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "  需要 Zone ID 和 API Token" -ForegroundColor White
Write-Host "  （请看下面的配置说明）`n" -ForegroundColor White

Write-Host "方法 3: 启用 Development Mode（临时绕过）⭐⭐⭐" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "  在 Cloudflare Dashboard 中开启 3 小时`n" -ForegroundColor White

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

# 询问用户选择
Write-Host "🎯 选择清除方法：" -ForegroundColor Cyan
Write-Host "  [1] 打开 Cloudflare Dashboard（推荐）" -ForegroundColor White
Write-Host "  [2] 使用 API 清除（需要配置）" -ForegroundColor White
Write-Host "  [3] 查看详细说明" -ForegroundColor White
Write-Host "  [Q] 退出`n" -ForegroundColor White

$choice = Read-Host "请选择 (1/2/3/Q)"

switch ($choice) {
    "1" {
        Write-Host "`n🌐 正在打开 Cloudflare Dashboard..." -ForegroundColor Green
        Start-Process "https://dash.cloudflare.com/"
        
        Write-Host "`n📋 操作步骤提醒：" -ForegroundColor Cyan
        Write-Host "  1. ✅ 登录 Cloudflare" -ForegroundColor White
        Write-Host "  2. ✅ 选择 decarsauto.de 域名" -ForegroundColor White
        Write-Host "  3. ✅ 点击左侧 'Caching' 菜单" -ForegroundColor White
        Write-Host "  4. ✅ 在 Configuration 标签中找到 'Purge Cache'" -ForegroundColor White
        Write-Host "  5. ✅ 点击 'Purge Everything' 按钮" -ForegroundColor White
        Write-Host "  6. ✅ 确认清除缓存`n" -ForegroundColor White
        
        Write-Host "⏰ 清除后等待 30-60 秒生效" -ForegroundColor Yellow
        Write-Host "🌐 然后访问你的网站并强制刷新 (Ctrl+Shift+R)`n" -ForegroundColor Yellow
    }
    
    "2" {
        Write-Host "`n⚙️  配置 Cloudflare API" -ForegroundColor Cyan
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray
        
        $zoneId = Read-Host "请输入 Zone ID (在 Cloudflare 域名概览页面右侧)"
        $apiToken = Read-Host "请输入 API Token (需要 Cache Purge 权限)" -AsSecureString
        
        if ($zoneId -and $apiToken) {
            Write-Host "`n🚀 正在清除缓存..." -ForegroundColor Yellow
            
            try {
                $apiTokenPlain = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto(
                    [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($apiToken)
                )
                
                $headers = @{
                    "Authorization" = "Bearer $apiTokenPlain"
                    "Content-Type" = "application/json"
                }
                
                $body = @{
                    "purge_everything" = $true
                } | ConvertTo-Json
                
                $response = Invoke-RestMethod `
                    -Uri "https://api.cloudflare.com/client/v4/zones/$zoneId/purge_cache" `
                    -Method POST `
                    -Headers $headers `
                    -Body $body
                
                if ($response.success) {
                    Write-Host "`n✅ 缓存清除成功！" -ForegroundColor Green
                    Write-Host "⏰ 等待 30-60 秒让更改生效" -ForegroundColor Yellow
                    Write-Host "🌐 然后访问网站并强制刷新`n" -ForegroundColor Yellow
                } else {
                    Write-Host "`n❌ 清除失败: $($response.errors)" -ForegroundColor Red
                }
            } catch {
                Write-Host "`n❌ API 调用失败: $($_.Exception.Message)" -ForegroundColor Red
                Write-Host "💡 请检查 Zone ID 和 API Token 是否正确`n" -ForegroundColor Yellow
            }
        } else {
            Write-Host "`n❌ 需要提供 Zone ID 和 API Token`n" -ForegroundColor Red
        }
    }
    
    "3" {
        Write-Host "`n📖 详细说明" -ForegroundColor Cyan
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray
        
        Write-Host "🔍 如何获取 Zone ID 和 API Token：`n" -ForegroundColor Yellow
        
        Write-Host "1. 获取 Zone ID：" -ForegroundColor Cyan
        Write-Host "   • 登录 https://dash.cloudflare.com/" -ForegroundColor White
        Write-Host "   • 选择你的域名" -ForegroundColor White
        Write-Host "   • 在右侧 'API' 部分找到 Zone ID`n" -ForegroundColor White
        
        Write-Host "2. 创建 API Token：" -ForegroundColor Cyan
        Write-Host "   • 访问 https://dash.cloudflare.com/profile/api-tokens" -ForegroundColor White
        Write-Host "   • 点击 'Create Token'" -ForegroundColor White
        Write-Host "   • 选择 'Create Custom Token'" -ForegroundColor White
        Write-Host "   • Permissions: Zone - Cache Purge - Purge" -ForegroundColor White
        Write-Host "   • Zone Resources: Include - Specific zone - 选择你的域名" -ForegroundColor White
        Write-Host "   • 点击 'Continue to summary' → 'Create Token'" -ForegroundColor White
        Write-Host "   • 复制生成的 Token（只显示一次！）`n" -ForegroundColor White
        
        Write-Host "3. 使用 Development Mode：" -ForegroundColor Cyan
        Write-Host "   • Cloudflare Dashboard → 选择域名" -ForegroundColor White
        Write-Host "   • Caching → Configuration" -ForegroundColor White
        Write-Host "   • 开启 'Development Mode' 开关" -ForegroundColor White
        Write-Host "   • 效果：3 小时内绕过所有缓存" -ForegroundColor White
        Write-Host "   • ⚠️  记住测试完关闭！`n" -ForegroundColor White
        
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray
        Write-Host "📚 更多文档：" -ForegroundColor Cyan
        Write-Host "  • CLOUDFLARE-DEPLOYMENT.md - 完整部署指南" -ForegroundColor White
        Write-Host "  • CLOUDFLARE-QUICK-CHECKLIST.txt - 快速检查清单`n" -ForegroundColor White
    }
    
    default {
        Write-Host "`n👋 已退出`n" -ForegroundColor Gray
        exit
    }
}

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "📊 部署验证步骤：`n" -ForegroundColor Cyan
Write-Host "1. 访问网站" -ForegroundColor White
Write-Host "   https://www.decarsauto.de/`n" -ForegroundColor Blue

Write-Host "2. 强制刷新浏览器" -ForegroundColor White
Write-Host "   Windows: Ctrl + Shift + R" -ForegroundColor Gray
Write-Host "   Mac: Cmd + Shift + R`n" -ForegroundColor Gray

Write-Host "3. 检查开发者工具 (F12)" -ForegroundColor White
Write-Host "   Network → 查看 styles.css" -ForegroundColor Gray
Write-Host "   Console → 确认无错误`n" -ForegroundColor Gray

Write-Host "4. 测试新功能" -ForegroundColor White
Write-Host "   ✨ 页面加载淡入动画" -ForegroundColor Gray
Write-Host "   💫 滚动时卡片依次出现" -ForegroundColor Gray
Write-Host "   🎨 悬停卡片提升效果" -ForegroundColor Gray
Write-Host "   🎭 按钮涟漪动画" -ForegroundColor Gray
Write-Host "   🌊 Header 毛玻璃背景`n" -ForegroundColor Gray

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "🎯 预期结果：" -ForegroundColor Cyan
Write-Host "  • GitHub: ✅ 已更新 (提交 bf525ef)" -ForegroundColor Green
Write-Host "  • Cloudflare: ⏳ 缓存清除后即可" -ForegroundColor Yellow
Write-Host "  • 网站: ⏳ 等待缓存更新（30-60秒）`n" -ForegroundColor Yellow

Write-Host "💡 提示：" -ForegroundColor Yellow
Write-Host "  如果仍然看不到更新，可能是浏览器本地缓存" -ForegroundColor White
Write-Host "  尝试无痕模式或不同浏览器测试`n" -ForegroundColor White

Write-Host "按任意键退出..." -ForegroundColor DarkGray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
