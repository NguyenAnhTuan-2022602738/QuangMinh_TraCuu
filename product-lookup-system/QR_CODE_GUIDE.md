# 🔗 Hướng dẫn tạo link và QR Code cho khách hàng

## URL cho từng loại khách hàng

Hệ thống hiện hỗ trợ 5 loại bảng giá riêng biệt. Mỗi khách hàng có thể xem **TOÀN BỘ WEBSITE** (Trang chủ, Danh mục, Tra cứu, Giới thiệu) nhưng chỉ thấy giá của bảng giá riêng của họ.

### 1. Bán buôn chính lẻ (BBCL)
- **URL chính**: `http://localhost:3000/BBCL`
- **Danh mục**: `http://localhost:3000/BBCL/catalog`
- **Tra cứu**: `http://localhost:3000/BBCL/search`
- **Giới thiệu**: `http://localhost:3000/BBCL/about`
- **Production**: `https://yourdomain.com/BBCL`

### 2. Bán buôn phụ tùng (BBPT)
- **URL chính**: `http://localhost:3000/BBPT`
- **Production**: `https://yourdomain.com/BBPT`

### 3. Bán lẻ (BL)
- **URL chính**: `http://localhost:3000/BL`
- **Production**: `https://yourdomain.com/BL`

### 4. Bán lẻ VIP (BLVIP)
- **URL chính**: `http://localhost:3000/BLVIP`
- **Production**: `https://yourdomain.com/BLVIP`

### 5. Honda 247 (HONDA247)
- **URL chính**: `http://localhost:3000/HONDA247`
- **Production**: `https://yourdomain.com/HONDA247`

> **Lưu ý**: Khách hàng chỉ cần quét QR của URL chính (ví dụ `/BBCL`), sau đó họ có thể tự do di chuyển giữa các trang, nhưng giá luôn khóa theo bảng giá của họ.

---

## Cách tạo QR Code

### Phương án 1: Sử dụng công cụ online miễn phí

1. **QR Code Generator** - https://www.qr-code-generator.com/
   - Mở website
   - Chọn "URL"
   - Paste link (ví dụ: `https://yourdomain.com/BBCL`)
   - Tùy chỉnh màu sắc, logo (nếu muốn)
   - Download QR code

2. **QRCode Monkey** - https://www.qrcode-monkey.com/
   - Miễn phí, không watermark
   - Có thể custom màu, thêm logo
   - Download độ phân giải cao

3. **QR.io** - https://qr.io/
   - Tạo QR code động (có thể đổi URL sau này)
   - Có analytics (biết bao nhiêu người quét)

### Phương án 2: Sử dụng Google Chrome

1. Mở Chrome
2. Vào URL cần tạo QR (ví dụ: `http://localhost:3000/BBCL`)
3. Click vào thanh địa chỉ
4. Click icon QR code bên phải (hoặc Share → Create QR Code)
5. Download ảnh

### Phương án 3: Code tự động (cho developer)

Cài package:
\`\`\`bash
npm install qrcode
\`\`\`

Tạo file \`generate-qr.js\`:
\`\`\`javascript
const QRCode = require('qrcode');
const fs = require('fs');

const priceTypes = ['BBCL', 'BBPT', 'BL', 'BLVIP', 'HONDA247'];
const baseUrl = 'https://yourdomain.com'; // Đổi thành domain của bạn

priceTypes.forEach(type => {
    const url = \`\${baseUrl}/\${type}\`;
    const filename = \`qr-\${type}.png\`;
    
    QRCode.toFile(filename, url, {
        width: 500,
        margin: 2,
        color: {
            dark: '#000000',
            light: '#FFFFFF'
        }
    }, (err) => {
        if (err) console.error(err);
        else console.log(\`✓ Created \${filename}\`);
    });
});
\`\`\`

Chạy:
\`\`\`bash
node generate-qr.js
\`\`\`

---

## Cách sử dụng

### Cho Admin/Người gửi
1. Tạo QR code cho từng loại khách hàng
2. Gửi QR code tương ứng cho từng nhóm khách hàng:
   - Email: Attach file QR code
   - Print: In QR code ra giấy/card
   - Chat: Gửi ảnh QR code

### Cho Khách hàng
1. Nhận QR code từ admin
2. Dùng camera điện thoại quét QR code
3. Tự động mở website với bảng giá được khóa theo loại của họ
4. Xem được toàn bộ trang web: Trang chủ, Danh mục, Tra cứu, Giới thiệu
5. Di chuyển tự do giữa các trang, nhưng giá luôn hiển thị theo bảng giá của họ
6. Không có selector để đổi sang bảng giá khác (bị khóa)

---

## Tính năng hệ thống

✅ **Toàn bộ trang web** - Khách xem được Trang chủ, Danh mục, Tra cứu, Giới thiệu
✅ **Giá bị khóa** - Khách chỉ thấy giá của bảng giá riêng, không thể đổi
✅ **Badge khóa** - Hiển thị icon 🔒 và tên bảng giá ở header
✅ **Navigation hoàn chỉnh** - Menu điều hướng giữa các trang
✅ **Tìm kiếm** - Search theo tên/mã sản phẩm
✅ **Lọc danh mục** - Filter theo category
✅ **Responsive** - Hoạt động tốt trên mobile
✅ **Giá hiển thị VND** - Format chuẩn Việt Nam

---

## Ví dụ phân loại khách hàng

### BBCL (Bán buôn chính lẻ)
- Đại lý cấp 1
- Nhập số lượng lớn
- QR Code: Gửi qua email contract

### BBPT (Bán buôn phụ tùng)
- Cửa hàng phụ tùng
- Garage, xưởng sửa chữa
- QR Code: In trên card, gửi Zalo/Email

### BL (Bán lẻ)
- Khách lẻ thông thường
- QR Code: Đặt tại cửa hàng, website công khai

### BLVIP (Bán lẻ VIP)
- Khách hàng thân thiết
- Khách mua nhiều lần
- QR Code: Gửi riêng cho từng khách VIP

### HONDA247
- Đối tác Honda 247
- QR Code: Gửi riêng theo hợp đồng

---

## Tips bảo mật

1. **Không public URL**: Chỉ gửi link/QR cho đúng người
2. **Thêm mật khẩu** (nếu cần): Có thể thêm tính năng nhập password
3. **Check IP** (nếu cần): Giới hạn truy cập từ địa chỉ IP cụ thể
4. **Analytics**: Theo dõi ai đang xem bảng giá nào
5. **Expire link**: Tạo link có thời hạn (cần code thêm)

---

## Khi deploy lên production

1. Đổi URL trong code từ `http://localhost:3000` → `https://yourdomain.com`
2. Tạo lại QR code với URL mới
3. Test kỹ từng QR code trước khi gửi khách
4. Lưu trữ QR code ở nơi an toàn
5. Có backup plan nếu cần tạo lại QR

---

**Đã có sẵn 5 portal riêng biệt, chỉ cần tạo QR code và gửi cho đúng khách hàng!** 🎉
