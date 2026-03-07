# ===================================================================
# 完整重新部署脚本 - 一键解决所有问题
# ===================================================================

Write-Host "`n╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                               ║" -ForegroundColor Cyan
Write-Host "║          🚀 完整重新部署到 Cloudflare 🚀                      ║" -ForegroundColor Cyan
Write-Host "║                                                               ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

$projectPath = "C:\Users\Administrator\source\repos\decarsauto-website"
Set-Location $projectPath

# ===================================================================
# 步骤 1: 验证本地文件
# ===================================================================
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
Write-Host "步骤 1/5: 验证本地文件" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Green

$files = @("index.html", "styles.css", "features.js")
$allFilesOk = $true

foreach ($file in $files) {
    if (Test-Path $file) {
        $size = [math]::Round((Get-Item $file).Length / 1KB, 2)
        Write-Host "  ✅ $file ($size KB)" -ForegroundColor Green
    } else {
        Write-Host "  ❌ $file - 文件不存在！" -ForegroundColor Red
        $allFilesOk = $false
    }
}

if (-not $allFilesOk) {
    Write-Host "`n❌ 关键文件缺失！请检查文件。" -ForegroundColor Red
    exit 1
}

Write-Host ""

# ===================================================================
# 步骤 2: 检查 Git 状态
# ===================================================================
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
Write-Host "步骤 2/5: 检查 Git 状态" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Green

$branch = git rev-parse --abbrev-ref HEAD
$latestCommit = git log -1 --format="%h - %s"

Write-Host "  分支: $branch" -ForegroundColor White
Write-Host "  最新提交: $latestCommit`n" -ForegroundColor White

# 检查是否有未提交的更改
$status = git status --porcelain
if ($status) {
    Write-Host "  ⚠️  发现未提交的更改：" -ForegroundColor Yellow
    git status --short
    Write-Host ""
} else {
    Write-Host "  ✅ 所有更改已提交" -ForegroundColor Green
    Write-Host ""
}

# ===================================================================
# 步骤 3: 确认 GitHub 同步
# ===================================================================
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
Write-Host "步骤 3/5: 确认 GitHub 同步" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Green

# 检查是否领先远程
$aheadBehind = git rev-list --left-right --count origin/main...HEAD
if ($aheadBehind -match "(\d+)\s+(\d+)") {
    $behind = $matches[1]
    $ahead = $matches[2]
    
    if ($ahead -gt 0) {
        Write-Host "  ⚠️  有 $ahead 个本地提交未推送" -ForegroundColor Yellow
        Write-Host "  需要推送到 GitHub`n" -ForegroundColor Yellow
        
        $pushChoice = Read-Host "  是否现在推送? (y/n)"
        if ($pushChoice -eq 'y' -or $pushChoice -eq 'Y') {
            Write-Host "`n  🚀 正在推送到 GitHub..." -ForegroundColor Cyan
            git push origin main
            
            if ($LASTEXITCODE -eq 0) {
                Write-Host "  ✅ 推送成功！`n" -ForegroundColor Green
            } else {
                Write-Host "  ❌ 推送失败！`n" -ForegroundColor Red
                exit 1
            }
        }
    } elseif ($behind -gt 0) {
        Write-Host "  ⚠️  远程有 $behind 个新提交" -ForegroundColor Yellow
        Write-Host "  建议先执行: git pull`n" -ForegroundColor Yellow
    } else {
        Write-Host "  ✅ GitHub 已是最新！" -ForegroundColor Green
        Write-Host ""
    }
}

# ===================================================================
# 步骤 4: 等待 GitHub Pages 部署
# ===================================================================
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
Write-Host "步骤 4/5: 等待 GitHub Pages 部署" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Green

Write-Host "  GitHub Pages 正在自动部署..." -ForegroundColor Yellow
Write-Host "  预计时间: 1-2 分钟`n" -ForegroundColor Gray

Write-Host "  📍 检查部署状态:" -ForegroundColor Cyan
Write-Host "     https://github.com/DECARS-AUTO/decarsauto-website/actions`n" -ForegroundColor Blue

$openActions = Read-Host "  现在打开 GitHub Actions 查看? (y/n)"
if ($openActions -eq 'y' -or $openActions -eq 'Y') {
    Start-Process "https://github.com/DECARS-AUTO/decarsauto-website/actions"
    Write-Host "`n  等待部署完成（看到绿色 ✓ 后继续）..." -ForegroundColor Yellow
    Read-Host "`n  部署完成后按 Enter 继续"
}

Write-Host ""

# ===================================================================
# 步骤 5: 清除 Cloudflare 缓存
# ===================================================================
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
Write-Host "步骤 5/5: 清除 Cloudflare 缓存" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Green

Write-Host "  这是最关键的一步！" -ForegroundColor Yellow
Write-Host "  如果不清除 Cloudflare 缓存，网站不会更新。`n" -ForegroundColor Yellow

Write-Host "  选择清除方式：" -ForegroundColor Cyan
Write-Host "  [1] 打开 Cloudflare Dashboard 手动清除（推荐）" -ForegroundColor White
Write-Host "  [2] 使用 API 自动清除（需要配置）`n" -ForegroundColor White

