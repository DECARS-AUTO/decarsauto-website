# 背景图片配置指南

## ✅ 已完成配置

已为以下5个部分添加了背景图片支持：

1. **支持品牌 (Brands)** - `brands-bg.jpg`
2. **核心服务 (Services)** - `services-bg.jpg`
3. **远程服务流程 (Workflow)** - `workflow-bg.jpg`
4. **信任保障 (Trust)** - `trust-bg.jpg`
5. **联系我们 (Contact)** - `contact-bg.jpg`

## 📁 图片文件位置

请将背景图片放置在：
```
images/
├── brands-bg.jpg        # 支持品牌背景
├── services-bg.jpg      # 核心服务背景
├── workflow-bg.jpg      # 远程服务流程背景
├── trust-bg.jpg         # 信任保障背景
└── contact-bg.jpg       # 联系我们背景
```

## 🎨 背景图片特性

### 自动应用的效果：
- ✅ **半透明叠加**：图片会被半透明的颜色层覆盖，保持文字清晰可读
- ✅ **视差滚动**：使用 `background-attachment: fixed` 实现视差效果
- ✅ **深色模式适配**：深色模式下自动调整叠加层颜色
- ✅ **响应式**：自动适配不同屏幕尺寸

### 叠加透明度：
- **浅色背景部分**（Brands, Workflow, Contact）：95% 不透明度
- **白色背景部分**（Services, Trust）：97% 不透明度

## 📷 推荐图片规格

### 尺寸建议：
- **最小宽度**：1920px
- **最小高度**：1080px
- **格式**：JPG（优化文件大小）或 PNG
- **文件大小**：建议 < 500KB（经过压缩）

### 内容建议：

#### 1. **brands-bg.jpg** - 支持品牌
- 汽车品牌相关
- VAG 集团车辆
- 现代科技感

#### 2. **services-bg.jpg** - 核心服务
- ECU 编程界面
- ODIS/VCDS 软件界面
- 诊断工具

#### 3. **workflow-bg.jpg** - 远程服务流程
- 远程桌面连接
- 技术支持场景
- 流程图背景

#### 4. **trust-bg.jpg** - 信任保障
- 安全徽章
- 认证标志
- 专业团队

#### 5. **contact-bg.jpg** - 联系我们
- 客户服务
- 通讯工具图标
- 全球服务网络

## 🔧 如何添加图片

### 方法 1：使用建议的图片

1. 准备5张背景图片
2. 将它们重命名为对应的文件名
3. 放入 `images/` 文件夹
4. 提交并推送到 GitHub：
```powershell
git add images/*-bg.png
git commit -m "Add background images for sections"
git push origin main
```

### 方法 2：暂时禁用背景（使用纯色）

如果暂时没有图片，可以移除 HTML 中的 `with-background` 类：

```html
<!-- 改为不带背景的版本 -->
<section id="brands" class="brands">
```

### 方法 3：使用在线图片

可以修改 CSS 中的图片路径为在线 URL：

```css
.brands.with-background {
    background-image: linear-gradient(rgba(248, 248, 248, 0.95), rgba(248, 248, 248, 0.95)), 
                      url('https://example.com/brands-bg.jpg');
}
```

## 🎯 优化建议

### 图片优化工具：
- [TinyPNG](https://tinypng.com/) - 压缩 PNG/JPG
- [Squoosh](https://squoosh.app/) - Google 图片优化工具
- [Compressor.io](https://compressor.io/) - 在线压缩

### 性能优化：
1. **使用 WebP 格式**（更好的压缩）
2. **懒加载**（滚动时加载）
3. **CDN 托管**（更快的加载速度）

## 🔄 切换背景开关

如果你想要**可选的背景**，可以通过 JavaScript 控制：

```javascript
// 启用背景
document.querySelector('.brands').classList.add('with-background');

// 禁用背景
document.querySelector('.brands').classList.remove('with-background');
```

## 📱 移动端适配

背景在移动设备上会自动适配：
- **视差效果在移动端会禁用**（提升性能）
- **背景图片自动缩放**以适应屏幕
- **保持文字清晰可读**

## 🌙 深色模式

背景图片在深色模式下会自动调整：
- 叠加层从浅色变为深色
- 保持与深色主题的一致性
- 文字仍然清晰可读

## ❓ 常见问题

### Q: 图片不显示怎么办？
A: 检查以下几点：
1. 文件路径是否正确（`images/brands-bg.jpg`）
2. 文件名是否完全匹配（区分大小写）
3. 文件是否已上传到服务器
4. 浏览器控制台是否有404错误

### Q: 图片太大，加载慢？
A: 
1. 压缩图片到 < 500KB
2. 使用 WebP 格式
3. 考虑使用 CDN

### Q: 如何临时禁用背景？
A: 在 HTML 中移除 `with-background` 类即可

### Q: 可以使用其他图片格式吗？
A: 可以！支持 JPG, PNG, WebP, SVG

## 📝 示例代码

如果你已经有图片，只需确保文件名正确：

```bash
images/
├── brands-bg.png        # ✅ 正确
├── Brands-bg.png        # ❌ 错误（大写B）
├── brands_bg.png        # ❌ 错误（下划线）
├── brands-background.png # ❌ 错误（名称不匹配）
└── brands-bg.jpg        # ⚠️  如果用 JPG 需要修改 CSS
```

## 🚀 部署后效果

部署到 Cloudflare Pages 后，背景图片会：
1. 通过 CDN 全球加速
2. 自动缓存（1年）
3. 自动优化传输

## ✨ 最终效果

- **视觉层次**：增强页面深度
- **品牌形象**：提升专业感
- **用户体验**：更加生动有趣
- **性能优化**：不影响加载速度

---

如果需要帮助选择或优化图片，请随时联系！
