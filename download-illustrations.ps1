# ╔══════════════════════════════════════════════════════════════════════════╗
# ║ DecarsAuto 网站插图下载脚本                                                  ║
# ║ Download professional illustrations for DecarsAuto website                ║
# ╚══════════════════════════════════════════════════════════════════════════╝

Write-Host ""
Write-Host "╔══════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║         DecarsAuto 插图下载工具 - Illustration Downloader                 ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# 创建插图目录
$illustrationDir = "images/illustrations"
if (!(Test-Path $illustrationDir)) {
    New-Item -ItemType Directory -Path $illustrationDir -Force | Out-Null
    Write-Host "✅ 已创建目录: $illustrationDir" -ForegroundColor Green
} else {
    Write-Host "✅ 目录已存在: $illustrationDir" -ForegroundColor Green
}

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray
Write-Host ""

# 插图资源列表
$illustrations = @(
    @{
        Name = "Hero 主页插图 - 工程师编程"
        Url = "https://raw.githubusercontent.com/unDraw/illustrations/master/svg/programming.svg"
        FileName = "hero-programming.svg"
        Description = "程序员在电脑前工作的插图"
    },
    @{
        Name = "备用 Hero 插图 - 开发者活动"
        Url = "https://raw.githubusercontent.com/unDraw/illustrations/master/svg/developer-activity.svg"
        FileName = "hero-developer.svg"
        Description = "开发者工作的场景插图"
    },
    @{
        Name = "备用 Hero 插图 - 工程师"
        Url = "https://raw.githubusercontent.com/unDraw/illustrations/master/svg/engineer.svg"
        FileName = "hero-engineer.svg"
        Description = "工程师技术工作插图"
    }
)

$successCount = 0
$failCount = 0

foreach ($illustration in $illustrations) {
    Write-Host "📥 正在下载: $($illustration.Name)" -ForegroundColor Yellow
    Write-Host "   URL: $($illustration.Url)" -ForegroundColor DarkGray
    
    $outputPath = Join-Path $illustrationDir $illustration.FileName
    
    try {
        # 下载文件
        $ProgressPreference = 'SilentlyContinue'  # 禁用进度条以加快下载
        Invoke-WebRequest -Uri $illustration.Url -OutFile $outputPath -ErrorAction Stop
        
        # 检查文件是否成功下载
        if (Test-Path $outputPath) {
            $fileSize = (Get-Item $outputPath).Length
            
            if ($fileSize -gt 0) {
                $fileSizeKB = [math]::Round($fileSize / 1KB, 2)
                Write-Host "   ✅ 下载成功: $($illustration.FileName) ($fileSizeKB KB)" -ForegroundColor Green
                Write-Host "   📄 描述: $($illustration.Description)" -ForegroundColor DarkGray
                $successCount++
            } else {
                Write-Host "   ❌ 文件大小为 0, 下载失败" -ForegroundColor Red
                $failCount++
            }
        } else {
            Write-Host "   ❌ 文件不存在, 下载失败" -ForegroundColor Red
            $failCount++
        }
    }
    catch {
        Write-Host "   ❌ 下载出错: $($_.Exception.Message)" -ForegroundColor Red
        $failCount++
    }
    
    Write-Host ""
}

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray
Write-Host ""

# 显示统计信息
Write-Host "╔═══════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  下载统计 / Download Statistics                            ║" -ForegroundColor Cyan
Write-Host "╠═══════════════════════════════════════════════════════════╣" -ForegroundColor Cyan
Write-Host "║  ✅ 成功下载: $successCount 个文件                            " -ForegroundColor Green
Write-Host "║  ❌ 下载失败: $failCount 个文件                               " -ForegroundColor $(if ($failCount -gt 0) { "Red" } else { "Green" })
Write-Host "╚═══════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

if ($failCount -gt 0) {
    Write-Host "⚠️  部分文件下载失败，请检查:" -ForegroundColor Yellow
    Write-Host "   1. 网络连接是否正常" -ForegroundColor Yellow
    Write-Host "   2. URL 是否可访问" -ForegroundColor Yellow
    Write-Host "   3. 防火墙或代理设置" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "💡 备选方案:" -ForegroundColor Cyan
    Write-Host "   可以手动从以下网站下载插图:" -ForegroundColor Cyan
    Write-Host "   • unDraw: https://undraw.co/illustrations" -ForegroundColor White
    Write-Host "   • Storyset: https://storyset.com/" -ForegroundColor White
    Write-Host "   • Freepik: https://www.freepik.com/" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host "🎉 所有插图下载成功！" -ForegroundColor Green
    Write-Host ""
    Write-Host "📋 下一步:" -ForegroundColor Cyan
    Write-Host "   1. 打开 index.html 查看已添加的插图" -ForegroundColor White
    Write-Host "   2. 刷新浏览器查看效果 (Ctrl + Shift + R)" -ForegroundColor White
    Write-Host "   3. 如需更改插图，替换 $illustrationDir 中的文件" -ForegroundColor White
    Write-Host ""
}

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray
Write-Host ""
Write-Host "📂 插图存储位置: $(Resolve-Path $illustrationDir)" -ForegroundColor Cyan
Write-Host "📖 详细说明: 插图实现方案.md" -ForegroundColor Cyan
Write-Host ""
