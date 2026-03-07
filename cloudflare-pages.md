# Cloudflare Pages 部署指南

## 方法 1: 通过 Git 自动部署（推荐）

### 步骤 1: 连接 Git 仓库
1. 登录 [Cloudflare Dashboard](https://dash.cloudflare.com)
2. 选择 **Pages** → **Create a project**
3. 连接你的 Git 仓库（GitHub/GitLab）
4. 选择你的仓库

### 步骤 2: 配置构建设置
- **Framework preset**: None (静态网站)
- **Build command**: 留空（不要填写任何命令）
- **Build output directory**: `/`（或留空）
- **Root directory**: `/`（留空）

**重要提示**：
- ❌ 不要设置 Build command
- ❌ 不要使用 `npx wrangler deploy`
- ✅ 让 Cloudflare 直接部署静态文件

### 步骤 3: 部署
- 点击 **Save and Deploy**
- Cloudflare 会自动部署你的网站

## 方法 2: 使用 Wrangler CLI 部署

### 安装 Wrangler
```powershell
npm install -g wrangler
```

### 登录 Cloudflare
```powershell
wrangler login
```

### 部署网站
```powershell
wrangler pages deploy . --project-name=decarsauto
```

## 方法 3: 直接上传

### 步骤 1: 创建项目
1. 登录 [Cloudflare Dashboard](https://dash.cloudflare.com)
2. 选择 **Pages** → **Create a project**
3. 选择 **Upload assets**

### 步骤 2: 上传文件
- 将所有 HTML、CSS、JS 文件拖拽到上传区域
- 点击 **Deploy site**

## 配置自定义域名 (decarsauto.com)

### 步骤 1: 添加域名到 Cloudflare
1. 登录 [Cloudflare Dashboard](https://dash.cloudflare.com)
2. 点击 **Add a site**
3. 输入 `decarsauto.com`
4. 选择免费计划
5. 更新你的域名服务商的 Nameservers 为 Cloudflare 提供的 NS 记录

### 步骤 2: 连接域名到 Pages
1. 进入你的 Pages 项目
2. 选择 **Custom domains**
3. 点击 **Set up a custom domain**
4. 添加 `decarsauto.com` 和 `www.decarsauto.com`

### DNS 设置
域名在 Cloudflare 管理后会自动配置：
- **主域名**: `decarsauto.com` → CNAME → your-project.pages.dev
- **WWW**: `www.decarsauto.com` → CNAME → your-project.pages.dev
- Cloudflare 会自动处理 SSL 证书

### 推荐设置
- ✅ 使用 `decarsauto.com` 作为主域名
- ✅ 将 `www.decarsauto.com` 重定向到主域名（已在 _redirects 配置）

## 配置说明

### _headers 文件
- 配置 HTTP 安全头
- 设置缓存策略
- 已为你创建并优化

### _redirects 文件
- 配置 URL 重定向
- 支持 301/302 重定向
- 已创建模板，可根据需要修改

### wrangler.toml 文件
- Wrangler CLI 配置文件
- 用于命令行部署

## 环境变量（如果需要）

在 Cloudflare Pages Dashboard 中：
1. 进入项目设置
2. 选择 **Environment variables**
3. 添加需要的变量

## 性能优化建议

### 已配置的优化：
- ✅ 静态资源长期缓存（1年）
- ✅ HTML 短期缓存（1小时）
- ✅ 安全头配置
- ✅ CDN 自动分发

### Cloudflare 功能：
- **Auto Minify**: CSS、JS、HTML 自动压缩
- **Brotli**: 自动启用 Brotli 压缩
- **HTTP/3**: 支持最新的 HTTP 协议
- **Always Online**: 源站故障时提供缓存版本

## 测试部署

部署后访问：
- 临时域名: `https://decarsauto-com.pages.dev`（项目名称建议使用 decarsauto-com）
- 正式域名: `https://decarsauto.com`
- WWW 域名: `https://www.decarsauto.com` (会自动重定向到主域名)

## 清除缓存

如果需要立即更新内容：
```powershell
# 使用现有脚本
.\clear-cloudflare-cache.ps1
```

## 故障排查

### 404 错误
- 检查文件路径是否正确
- 确保 index.html 在根目录

### 样式不加载
- 检查 _headers 文件中的 CSP 配置
- 确保资源 URL 正确

### 部署失败
- 检查文件大小（单个文件 < 25MB）
- 确保没有超过 20,000 个文件

## 更多资源

- [Cloudflare Pages 文档](https://developers.cloudflare.com/pages/)
- [Wrangler 文档](https://developers.cloudflare.com/workers/wrangler/)
- [性能优化指南](https://developers.cloudflare.com/pages/platform/optimizing-pages/)