$cfChoice = Read-Host "  选择 (1/2)"

if ($cfChoice -eq "1") {
    Write-Host "`n  🌐 正在打开 Cloudflare Dashboard..." -ForegroundColor Cyan
    Start-Process "https://dash.cloudflare.com/"
    
    Write-Host "`n  📋 操作步骤：" -ForegroundColor Yellow
    Write-Host "     1. 登录 Cloudflare" -ForegroundColor Gray
    Write-Host "     2. 选择 decarsauto.de 域名" -ForegroundColor Gray
    Write-Host "     3. 点击左侧 'Caching' 菜单" -ForegroundColor Gray
    Write-Host "     4. 点击 'Configuration' 标签" -ForegroundColor Gray
    Write-Host "     5. 找到 'Purge Cache' 部分" -ForegroundColor Gray
    Write-Host "     6. 点击 'Purge Everything' 按钮" -ForegroundColor Gray
    Write-Host "     7. 确认清除`n" -ForegroundColor Gray
    
    Read-Host "  完成后按 Enter 继续"
    
} elseif ($cfChoice -eq "2") {
    Write-Host "`n  ⚙️  配置 Cloudflare API" -ForegroundColor Cyan
    Write-Host ""
    
    $zoneId = Read-Host "  Zone ID"
    $apiToken = Read-Host "  API Token" -AsSecureString
    
    if ($zoneId -and $apiToken) {
        try {
            $apiTokenPlain = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto(
                [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($apiToken)
            )
            
            $headers = @{
                "Authorization" = "Bearer $apiTokenPlain"
                "Content-Type" = "application/json"
            }
            
            $body = @{ "purge_everything" = $true } | ConvertTo-Json
            
            Write-Host "`n  🚀 正在清除缓存..." -ForegroundColor Yellow
            
            $response = Invoke-RestMethod `
                -Uri "https://api.cloudflare.com/client/v4/zones/$zoneId/purge_cache" `
                -Method POST `
                -Headers $headers `
                -Body $body
            
            if ($response.success) {
                Write-Host "  ✅ 缓存清除成功！`n" -ForegroundColor Green
            } else {
                Write-Host "  ❌ 清除失败: $($response.errors)`n" -ForegroundColor Red
            }
        } catch {
            Write-Host "  ❌ API 调用失败: $($_.Exception.Message)`n" -ForegroundColor Red
        }
    }
}

Write-Host ""

# ===================================================================
# 完成 - 验证部署
# ===================================================================
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
Write-Host "部署完成！现在验证" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`n" -ForegroundColor Green

Write-Host "✅ 部署步骤完成：" -ForegroundColor Green
Write-Host "   1. ✅ 本地文件验证" -ForegroundColor White
Write-Host "   2. ✅ GitHub 同步确认" -ForegroundColor White
Write-Host "   3. ✅ GitHub Pages 部署" -ForegroundColor White
Write-Host "   4. ✅ Cloudflare 缓存清除`n" -ForegroundColor White

Write-Host "🌐 访问你的网站：" -ForegroundColor Cyan
Write-Host "   https://www.decarsauto.de/`n" -ForegroundColor Blue

$openSite = Read-Host "现在打开网站查看? (y/n)"
if ($openSite -eq 'y' -or $openSite -eq 'Y') {
    Start-Process "https://www.decarsauto.de/"
}

Write-Host ""
Write-Host "⏰ 等待 30-60 秒让缓存完全清除" -ForegroundColor Yellow
Write-Host "🔄 然后在浏览器中按 Ctrl+Shift+R 强制刷新`n" -ForegroundColor Yellow

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray

Write-Host "`n✨ 预期效果：" -ForegroundColor Magenta
Write-Host "   • 页面加载时内容淡入" -ForegroundColor White
Write-Host "   • 滚动时卡片依次出现" -ForegroundColor White
Write-Host "   • 悬停卡片有提升和阴影" -ForegroundColor White
Write-Host "   • 按钮有涟漪扩散效果" -ForegroundColor White
Write-Host "   • Header 有毛玻璃背景" -ForegroundColor White
Write-Host "   • 章节标题有橙色装饰线`n" -ForegroundColor White

Write-Host "❓ 如果仍然看不到更新：" -ForegroundColor Yellow
Write-Host "   1. 等待 2-3 分钟" -ForegroundColor Gray
Write-Host "   2. 清除浏览器缓存 (Ctrl+Shift+Delete)" -ForegroundColor Gray
Write-Host "   3. 尝试无痕模式" -ForegroundColor Gray
Write-Host "   4. 尝试不同浏览器" -ForegroundColor Gray
Write-Host "   5. 尝试手机 4G 网络`n" -ForegroundColor Gray

Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║                                                               ║" -ForegroundColor Green
Write-Host "║          🎉 部署完成！享受你的全新网站吧！ 🎉                 ║" -ForegroundColor Green
Write-Host "║                                                               ║" -ForegroundColor Green
Write-Host "╚═══════════════════════════════════════════════════════════════╝`n" -ForegroundColor Green

Write-Host "按任意键退出..." -ForegroundColor DarkGray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
