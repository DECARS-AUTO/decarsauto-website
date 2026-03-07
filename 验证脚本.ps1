# DecarsAuto 网站验证脚本
# 用于快速检查所有改进是否正确部署

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  DecarsAuto 网站验证脚本" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

$errors = 0
$warnings = 0
$success = 0

# 1. 检查关键文件
Write-Host "1. 检查关键文件..." -ForegroundColor Yellow

$requiredFiles = @(
    "index.html",
    "styles.css",
    "script.js",
    "enhancements.js"
)

foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "   ✅ $file 存在" -ForegroundColor Green
        $success++
    } else {
        Write-Host "   ❌ $file 缺失" -ForegroundColor Red
        $errors++
    }
}

# 2. 检查品牌Logo
Write-Host ""
Write-Host "2. 检查品牌Logo..." -ForegroundColor Yellow

$logos = @(
    "images/brands/volkswagen-logo.png",
    "images/brands/audi-logo.png",
    "images/brands/skoda-logo.svg",
    "images/brands/seat-logo.png",
    "images/brands/bentley-logo.svg",
    "images/brands/lamborghini-logo.png",
    "images/brands/bugatti-logo.svg"
)

$logoCount = 0
foreach ($logo in $logos) {
    if (Test-Path $logo) {
        $logoCount++
        $size = (Get-Item $logo).Length
        $sizeKB = [math]::Round($size / 1KB, 1)
        Write-Host "   ✅ $(Split-Path $logo -Leaf) ($sizeKB KB)" -ForegroundColor Green
        $success++
    } else {
        Write-Host "   ❌ $(Split-Path $logo -Leaf) 缺失" -ForegroundColor Red
        $errors++
    }
}

# 3. 检查测试页面
Write-Host ""
Write-Host "3. 检查测试页面..." -ForegroundColor Yellow

$testFiles = @(
    "test-enhancements.html",
    "test-logos.html"
)

foreach ($file in $testFiles) {
    if (Test-Path $file) {
        Write-Host "   ✅ $file 存在" -ForegroundColor Green
        $success++
    } else {
        Write-Host "   ⚠️ $file 不存在（可选）" -ForegroundColor Yellow
        $warnings++
    }
}

# 4. 检查文档
Write-Host ""
Write-Host "4. 检查文档..." -ForegroundColor Yellow

$docs = @(
    "README-improvements.md",
    "改进总结.md",
    "DEPLOYMENT-CHECKLIST.md",
    "logo-fix-summary.md",
    "完整改进报告.md"
)

foreach ($doc in $docs) {
    if (Test-Path $doc) {
        Write-Host "   ✅ $doc 存在" -ForegroundColor Green
        $success++
    } else {
        Write-Host "   ⚠️ $doc 不存在（可选）" -ForegroundColor Yellow
        $warnings++
    }
}

# 5. 检查index.html内容
Write-Host ""
Write-Host "5. 检查index.html内容..." -ForegroundColor Yellow

if (Test-Path "index.html") {
    $content = Get-Content "index.html" -Raw
    
    # 检查是否使用本地logo路径
    if ($content -match 'images/brands/volkswagen-logo.png') {
        Write-Host "   ✅ 使用本地logo路径" -ForegroundColor Green
        $success++
    } else {
        Write-Host "   ❌ 未使用本地logo路径" -ForegroundColor Red
        $errors++
    }
    
    # 检查是否添加了返回顶部按钮
    if ($content -match 'id="back-to-top"') {
        Write-Host "   ✅ 包含返回顶部按钮" -ForegroundColor Green
        $success++
    } else {
        Write-Host "   ❌ 缺少返回顶部按钮" -ForegroundColor Red
        $errors++
    }
    
    # 检查是否引用了enhancements.js
    if ($content -match 'enhancements.js') {
        Write-Host "   ✅ 引用了enhancements.js" -ForegroundColor Green
        $success++
    } else {
        Write-Host "   ❌ 未引用enhancements.js" -ForegroundColor Red
        $errors++
    }
} else {
    Write-Host "   ❌ index.html不存在" -ForegroundColor Red
    $errors += 3
}

