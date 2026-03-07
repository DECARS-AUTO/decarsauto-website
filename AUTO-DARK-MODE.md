# 🌙 深色模式自动切换功能

## 概述

深色模式现在支持**自动切换**功能，可以根据用户的系统设置自动调整主题。

---

## ✨ 新功能特点

### 1. 自动检测系统主题
- 🔍 自动检测操作系统的深色模式设置
- 🔄 实时响应系统主题变化
- 💾 智能保存用户偏好

### 2. 两种工作模式

#### 🤖 自动模式（默认）
- 跟随系统主题设置
- 系统切换时自动同步
- 适合大多数用户

#### 🎛️ 手动模式
- 用户手动控制主题
- 不受系统设置影响
- 记住用户选择

---

## 📱 使用方法

### 方式 1: 快速切换（手动模式）
1. 点击右上角的 🌙/☀️ 图标
2. 立即切换主题
3. 自动切换到手动模式
4. 保存您的选择

### 方式 2: 返回自动模式
1. 长按（1秒）🌙/☀️ 图标
2. 切换到自动模式
3. 显示"Auto mode enabled"通知
4. 跟随系统主题

---

## 🔧 技术实现

### 系统主题检测
```javascript
const prefersDarkScheme = window.matchMedia('(prefers-color-scheme: dark)');
```

### 实时监听系统变化
```javascript
prefersDarkScheme.addEventListener('change', (e) => {
    if (localStorage.getItem('darkModePreference') === 'auto') {
        applyDarkMode(e.matches);
    }
});
```

---

## 💾 数据存储

### LocalStorage 键值

| 键 | 值 | 说明 |
|---|---|---|
| `darkModePreference` | `'auto'` | 自动模式 |
| `darkModePreference` | `'manual'` | 手动模式 |
| `darkMode` | `'enabled'` | 深色模式开启 |
| `darkMode` | `'disabled'` | 深色模式关闭 |

---

## 📊 工作流程

```
用户首次访问
    ↓
默认自动模式
    ↓
检测系统主题
    ↓
应用对应主题
    ↓
┌─────────────────────────────────┐
│  系统变化 → 自动同步主题         │
│  用户点击 → 切换到手动模式       │
│  用户长按 → 切换到自动模式       │
└─────────────────────────────────┘
```

---

## 🎨 视觉反馈

### 通知消息
- 切换到自动模式时显示通知
- 3秒后自动消失
- 响应式设计

### 图标状态
- **浅色模式**: 🌙 月亮图标
- **深色模式**: ☀️ 太阳图标

---

## 🌐 浏览器兼容性

### 完整支持
- ✅ Chrome 76+
- ✅ Firefox 67+
- ✅ Safari 12.1+
- ✅ Edge 79+

### 降级方案
- 不支持的浏览器自动降级为手动模式
- 功能仍然正常工作

---

## 🧪 测试场景

### 场景 1: 首次访问
- ✓ 检测系统主题
- ✓ 自动应用对应主题
- ✓ 设置为自动模式

### 场景 2: 点击切换
- ✓ 切换主题
- ✓ 切换到手动模式
- ✓ 保存用户选择

### 场景 3: 长按切换
- ✓ 显示通知
- ✓ 切换到自动模式
- ✓ 跟随系统主题

### 场景 4: 系统主题变化
**自动模式**: 实时同步系统主题
**手动模式**: 保持用户选择

---

## 🔍 调试信息

### 检查当前模式
```javascript
console.log('Theme Preference:', localStorage.getItem('darkModePreference'));
console.log('Dark Mode:', localStorage.getItem('darkMode'));
console.log('System Prefers Dark:', 
    window.matchMedia('(prefers-color-scheme: dark)').matches);
```

### 强制切换模式
```javascript
// 切换到自动模式
localStorage.setItem('darkModePreference', 'auto');
location.reload();

// 切换到手动模式
localStorage.setItem('darkModePreference', 'manual');
localStorage.setItem('darkMode', 'enabled');
location.reload();
```

---

## 🐛 故障排除

| 问题 | 原因 | 解决方案 |
|------|------|----------|
| 自动模式不工作 | 浏览器不支持 | 自动降级为手动模式 |
| 长按无反应 | 按压时间不足 | 按住至少1秒 |
| 通知不显示 | CSS未加载 | 清除缓存刷新 |
| 模式不同步 | LocalStorage禁用 | 启用浏览器存储 |

---

## 📊 性能影响

- ✅ 零性能损耗
- ✅ 无额外HTTP请求
- ✅ 使用原生API
- ✅ 轻量级实现

---

## 🔄 版本历史

### v2.0 (当前)
- ✨ 添加自动模式
- ✨ 系统主题检测
- ✨ 实时同步功能
- ✨ 长按切换模式
- ✨ 通知提示

### v1.0 (之前)
- ✅ 基本手动切换
- ✅ LocalStorage保存

---

**版本**: 2.0  
**更新日期**: 2024-03-07  
**状态**: ✅ 生产就绪
