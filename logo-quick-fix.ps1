# DecarsAuto Logo 快速修复脚本
# 用于解决Logo加载问题

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  Logo 快速修复脚本" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

# 1. 检查文件夹
Write-Host "1. 检查images/brands文件夹..." -ForegroundColor Yellow
if (Test-Path "images/brands") {
    Write-Host "   ✅ images/brands 文件夹存在" -ForegroundColor Green
} else {
    Write-Host "   ❌ images/brands 文件夹不存在，正在创建..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Force -Path "images/brands" | Out-Null
    Write-Host "   ✅ 文件夹已创建" -ForegroundColor Green
}

# 2. 检查Logo文件
Write-Host ""
Write-Host "2. 检查Logo文件..." -ForegroundColor Yellow
$logos = @(
    "volkswagen-logo.png",
    "audi-logo.png",
    "skoda-logo.svg",
    "seat-logo.png",
    "bentley-logo.svg",
    "lamborghini-logo.png",
    "bugatti-logo.svg"
)

$missingFiles = @()
foreach ($logo in $logos) {
    $path = "images/brands/$logo"
    if (Test-Path $path) {
        $size = (Get-Item $path).Length
        $sizeKB = [math]::Round($size / 1KB, 1)
        Write-Host "   ✅ $logo ($sizeKB KB)" -ForegroundColor Green
    } else {
        Write-Host "   ❌ $logo 缺失" -ForegroundColor Red
        $missingFiles += $logo
    }
}

# 3. 如果有缺失文件，提供下载
if ($missingFiles.Count -gt 0) {
    Write-Host ""
    Write-Host "⚠️ 发现 $($missingFiles.Count) 个缺失文件" -ForegroundColor Yellow
    Write-Host "是否现在下载？(Y/N)" -ForegroundColor Yellow
    $response = Read-Host
    
    if ($response -eq "Y" -or $response -eq "y") {
        Write-Host ""
        Write-Host "正在下载缺失的Logo..." -ForegroundColor Cyan
        
        $urls = @{
            "volkswagen-logo.png" = "https://www.carlogos.org/logo/Volkswagen-logo.png"
            "audi-logo.png" = "https://www.carlogos.org/logo/Audi-logo.png"
            "skoda-logo.svg" = "https://cdn.worldvectorlogo.com/logos/skoda-2.svg"
            "seat-logo.png" = "https://www.carlogos.org/car-logos/seat-logo.png"
            "bentley-logo.svg" = "https://cdn.worldvectorlogo.com/logos/bentley-2.svg"
            "lamborghini-logo.png" = "https://www.carlogos.org/logo/Lamborghini-logo.png"
            "bugatti-logo.svg" = "https://cdn.worldvectorlogo.com/logos/bugatti-logo.svg"
        }
        
        foreach ($file in $missingFiles) {
            if ($urls.ContainsKey($file)) {
                try {
                    Write-Host "   下载 $file..." -ForegroundColor Yellow
                    Invoke-WebRequest -Uri $urls[$file] -OutFile "images/brands/$file"
                    Write-Host "   ✅ $file 下载成功" -ForegroundColor Green
                } catch {
                    Write-Host "   ❌ $file 下载失败: $_" -ForegroundColor Red
                }
            }
        }
    }
}

# 4. 验证index.html
Write-Host ""
Write-Host "3. 验证index.html..." -ForegroundColor Yellow
if (Test-Path "index.html") {
    $content = Get-Content "index.html" -Raw
    if ($content -match 'images/brands/volkswagen-logo.png') {
        Write-Host "   ✅ index.html 使用本地logo路径" -ForegroundColor Green
    } else {
        Write-Host "   ❌ index.html 未使用本地logo路径" -ForegroundColor Red
        Write-Host "   提示: 需要更新HTML文件" -ForegroundColor Yellow
    }
} else {
    Write-Host "   ❌ index.html 不存在" -ForegroundColor Red
}

# 5. 生成诊断报告
Write-Host ""
Write-Host "4. 生成诊断HTML..." -ForegroundColor Yellow
if (Test-Path "logo-diagnostic.html") {
    Write-Host "   ✅ logo-diagnostic.html 存在" -ForegroundColor Green
    Write-Host "   提示: 在浏览器中打开此文件进行详细诊断" -ForegroundColor Cyan
} else {
    Write-Host "   ⚠️ logo-diagnostic.html 不存在" -ForegroundColor Yellow
}

