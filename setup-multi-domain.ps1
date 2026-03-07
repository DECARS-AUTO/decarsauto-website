# ╔═══════════════════════════════════════════════════════════════════════╗
# ║                                                                       ║
# ║          🌐 Cloudflare 多域名配置助手脚本 🌐                           ║
# ║                                                                       ║
# ╚═══════════════════════════════════════════════════════════════════════╝

Write-Host "`n╔═══════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                           ║" -ForegroundColor Cyan
Write-Host "║          🌐 Cloudflare 多域名配置助手 🌐                  ║" -ForegroundColor Cyan
Write-Host "║                                                           ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

# 收集信息
Write-Host "请输入你的域名信息：`n" -ForegroundColor Yellow

$primaryDomain = Read-Host "主域名（例如：decarsauto.de）"
$secondaryDomain = Read-Host "第二个域名（例如：decarsauto.com，按回车跳过）"

Write-Host "`n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "选择配置方案：" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "[1] 方案 A：两个域名独立配置，都显示网站" -ForegroundColor White
Write-Host "    • 两个域名都能正常访问" -ForegroundColor Gray
Write-Host "    • 适合：品牌矩阵、多市场" -ForegroundColor Gray
Write-Host ""

Write-Host "[2] 方案 B：第二个域名重定向到主域名（推荐）" -ForegroundColor White
Write-Host "    • 所有流量汇集到主域名" -ForegroundColor Gray
Write-Host "    • 适合：品牌统一、SEO 优化" -ForegroundColor Gray
Write-Host "    • 推荐用于大多数场景 ⭐" -ForegroundColor Yellow
Write-Host ""

Write-Host "[3] 只配置主域名" -ForegroundColor White
Write-Host "    • 暂时不配置第二个域名" -ForegroundColor Gray
Write-Host ""

$choice = Read-Host "请选择 (1/2/3)"

Write-Host ""

