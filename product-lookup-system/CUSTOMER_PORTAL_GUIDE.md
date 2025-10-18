# 🎯 Hướng dẫn sử dụng hệ thống bảng giá theo khách hàng

## Tổng quan

Hệ thống cho phép mỗi loại khách hàng:
- ✅ Xem **TOÀN BỘ WEBSITE** (Trang chủ, Danh mục, Tra cứu, Giới thiệu)
- ✅ Di chuyển tự do giữa các trang
- ✅ Chỉ thấy giá của **BẢNG GIÁ RIÊNG** của họ
- ✅ **KHÔNG THỂ** chuyển sang bảng giá khác (giá bị khóa)

---

## 📱 Flow hoạt động

### 1. Admin gửi QR Code
```
Admin tạo QR Code cho:
- BBCL    → https://yourdomain.com/BBCL
- BBPT    → https://yourdomain.com/BBPT
- BL      → https://yourdomain.com/BL
- BLVIP   → https://yourdomain.com/BLVIP
- HONDA247 → https://yourdomain.com/HONDA247
```

### 2. Khách hàng quét QR
```
Khách BBCL quét QR → Vào /BBCL
↓
Thấy toàn bộ website với giá BBCL
↓
Click menu: Trang chủ, Danh mục, Tra cứu, Giới thiệu
↓
Mọi trang đều hiển thị giá BBCL
↓
KHÔNG THỂ đổi sang giá khác (bị khóa 🔒)
```

---

## 🔗 Cấu trúc URL

### Khách hàng BBCL
- Trang chủ: `/BBCL`
- Danh mục: `/BBCL/catalog`
- Tra cứu: `/BBCL/search`
- Giới thiệu: `/BBCL/about`

### Khách hàng BBPT
- Trang chủ: `/BBPT`
- Danh mục: `/BBPT/catalog`
- Tra cứu: `/BBPT/search`
- Giới thiệu: `/BBPT/about`

### Tương tự cho BL, BLVIP, HONDA247

---

## 🎨 Giao diện

### Header
- Logo + tên website
- Menu: Trang chủ | Danh mục | Tra cứu | Giới thiệu
- Badge bảng giá: 🔒 **Bảng giá: Bán buôn chính lẻ** (ví dụ BBCL)
- **KHÔNG CÓ** dropdown selector để đổi giá

### Các trang
- **Trang chủ**: Hero, tính năng, CTA buttons
- **Danh mục**: Grid sản phẩm, search, filter category
- **Tra cứu**: Search box lớn, kết quả theo giá của họ
- **Giới thiệu**: Thông tin công ty, liên hệ

---

## 🔒 Cơ chế khóa giá

### Context Provider
```javascript
<CustomerProvider initialType="BBCL" locked={true}>
  // locked = true → không thể đổi giá
  // initialType = "BBCL" → mặc định là BBCL
</CustomerProvider>
```

### Header hiển thị
- **Có selector** (URL gốc `/`): Dropdown chọn BBCL, BBPT, BL, BLVIP, HONDA247
- **Không có selector** (URL `/BBCL`): Badge 🔒 "Bảng giá: Bán buôn chính lẻ"

---

## 🎯 Test các URL

### Khách hàng với giá khóa:
```
http://localhost:3000/BBCL          → Trang chủ BBCL
http://localhost:3000/BBCL/catalog  → Danh mục BBCL
http://localhost:3000/BBCL/search   → Tra cứu BBCL
http://localhost:3000/BBCL/about    → Giới thiệu BBCL
```

### Admin/Internal (có selector):
```
http://localhost:3000/              → Trang chủ (có selector)
http://localhost:3000/catalog       → Danh mục (có selector)
http://localhost:3000/search        → Tra cứu (có selector)
http://localhost:3000/about         → Giới thiệu (có selector)
```

---

## 📋 So sánh 2 chế độ

| Tính năng | URL có selector (/) | URL bị khóa (/BBCL) |
|-----------|---------------------|---------------------|
| Xem toàn bộ trang | ✅ | ✅ |
| Selector dropdown | ✅ Có | ❌ Không có |
| Badge bảng giá | "Bạn đang xem giá: BBCL" | "🔒 Bảng giá: BBCL" |
| Đổi sang giá khác | ✅ Được | ❌ Bị khóa |
| Menu navigation | ✅ | ✅ |
| Search & Filter | ✅ | ✅ |

---

## 🚀 Cách triển khai

### Bước 1: Test local
```powershell
# Server
cd server
npm start

# Client (terminal mới)
cd client
npm start
```

### Bước 2: Test các URL
- Mở http://localhost:3000/ → Thấy selector
- Mở http://localhost:3000/BBCL → Không thấy selector, badge khóa
- Click menu Danh mục → URL thành /BBCL/catalog
- Click Tra cứu → URL thành /BBCL/search
- Giá luôn hiển thị theo BBCL

### Bước 3: Tạo QR Code
Dùng các công cụ online tạo QR cho:
- `/BBCL` → Gửi cho khách BBCL
- `/BBPT` → Gửi cho khách BBPT
- v.v.

---

## ✨ Ưu điểm

✅ **Trải nghiệm hoàn chỉnh**: Khách xem được toàn bộ website
✅ **Bảo mật giá**: Khách chỉ thấy giá của họ, không lộ giá khác
✅ **Đơn giản**: 1 QR code, khách tự do di chuyển
✅ **Chuyên nghiệp**: Badge khóa rõ ràng, không confuse
✅ **Dễ quản lý**: Admin biết rõ đang gửi bảng giá nào

---

## 📦 Files đã sửa/tạo

### Sửa đổi:
- `App.jsx` - Routing theo price type
- `CustomerContext.js` - Thêm locked state
- `Header.jsx` - Badge khóa thay selector
- `Home.jsx` - Navigation theo price type
- `CustomerTypeSelector.css` - Style cho badge khóa

### Xóa:
- `CustomerPortal.jsx` - Không cần nữa (dùng App chung)
- `CustomerPortal.css` - Không cần nữa

---

**Hoàn hảo cho việc gửi link/QR riêng cho từng loại khách hàng!** 🎉