# 6. 检查enhancements.js内容
Write-Host ""
Write-Host "6. 检查enhancements.js功能..." -ForegroundColor Yellow

if (Test-Path "enhancements.js") {
    $content = Get-Content "enhancements.js" -Raw
    
    $features = @{
        "返回顶部" = "back-to-top"
        "滚动动画" = "Scroll Animations"
        "懒加载" = "Lazy Loading"
        "平滑滚动" = "Smooth Scroll"
        "性能监控" = "Performance"
    }
    
    foreach ($feature in $features.Keys) {
        if ($content -match $features[$feature]) {
            Write-Host "   ✅ 包含$feature功能" -ForegroundColor Green
            $success++
        } else {
            Write-Host "   ❌ 缺少$feature功能" -ForegroundColor Red
            $errors++
        }
    }
} else {
    Write-Host "   ❌ enhancements.js不存在" -ForegroundColor Red
    $errors += 5
}

# 7. 检查styles.css
Write-Host ""
Write-Host "7. 检查styles.css样式..." -ForegroundColor Yellow

if (Test-Path "styles.css") {
    $content = Get-Content "styles.css" -Raw
    
    $styles = @{
        "返回顶部样式" = ".back-to-top"
        "淡入动画" = ".fade-in"
        "悬停效果" = "hover"
    }
    
    foreach ($style in $styles.Keys) {
        if ($content -match [regex]::Escape($styles[$style])) {
            Write-Host "   ✅ 包含$style" -ForegroundColor Green
            $success++
        } else {
            Write-Host "   ❌ 缺少$style" -ForegroundColor Red
            $errors++
        }
    }
} else {
    Write-Host "   ❌ styles.css不存在" -ForegroundColor Red
    $errors += 3
}

# 8. Git状态检查
Write-Host ""
Write-Host "8. Git状态..." -ForegroundColor Yellow

try {
    $gitStatus = git status --short 2>&1
    if ($LASTEXITCODE -eq 0) {
        if ($gitStatus) {
            Write-Host "   ⚠️ 有未提交的更改" -ForegroundColor Yellow
            Write-Host "   提示: 运行 'git add . && git commit -m ""Update""' 提交更改" -ForegroundColor Gray
            $warnings++
        } else {
            Write-Host "   ✅ Git仓库干净" -ForegroundColor Green
            $success++
        }
    } else {
        Write-Host "   ⚠️ 不是Git仓库或Git未安装" -ForegroundColor Yellow
        $warnings++
    }
} catch {
    Write-Host "   ⚠️ 无法检查Git状态" -ForegroundColor Yellow
    $warnings++
}

# 最终报告
Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "           验证结果" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "   ✅ 成功: $success" -ForegroundColor Green
Write-Host "   ⚠️ 警告: $warnings" -ForegroundColor Yellow
Write-Host "   ❌ 错误: $errors" -ForegroundColor Red
Write-Host ""

if ($errors -eq 0) {
    Write-Host "🎉 太棒了！所有关键检查都通过了！" -ForegroundColor Green
    Write-Host ""
    Write-Host "下一步:" -ForegroundColor Cyan
    Write-Host "  1. 在浏览器中打开 index.html 测试" -ForegroundColor White
    Write-Host "  2. 检查 test-logos.html 验证logo" -ForegroundColor White
    Write-Host "  3. 查看 test-enhancements.html 测试功能" -ForegroundColor White
    Write-Host "  4. 参考 DEPLOYMENT-CHECKLIST.md 部署" -ForegroundColor White
    Write-Host ""
    Write-Host "✅ 网站已准备好部署到生产环境！" -ForegroundColor Green
} elseif ($errors -le 3) {
    Write-Host "⚠️ 有一些小问题需要修复" -ForegroundColor Yellow
    Write-Host "请查看上面的错误信息并修复" -ForegroundColor Yellow
} else {
    Write-Host "❌ 发现多个错误，请修复后再部署" -ForegroundColor Red
    Write-Host "建议重新运行设置步骤" -ForegroundColor Red
}

Write-Host ""
Write-Host "按任意键退出..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