switch ($choice) {
    "1" {
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
        Write-Host "方案 A：独立配置" -ForegroundColor Green
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray
        
        Write-Host "配置步骤：`n" -ForegroundColor Yellow
        
        Write-Host "第 1 步：配置主域名 ($primaryDomain)" -ForegroundColor Cyan
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
        Write-Host "1. 访问 Cloudflare Dashboard" -ForegroundColor White
        Write-Host "   https://dash.cloudflare.com/`n" -ForegroundColor Blue
        
        Write-Host "2. 点击 [+ Add a Site] 添加：$primaryDomain`n" -ForegroundColor White
        
        Write-Host "3. 选择 Free 计划`n" -ForegroundColor White
        
        Write-Host "4. 添加 DNS 记录：" -ForegroundColor White
        Write-Host "   A    @    185.199.108.153  (Proxied)" -ForegroundColor Gray
        Write-Host "   A    @    185.199.109.153  (Proxied)" -ForegroundColor Gray
        Write-Host "   A    @    185.199.110.153  (Proxied)" -ForegroundColor Gray
        Write-Host "   A    @    185.199.111.153  (Proxied)" -ForegroundColor Gray
        Write-Host "   CNAME www decars-auto.github.io (Proxied)`n" -ForegroundColor Gray
        
        Write-Host "5. 更改域名服务器到 Cloudflare`n" -ForegroundColor White
        
        Write-Host "6. 配置 SSL/TLS：" -ForegroundColor White
        Write-Host "   • Encryption mode: Full" -ForegroundColor Gray
        Write-Host "   • Always Use HTTPS: ON`n" -ForegroundColor Gray
        
        if ($secondaryDomain) {
            Write-Host "`n第 2 步：配置第二个域名 ($secondaryDomain)" -ForegroundColor Cyan
            Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
            Write-Host "1. 返回 Cloudflare Dashboard 首页`n" -ForegroundColor White
            
            Write-Host "2. 再次点击 [+ Add a Site] 添加：$secondaryDomain`n" -ForegroundColor White
            
            Write-Host "3. 选择 Free 计划`n" -ForegroundColor White
            
            Write-Host "4. 添加相同的 DNS 记录：" -ForegroundColor White
            Write-Host "   A    @    185.199.108.153  (Proxied)" -ForegroundColor Gray
            Write-Host "   A    @    185.199.109.153  (Proxied)" -ForegroundColor Gray
            Write-Host "   A    @    185.199.110.153  (Proxied)" -ForegroundColor Gray
            Write-Host "   A    @    185.199.111.153  (Proxied)" -ForegroundColor Gray
            Write-Host "   CNAME www decars-auto.github.io (Proxied)`n" -ForegroundColor Gray
            
            Write-Host "5. 更改域名服务器到 Cloudflare`n" -ForegroundColor White
            
            Write-Host "6. 配置 SSL/TLS（与主域名相同）`n" -ForegroundColor White
        }
        
        Write-Host "`n第 3 步：GitHub Pages 配置" -ForegroundColor Cyan
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
        Write-Host "⚠️  注意：GitHub Pages 只能配置一个域名！`n" -ForegroundColor Yellow
        
        Write-Host "1. 访问 GitHub Pages 设置" -ForegroundColor White
        Write-Host "   https://github.com/DECARS-AUTO/decarsauto-website/settings/pages`n" -ForegroundColor Blue
        
        Write-Host "2. Custom domain 输入主域名：" -ForegroundColor White
        Write-Host "   www.$primaryDomain`n" -ForegroundColor Gray
        
        Write-Host "3. 勾选 Enforce HTTPS`n" -ForegroundColor White
        
        Write-Host "`n⚠️  限制说明：" -ForegroundColor Yellow
        Write-Host "• 只有配置在 GitHub Pages 的域名能正常显示" -ForegroundColor Gray
        Write-Host "• 第二个域名会显示 GitHub 404 页面" -ForegroundColor Gray
        Write-Host "• 建议使用方案 B（重定向）代替`n" -ForegroundColor Gray
    }
    
    "2" {
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
        Write-Host "方案 B：主域名 + 重定向（推荐）⭐" -ForegroundColor Green
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray
        
        Write-Host "架构：" -ForegroundColor Yellow
        Write-Host "  $secondaryDomain ──301重定向──→ www.$primaryDomain (主站)`n" -ForegroundColor Gray
        
        Write-Host "配置步骤：`n" -ForegroundColor Yellow
        
        Write-Host "第 1 步：配置主域名 ($primaryDomain)" -ForegroundColor Cyan
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
        Write-Host "1. 访问 Cloudflare Dashboard" -ForegroundColor White
        Write-Host "   https://dash.cloudflare.com/`n" -ForegroundColor Blue
        
        Write-Host "2. 添加主域名：$primaryDomain`n" -ForegroundColor White
        
        Write-Host "3. 添加 DNS 记录：" -ForegroundColor White
        Write-Host "   A    @    185.199.108.153  (Proxied)" -ForegroundColor Gray
        Write-Host "   A    @    185.199.109.153  (Proxied)" -ForegroundColor Gray
        Write-Host "   A    @    185.199.110.153  (Proxied)" -ForegroundColor Gray
        Write-Host "   A    @    185.199.111.153  (Proxied)" -ForegroundColor Gray
        Write-Host "   CNAME www decars-auto.github.io (Proxied)`n" -ForegroundColor Gray
        
        Write-Host "4. 更改域名服务器`n" -ForegroundColor White
        
        Write-Host "5. 配置 SSL/TLS：Full + Always Use HTTPS`n" -ForegroundColor White
        
        Write-Host "`n第 2 步：配置 GitHub Pages" -ForegroundColor Cyan
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
        Write-Host "1. 访问：" -ForegroundColor White
        Write-Host "   https://github.com/DECARS-AUTO/decarsauto-website/settings/pages`n" -ForegroundColor Blue
        
        Write-Host "2. Custom domain：www.$primaryDomain`n" -ForegroundColor White
        
        Write-Host "3. Enforce HTTPS：✅`n" -ForegroundColor White
        
        if ($secondaryDomain) {
            Write-Host "`n第 3 步：配置第二个域名 ($secondaryDomain) 并设置重定向" -ForegroundColor Cyan
            Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
            
            Write-Host "1. 在 Cloudflare 添加第二个域名：$secondaryDomain`n" -ForegroundColor White
            
            Write-Host "2. 添加简单的 DNS 记录：" -ForegroundColor White
            Write-Host "   A    @    192.0.2.1  (Proxied)  ← 任意 IP" -ForegroundColor Gray
            Write-Host "   CNAME www $secondaryDomain (Proxied)`n" -ForegroundColor Gray
            
            Write-Host "3. 更改域名服务器到 Cloudflare`n" -ForegroundColor White
            
            Write-Host "4. 创建 Page Rule（重要！）：" -ForegroundColor White
            Write-Host "   • 进入：Rules → Page Rules → Create Page Rule" -ForegroundColor Gray
            Write-Host "   • URL pattern：*$secondaryDomain/*" -ForegroundColor Gray
            Write-Host "   • Setting：Forwarding URL" -ForegroundColor Gray
            Write-Host "   • Status Code：301 - Permanent Redirect" -ForegroundColor Gray
            Write-Host "   • Destination：https://www.$primaryDomain/`$2" -ForegroundColor Gray
            Write-Host "   • 点击 Save and Deploy`n" -ForegroundColor Gray
            
            Write-Host "5. 配置 SSL/TLS：Full + Always Use HTTPS`n" -ForegroundColor White
        }
        
        Write-Host "`n✅ 配置完成后的效果：" -ForegroundColor Green
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
        Write-Host "用户访问：http://$primaryDomain" -ForegroundColor White
        Write-Host "  → 重定向到：https://www.$primaryDomain`n" -ForegroundColor Green
        
        if ($secondaryDomain) {
            Write-Host "用户访问：http://$secondaryDomain" -ForegroundColor White
            Write-Host "  → 重定向到：https://www.$primaryDomain`n" -ForegroundColor Green
            
            Write-Host "用户访问：https://www.$secondaryDomain/contact" -ForegroundColor White
            Write-Host "  → 重定向到：https://www.$primaryDomain/contact`n" -ForegroundColor Green
        }
        
        Write-Host "SEO 优势：" -ForegroundColor Yellow
        Write-Host "  ✅ 所有流量汇集到主域名" -ForegroundColor Gray
        Write-Host "  ✅ 避免重复内容问题" -ForegroundColor Gray
        Write-Host "  ✅ 301 重定向传递权重" -ForegroundColor Gray
        Write-Host "  ✅ 统一品牌形象`n" -ForegroundColor Gray
    }
    
    "3" {
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
        Write-Host "单域名配置" -ForegroundColor Green
        Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray
        
        Write-Host "请参考：CLOUDFLARE-VISUAL-GUIDE.txt`n" -ForegroundColor Yellow
        
        Write-Host "快速步骤：" -ForegroundColor Cyan
        Write-Host "1. 访问 https://dash.cloudflare.com/" -ForegroundColor White
        Write-Host "2. 添加域名：$primaryDomain" -ForegroundColor White
        Write-Host "3. 配置 DNS 记录（4 个 A + 1 个 CNAME）" -ForegroundColor White
        Write-Host "4. 更改域名服务器" -ForegroundColor White
        Write-Host "5. 配置 SSL/TLS" -ForegroundColor White
        Write-Host "6. GitHub Pages 设置自定义域名`n" -ForegroundColor White
    }
    
    default {
        Write-Host "无效选择，已退出。`n" -ForegroundColor Red
        exit
    }
}

