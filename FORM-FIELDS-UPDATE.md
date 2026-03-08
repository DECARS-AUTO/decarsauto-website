# 表单字段更新文档

## 新增字段

### 1. VIN（车辆识别代码）字段

**技术规格：**
- **字段类型**: `<input type="text">`
- **ID**: `form-vin`
- **Name**: `vin`
- **Autocomplete**: `off`（特定业务字段，不适合浏览器自动填充）
- **最大长度**: 17个字符 (`maxlength="17"`)
- **验证规则**: `pattern="[A-HJ-NPR-Z0-9]{17}"` 
  - 仅允许字母和数字
  - 排除字母 I, O, Q（VIN 标准规定）
  - 必须正好17个字符
- **提示信息**: "VIN must be 17 characters (letters and numbers, excluding I, O, Q)"

**示例值：**
- `WVWZZZ1KZAW123456` (Volkswagen)
- `WAUZZZ8V7LA123456` (Audi)
- `TMBEA19Z0M7123456` (Škoda)

**三语言标签：**
- 🇺🇸 English: "Vehicle Identification Number (VIN)"
- 🇩🇪 Deutsch: "Fahrzeug-Identifizierungsnummer (VIN)"
- 🇨🇳 中文: "车辆识别代码 (VIN)"

**Placeholder 提示：**
- `e.g., WVWZZZ1KZAW123456`

---

### 2. 销售区域字段

**技术规格：**
- **字段类型**: `<input type="text">`
- **ID**: `form-region`
- **Name**: `region`
- **Autocomplete**: `off`（特定业务选择）
- **无字符限制**：可输入地区代码或全称

**常见区域代码：**
- **EU** - Europe（欧洲）
- **CN** - China（中国）
- **US** - United States（美国）
- **ROW** - Rest of World（其他地区）
- **NAR** - North America Region（北美地区）
- **MEA** - Middle East & Africa（中东非洲）
- **APAC** - Asia Pacific（亚太地区）
- **RU** - Russia（俄罗斯）
- **UK** - United Kingdom（英国）

**三语言标签：**
- 🇺🇸 English: "Sales Region"
- 🇩🇪 Deutsch: "Verkaufsregion"
- 🇨🇳 中文: "销售区域"

**Placeholder 提示：**
- `e.g., EU / CN / US / ROW`

---

## 表单布局结构

### 当前表单行顺序：

1. **第 1 行**（双列）：
   - 姓名 (Name) * - Required
   - 邮箱 (Email) * - Required

2. **第 2 行**（双列）：
   - 电话 (Phone) - Optional
   - 车辆型号 (Vehicle Model) - Optional

3. **第 3 行**（双列）- 🆕 NEW：
   - **VIN (车辆识别代码)** - Optional
   - **销售区域 (Sales Region)** - Optional

4. **第 4 行**（单列）：
   - 所需服务 (Service Needed) * - Required

5. **第 5 行**（单列）：
   - 留言 (Message) * - Required

6. **提交按钮**

---

## 验证逻辑

### VIN 字段验证规则：

```javascript
// HTML5 原生验证
pattern="[A-HJ-NPR-Z0-9]{17}"

// JavaScript 额外验证（如需要）
function validateVIN(vin) {
  // 1. 长度必须为17
  if (vin.length !== 17) return false;
  
  // 2. 仅允许 A-H, J-N, P-Z, 0-9（排除 I, O, Q）
  const vinRegex = /^[A-HJ-NPR-Z0-9]{17}$/;
  return vinRegex.test(vin);
}
```

### 销售区域字段验证：

- 无严格验证规则
- 接受任何文本输入（地区代码或全称）
- 建议输入示例：EU, CN, US, ROW, NAR, MEA, APAC

---

## 表单数据提交格式

### 提交后的数据对象：

```javascript
{
  name: "张三",
  email: "zhangsan@example.com",
  phone: "+86 130 6137 1861",
  vehicle: "VW Golf 8 2021",
  vin: "WVWZZZ1KZAW123456",        // 新增字段
  region: "CN",                     // 新增字段
  service: "oem-programming",
  message: "需要进行CP编程..."
}
```

