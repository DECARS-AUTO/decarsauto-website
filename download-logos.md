# 下载汽车品牌Logo指南

## 问题说明
外部CDN链接可能因为网络问题无法加载，建议将logo下载到本地`images/brands/`文件夹。

## 需要下载的Logo

### 1. Volkswagen (大众)
- 来源: https://www.carlogos.org/logo/Volkswagen-logo.png
- 保存为: `images/brands/volkswagen-logo.png`

### 2. Audi (奥迪)
- 来源: https://www.carlogos.org/logo/Audi-logo.png
- 保存为: `images/brands/audi-logo.png`

### 3. Škoda (斯柯达)
- 来源: https://cdn.worldvectorlogo.com/logos/skoda-2.svg
- 保存为: `images/brands/skoda-logo.svg`

### 4. SEAT (西雅特)
- 来源: https://www.carlogos.org/car-logos/seat-logo.png
- 保存为: `images/brands/seat-logo.png`

### 5. Bentley (宾利)
- 来源: https://cdn.worldvectorlogo.com/logos/bentley-2.svg
- 保存为: `images/brands/bentley-logo.svg`

### 6. Lamborghini (兰博基尼)
- 来源: https://www.carlogos.org/logo/Lamborghini-logo.png
- 保存为: `images/brands/lamborghini-logo.png`

### 7. Bugatti (布加迪)
- 来源: https://cdn.worldvectorlogo.com/logos/bugatti-logo.svg
- 保存为: `images/brands/bugatti-logo.svg`

## 手动下载步骤

### Windows系统:
1. 在项目根目录创建文件夹 `images/brands/`
2. 逐个访问上面的链接
3. 右键点击图片 → "图片另存为"
4. 保存到 `images/brands/` 文件夹，使用上面指定的文件名

### 使用PowerShell自动下载:
```powershell
# 在项目根目录打开PowerShell，运行以下命令

# 创建文件夹
New-Item -ItemType Directory -Force -Path "images/brands"

# 下载logos
Invoke-WebRequest -Uri "https://www.carlogos.org/logo/Volkswagen-logo.png" -OutFile "images/brands/volkswagen-logo.png"
Invoke-WebRequest -Uri "https://www.carlogos.org/logo/Audi-logo.png" -OutFile "images/brands/audi-logo.png"
Invoke-WebRequest -Uri "https://cdn.worldvectorlogo.com/logos/skoda-2.svg" -OutFile "images/brands/skoda-logo.svg"
Invoke-WebRequest -Uri "https://www.carlogos.org/car-logos/seat-logo.png" -OutFile "images/brands/seat-logo.png"
Invoke-WebRequest -Uri "https://cdn.worldvectorlogo.com/logos/bentley-2.svg" -OutFile "images/brands/bentley-logo.svg"
Invoke-WebRequest -Uri "https://www.carlogos.org/logo/Lamborghini-logo.png" -OutFile "images/brands/lamborghini-logo.png"
Invoke-WebRequest -Uri "https://cdn.worldvectorlogo.com/logos/bugatti-logo.svg" -OutFile "images/brands/bugatti-logo.svg"

Write-Host "All logos downloaded successfully!" -ForegroundColor Green
```

## 验证下载
下载完成后，检查 `images/brands/` 文件夹应该包含7个文件：
- volkswagen-logo.png
- audi-logo.png
- skoda-logo.svg
- seat-logo.png
- bentley-logo.svg
- lamborghini-logo.png
- bugatti-logo.svg

## 更新完成后
下载完成后，我会更新 `index.html` 文件使用本地图片路径。

## 备用方案：使用其他CDN
如果不想下载到本地，可以使用以下备用CDN：
- jsdelivr: `https://cdn.jsdelivr.net/npm/simple-icons@v9/icons/[brand].svg`
- unpkg: `https://unpkg.com/simple-icons@latest/icons/[brand].svg`

但本地托管是最可靠的方案。