Write-Host "`n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "下一步操作" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "1️⃣  打开 Cloudflare Dashboard" -ForegroundColor White
$openCloudflare = Read-Host "   现在打开？(y/n)"
if ($openCloudflare -eq "y") {
    Start-Process "https://dash.cloudflare.com/"
}

Write-Host ""
Write-Host "2️⃣  打开 GitHub Pages 设置" -ForegroundColor White
$openGitHub = Read-Host "   现在打开？(y/n)"
if ($openGitHub -eq "y") {
    Start-Process "https://github.com/DECARS-AUTO/decarsauto-website/settings/pages"
}

Write-Host ""
Write-Host "3️⃣  查看详细文档" -ForegroundColor White
Write-Host "   • CLOUDFLARE-MULTI-DOMAIN.txt - 多域名完整指南" -ForegroundColor Gray
Write-Host "   • CLOUDFLARE-VISUAL-GUIDE.txt - 图文配置指南" -ForegroundColor Gray
Write-Host "   • CLOUDFLARE-SETUP-GUIDE.md - 详细技术文档`n" -ForegroundColor Gray

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "配置时间估算" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "操作时间：" -ForegroundColor Cyan
Write-Host "  • 主域名配置：30 分钟" -ForegroundColor Gray
Write-Host "  • 第二个域名配置：15 分钟" -ForegroundColor Gray
Write-Host "  • Page Rule 设置：5 分钟" -ForegroundColor Gray
Write-Host "  • 总计：约 50 分钟`n" -ForegroundColor Gray