---

## 样式和用户体验

### 表单字段样式：

- **统一高度**: 所有输入框保持一致高度
- **Placeholder 颜色**: 使用 `var(--text-secondary)` 或 rgba 半透明
- **验证错误提示**: 浏览器原生 HTML5 验证
- **Focus 样式**: 蓝色边框高亮，添加 box-shadow

### 响应式布局：

- **桌面端（>768px）**: 保持双列布局
- **移动端（≤768px）**: 自动切换为单列布局（已在 CSS 中配置）

---

## 可访问性（Accessibility）

### 已实现的可访问性特性：

1. **明确的 label 标签**: 所有字段都有对应的 `<label for="...">`
2. **Required 标识**: 必填字段标记 `*` 并添加 `required` 属性
3. **Placeholder 提示**: 提供示例格式
4. **验证提示**: VIN 字段包含 `title` 属性，验证失败时显示帮助信息
5. **Autocomplete 属性**: 
   - `name` → `autocomplete="name"`
   - `email` → `autocomplete="email"`
   - `tel` → `autocomplete="tel"`
   - `vin` → `autocomplete="off"`（特定业务）
   - `region` → `autocomplete="off"`（特定业务）

---

## 测试用例

### VIN 字段测试：

✅ **有效 VIN:**
- `WVWZZZ1KZAW123456` (Volkswagen)
- `WAUZZZ8V7LA123456` (Audi)
- `1HGBH41JXMN109186` (Honda - 跨品牌测试)

❌ **无效 VIN:**
- `WVWZZZ1KZAW12345` (只有16位 - 太短)
- `WVWZZZ1KZAW1234567` (18位 - 太长)
- `WVWZZZ1KZOWI23456` (包含字母O - 不允许)
- `WVWZZZ1KZAII23456` (包含字母I - 不允许)
- `WVWZZZ1KZAQQ23456` (包含字母Q - 不允许)

### 销售区域测试：

✅ **有效输入:**
- `EU`
- `CN`
- `US`
- `ROW`
- `North America`
- `Europe`
- `China`

---

## 浏览器兼容性

### HTML5 验证支持：

- ✅ Chrome 88+
- ✅ Firefox 85+
- ✅ Safari 14+
- ✅ Edge 88+
- ✅ 所有现代移动浏览器

### Pattern 属性支持：

- ✅ 所有现代浏览器
- ⚠️ IE 11 不支持（但无影响，表单仍可提交）

---

## 后续优化建议

### 1. 添加客户端实时验证：

```javascript
// 实时 VIN 格式验证
document.getElementById('form-vin').addEventListener('input', function(e) {
  const vin = e.target.value.toUpperCase();
  e.target.value = vin; // 自动转大写
  
  if (vin.length === 17) {
    const isValid = /^[A-HJ-NPR-Z0-9]{17}$/.test(vin);
    e.target.classList.toggle('is-valid', isValid);
    e.target.classList.toggle('is-invalid', !isValid);
  }
});
```

### 2. 添加区域选择下拉框（可选）：

```html
<select id="form-region" name="region" autocomplete="off">
  <option value="">-- Select region --</option>
  <option value="EU">Europe (EU)</option>
  <option value="CN">China (CN)</option>
  <option value="US">United States (US)</option>
  <option value="NAR">North America (NAR)</option>
  <option value="ROW">Rest of World (ROW)</option>
</select>
```

### 3. VIN 解码功能（高级）：

- 自动识别制造商
- 自动提取车型年份
- 自动填充车辆型号字段

---

## 更新总结

✅ **已完成：**
1. 添加 VIN 字段（带 17 位验证规则）
2. 添加销售区域字段
3. 为所有三种语言（EN/DE/ZH）添加翻译
4. 设置合适的 autocomplete 属性
5. 添加 placeholder 示例
6. 保持响应式双列布局

🚀 **效果：**
- 更专业的车辆信息收集
- 更精确的服务定位（通过 VIN 和区域）
- 更好的用户体验（清晰的输入提示）
- 符合行业标准（17位 VIN 验证）

---

*文档创建时间: 2024-03-08*
*版本: 1.0*