# 6. 浏览器缓存清理建议
Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "           修复建议" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "如果Logo文件都正常，但浏览器仍然不显示，请尝试：" -ForegroundColor Yellow
Write-Host ""
Write-Host "  1. 硬刷新页面:" -ForegroundColor White
Write-Host "     • Windows: Ctrl + Shift + R 或 Ctrl + F5" -ForegroundColor Gray
Write-Host "     • Mac: Cmd + Shift + R" -ForegroundColor Gray
Write-Host ""
Write-Host "  2. 清除浏览器缓存:" -ForegroundColor White
Write-Host "     • Chrome: Ctrl + Shift + Delete" -ForegroundColor Gray
Write-Host "     • 选择 '缓存的图片和文件'" -ForegroundColor Gray
Write-Host "     • 点击 '清除数据'" -ForegroundColor Gray
Write-Host ""
Write-Host "  3. 使用无痕/隐私模式:" -ForegroundColor White
Write-Host "     • Chrome: Ctrl + Shift + N" -ForegroundColor Gray
Write-Host "     • Firefox: Ctrl + Shift + P" -ForegroundColor Gray
Write-Host ""
Write-Host "  4. 打开诊断页面:" -ForegroundColor White
Write-Host "     • 用浏览器打开 logo-diagnostic.html" -ForegroundColor Gray
Write-Host "     • 查看详细的加载测试结果" -ForegroundColor Gray
Write-Host ""
Write-Host "  5. 检查浏览器控制台:" -ForegroundColor White
Write-Host "     • 按 F12 打开开发者工具" -ForegroundColor Gray
Write-Host "     • 切换到 Console 标签" -ForegroundColor Gray
Write-Host "     • 查找红色错误信息" -ForegroundColor Gray
Write-Host ""

# 7. 快速操作选项
Write-Host "快速操作:" -ForegroundColor Cyan
Write-Host "  [1] 打开 logo-diagnostic.html" -ForegroundColor White
Write-Host "  [2] 打开 index.html" -ForegroundColor White
Write-Host "  [3] 打开 test-logos.html" -ForegroundColor White
Write-Host "  [4] 在文件资源管理器中打开 images/brands" -ForegroundColor White
Write-Host "  [5] 重新下载所有Logo" -ForegroundColor White
Write-Host "  [Q] 退出" -ForegroundColor White
Write-Host ""
$action = Read-Host "请选择操作 (1-5 或 Q)"

switch ($action) {
    "1" {
        if (Test-Path "logo-diagnostic.html") {
            Start-Process "logo-diagnostic.html"
            Write-Host "✅ 已在浏览器中打开诊断页面" -ForegroundColor Green
        } else {
            Write-Host "❌ logo-diagnostic.html 不存在" -ForegroundColor Red
        }
    }
    "2" {
        if (Test-Path "index.html") {
            Start-Process "index.html"
            Write-Host "✅ 已在浏览器中打开主页" -ForegroundColor Green
        } else {
            Write-Host "❌ index.html 不存在" -ForegroundColor Red
        }
    }
    "3" {
        if (Test-Path "test-logos.html") {
            Start-Process "test-logos.html"
            Write-Host "✅ 已在浏览器中打开Logo测试页面" -ForegroundColor Green
        } else {
            Write-Host "❌ test-logos.html 不存在" -ForegroundColor Red
        }
    }
    "4" {
        if (Test-Path "images/brands") {
            Start-Process "images/brands"
            Write-Host "✅ 已打开文件夹" -ForegroundColor Green
        } else {
            Write-Host "❌ images/brands 文件夹不存在" -ForegroundColor Red
        }
    }
    "5" {
        Write-Host ""
        Write-Host "正在重新下载所有Logo..." -ForegroundColor Cyan
        
        $urls = @{
            "volkswagen-logo.png" = "https://www.carlogos.org/logo/Volkswagen-logo.png"
            "audi-logo.png" = "https://www.carlogos.org/logo/Audi-logo.png"
            "skoda-logo.svg" = "https://cdn.worldvectorlogo.com/logos/skoda-2.svg"
            "seat-logo.png" = "https://www.carlogos.org/car-logos/seat-logo.png"
            "bentley-logo.svg" = "https://cdn.worldvectorlogo.com/logos/bentley-2.svg"
            "lamborghini-logo.png" = "https://www.carlogos.org/logo/Lamborghini-logo.png"
            "bugatti-logo.svg" = "https://cdn.worldvectorlogo.com/logos/bugatti-logo.svg"
        }
        
        foreach ($file in $urls.Keys) {
            try {
                Write-Host "   下载 $file..." -ForegroundColor Yellow
                Invoke-WebRequest -Uri $urls[$file] -OutFile "images/brands/$file"
                Write-Host "   ✅ $file" -ForegroundColor Green
            } catch {
                Write-Host "   ❌ $file 失败" -ForegroundColor Red
            }
        }
        
        Write-Host ""
        Write-Host "✅ 重新下载完成！" -ForegroundColor Green
        Write-Host "请刷新浏览器 (Ctrl+Shift+R)" -ForegroundColor Cyan
    }
    default {
        Write-Host "退出" -ForegroundColor Gray
    }
}

Write-Host ""
Write-Host "按任意键退出..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