Write-Host "等待时间：" -ForegroundColor Cyan
Write-Host "  • DNS 传播：2-24 小时（每个域名）" -ForegroundColor Gray
Write-Host "  • SSL 证书生成：几分钟到几小时" -ForegroundColor Gray
Write-Host "  • 通常 2-4 小时全部完成`n" -ForegroundColor Gray

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "重要提示" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "✅ 推荐方案：" -ForegroundColor Green
Write-Host "   主域名：www.$primaryDomain" -ForegroundColor White
if ($secondaryDomain) {
    Write-Host "   第二个域名：301 重定向到主域名`n" -ForegroundColor White
}

Write-Host "⚠️  注意事项：" -ForegroundColor Yellow
Write-Host "   • GitHub Pages 只支持一个自定义域名" -ForegroundColor Gray
Write-Host "   • 免费计划最多 3 条 Page Rules" -ForegroundColor Gray
Write-Host "   • 每个域名是独立的 Cloudflare 站点" -ForegroundColor Gray
Write-Host "   • 301 重定向对 SEO 最友好`n" -ForegroundColor Gray

Write-Host "💡 SEO 建议：" -ForegroundColor Cyan
Write-Host "   • 选择一个主域名并坚持使用" -ForegroundColor Gray
Write-Host "   • 其他域名重定向到主域名" -ForegroundColor Gray
Write-Host "   • 在 HTML 添加 canonical 标签" -ForegroundColor Gray
Write-Host "   • 提交主域名的 sitemap 到搜索引擎`n" -ForegroundColor Gray

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "验证清单" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "配置完成后，测试以下项目：`n" -ForegroundColor Yellow

Write-Host "主域名 ($primaryDomain)：" -ForegroundColor Cyan
Write-Host "  □ http://$primaryDomain → 重定向到 https://" -ForegroundColor White
Write-Host "  □ https://$primaryDomain → 显示网站" -ForegroundColor White
Write-Host "  □ https://www.$primaryDomain → 显示网站" -ForegroundColor White
Write-Host "  □ SSL 证书有效（绿色锁）`n" -ForegroundColor White

if ($secondaryDomain) {
    Write-Host "第二个域名 ($secondaryDomain)：" -ForegroundColor Cyan
    Write-Host "  □ http://$secondaryDomain → 重定向到主域名" -ForegroundColor White
    Write-Host "  □ https://$secondaryDomain → 重定向到主域名" -ForegroundColor White
    Write-Host "  □ https://www.$secondaryDomain → 重定向到主域名`n" -ForegroundColor White
}

Write-Host "检查命令：`n" -ForegroundColor Yellow
Write-Host "  # 检查 DNS" -ForegroundColor Gray
Write-Host "  nslookup $primaryDomain`n" -ForegroundColor White
if ($secondaryDomain) {
    Write-Host "  nslookup $secondaryDomain`n" -ForegroundColor White
}

Write-Host "  # 检查重定向（PowerShell）" -ForegroundColor Gray
if ($secondaryDomain) {
    Write-Host "  Invoke-WebRequest -Uri http://$secondaryDomain -MaximumRedirection 0`n" -ForegroundColor White
}

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Gray

Write-Host "🎯 现在开始配置吧！祝顺利！" -ForegroundColor Green
Write-Host ""

Write-Host "按任意键退出..." -ForegroundColor DarkGray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
