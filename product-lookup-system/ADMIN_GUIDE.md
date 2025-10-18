# HƯỚNG DẪN HỆ THỐNG ADMIN

## 🔐 Đăng nhập Admin

### Thông tin đăng nhập mặc định:
- **URL**: http://localhost:3000/admin-login
- **Mật khẩu**: `admin123`

⚠️ **LƯU Ý**: Nên đổi mật khẩu trong file `.env` của server trước khi deploy lên production!

Để đổi mật khẩu admin, sửa file `server/.env`:
```
ADMIN_PASSWORD=your_new_password
```

---

## 📋 Các tính năng quản trị

### 1. Xem danh sách sản phẩm
- Hiển thị tất cả sản phẩm trong database
- Hiển thị đầy đủ 5 loại giá: BBCL, BBPT, BL, BLVIP, HONDA247
- Tìm kiếm theo mã, tên, hoặc danh mục sản phẩm

### 2. Thêm sản phẩm mới
- Click nút **➕ Thêm sản phẩm**
- Điền đầy đủ thông tin:
  - Mã sản phẩm (bắt buộc, không trùng)
  - Tên sản phẩm (bắt buộc)
  - Danh mục (bắt buộc)
  - Đơn vị (bắt buộc)
  - Giá cho từng loại khách hàng (tùy chọn)

### 3. Sửa sản phẩm
- Click nút **✏️** ở cột "Thao tác"
- Cập nhật thông tin cần thiết
- Click "Cập nhật" để lưu

### 4. Xóa sản phẩm
- Click nút **🗑️** ở cột "Thao tác"
- Xác nhận xóa
- ⚠️ Lưu ý: Không thể hoàn tác sau khi xóa!

### 5. Import sản phẩm từ Excel

#### Bước 1: Tải file mẫu
- Click nút **📥 Tải file mẫu** 
- Mở file `mau-import-san-pham.xlsx`

#### Bước 2: Chuẩn bị dữ liệu
File Excel phải có các cột theo thứ tự:
- **Mã sản phẩm**: Mã duy nhất của sản phẩm (VD: SP001)
- **Tên sản phẩm**: Tên đầy đủ
- **Danh mục**: Loại sản phẩm (VD: Phụ tùng, Nhớt, Lốp xe...)
- **Đơn vị**: Cái, Bộ, Hộp, Lít...
- **BBCL**: Giá bán buôn chính lẻ (số)
- **BBPT**: Giá bán buôn phụ tùng (số)
- **BL**: Giá bán lẻ (số)
- **BLVIP**: Giá bán lẻ VIP (số)
- **HONDA247**: Giá Honda 247 (số)

**Ví dụ:**
```
Mã sản phẩm | Tên sản phẩm           | Danh mục  | Đơn vị | BBCL   | BBPT  | BL     | BLVIP  | HONDA247
SP001       | Dây curoa Honda Wave   | Phụ tùng  | Cái    | 100000 | 95000 | 110000 | 105000 | 98000
SP002       | Nhớt Castrol 10W40     | Nhớt      | Lít    | 120000 | 115000| 130000 | 125000 | 118000
```

#### Bước 3: Import
- Click nút **📤 Import Excel**
- Chọn file Excel đã chuẩn bị
- Đợi hệ thống xử lý
- Kiểm tra thông báo kết quả

**Lưu ý khi import:**
- Sản phẩm có mã trùng sẽ bị bỏ qua
- Dữ liệu không hợp lệ sẽ không được import
- Giá phải là số, không có dấu phân cách

---

## 🔗 Truy cập theo loại khách hàng

Sau khi khách hàng quét mã QR, họ sẽ truy cập vào link riêng và CHỈ thấy bảng giá của mình:

- **BBCL**: http://localhost:3000/BBCL
- **BBPT**: http://localhost:3000/BBPT
- **BL**: http://localhost:3000/BL
- **BLVIP**: http://localhost:3000/BLVIP
- **HONDA247**: http://localhost:3000/HONDA247

Khách hàng truy cập các link này sẽ:
- ✅ Xem được tất cả trang: Trang chủ, Danh mục, Tra cứu, Giới thiệu
- ✅ Chỉ thấy giá của loại khách hàng của mình
- ❌ KHÔNG thể chuyển đổi xem giá loại khác
- ❌ KHÔNG thể truy cập trang admin

---

## 🛡️ Bảo mật

### Trang Admin được bảo vệ bởi:
1. **Mật khẩu đăng nhập** - Chỉ admin mới biết
2. **JWT Token** - Lưu trong localStorage, hết hạn sau 24h
3. **Protected Routes** - Tự động redirect nếu chưa đăng nhập

### Khách hàng thường:
- Không thể truy cập `/admin` hoặc `/admin-login`
- Tự động redirect về trang login khi cố truy cập
- Chỉ có quyền xem, không có quyền sửa/xóa

---

## 🚀 Triển khai Production

### Trước khi deploy:

1. **Đổi mật khẩu admin**:
   ```env
   ADMIN_PASSWORD=mat_khau_manh_hon
   ```

2. **Đổi JWT Secret**:
   ```env
   JWT_SECRET=jwt_secret_key_phuc_tap
   ```

3. **Cập nhật MongoDB URI** nếu cần

4. **Build client**:
   ```bash
   cd client
   npm run build
   ```

---

## ❓ Troubleshooting

### Quên mật khẩu admin?
- Sửa file `server/.env` → `ADMIN_PASSWORD=admin123`
- Restart server
- Đăng nhập lại với mật khẩu mới

### Import Excel bị lỗi?
- Kiểm tra tên cột khớp với file mẫu
- Đảm bảo giá là số, không có ký tự đặc biệt
- Mã sản phẩm không được trùng với sản phẩm đã có

### Không thể đăng nhập?
- Kiểm tra server đang chạy (port 5000)
- Kiểm tra kết nối MongoDB
- Xóa cache browser và thử lại

---

## 📞 Hỗ trợ

Nếu cần hỗ trợ kỹ thuật, vui lòng liên hệ quản trị viên hệ thống.
