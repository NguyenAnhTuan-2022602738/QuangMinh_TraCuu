# Product Lookup System - Hệ thống tra cứu sản phẩm

## 🎨 Tính năng đã hoàn thành

### Frontend (Client)
✅ **Trang chủ (Home)** - Landing page hiện đại với:
- Hero section gradient đẹp mắt
- 6 tính năng nổi bật với icons
- Call-to-action section
- Responsive design

✅ **Trang giới thiệu (About)** - Giới thiệu doanh nghiệp với:
- Thông tin công ty
- Sứ mệnh & Tầm nhìn
- 6 giá trị cốt lõi
- 4 dịch vụ chính
- Thông tin liên hệ

✅ **Danh mục sản phẩm (Catalog)** - Xem tất cả sản phẩm:
- Hiển thị danh sách sản phẩm theo giá (BBCL, BBPT, BL, BLVIP, HONDA247)
- Tìm kiếm theo tên/mã sản phẩm
- Lọc theo danh mục
- Card design đẹp mắt với hover effects
- Hiển thị giá format VND

✅ **Tra cứu sản phẩm (Search)** - Tìm kiếm nhanh:
- Search box lớn, dễ sử dụng
- Kết quả hiển thị dạng cards
- Tips hướng dẫn sử dụng
- Real-time theo customerType

✅ **Header & Footer** - Navigation chuyên nghiệp:
- Gradient background đẹp
- Logo và navigation menu
- Customer Type Selector tích hợp
- Footer với thông tin chi tiết
- Sticky header
- Active link highlighting

✅ **Customer Type Selector** - Chọn loại giá:
- 5 loại giá: BBCL, BBPT, BL, BLVIP, HONDA247
- Styling đẹp với backdrop-filter
- Context API để chia sẻ state

### Backend (Server)
✅ **API Endpoints**:
- `GET /api/products` - Lấy tất cả sản phẩm
- `GET /api/products/:priceType` - Lấy sản phẩm theo loại giá
- `GET /api/products/code/:code` - Lấy chi tiết sản phẩm theo mã
- CORS enabled
- Error handling

✅ **Product Model** - Hỗ trợ 2 cấu trúc:
- Top-level price fields: BBCL, BBPT, BL, BLVIP, HONDA247
- Nested prices object: prices.BBCL, prices.BBPT, etc.

## 🚀 Cách chạy dự án

### Server
\`\`\`powershell
cd server
npm install
# Tạo file .env với MONGO_URI
npm start
\`\`\`

### Client
\`\`\`powershell
cd client
npm install
npm start
\`\`\`

## 🎨 Design System

### Colors
- Primary: #2563eb (Blue)
- Secondary: #10b981 (Green)
- Accent: #f59e0b (Orange)
- Dark: #1f2937
- Gray: #6b7280

### Gradients
- Purple gradient: #667eea → #764ba2
- Blue gradient: #2563eb → #1e40af
- Background: #f5f7fa → #e4e9f2

### Components
- Cards với shadow và hover effects
- Buttons với 3 variants (primary, secondary, outline)
- Responsive grid system
- Modern input fields với focus states

## 📱 Responsive Design
- Desktop: Full layout với grid
- Tablet: Adjusted columns
- Mobile: Single column, stacked layout

## 🔧 Tech Stack
- **Frontend**: React 17, React Router 5, Axios
- **Backend**: Node.js, Express, MongoDB, Mongoose
- **Styling**: Custom CSS với CSS Variables
- **State Management**: React Context API

## 📊 Cấu trúc Database
\`\`\`json
{
  "_id": "...",
  "code": "12209gb4681SS",
  "name": "Tên sản phẩm",
  "category": "BÁO GIÁ PHỚT",
  "unit": "pcs",
  "BBCL": 130295,
  "BBPT": 130295,
  "BL": 180000,
  "BLVIP": 146000,
  "HONDA247": 132000
}
\`\`\`

## ✨ Highlights
- ✅ Modern, clean UI với gradients và shadows
- ✅ Fully responsive trên mọi thiết bị
- ✅ Context API để quản lý customerType global
- ✅ Real-time price updates theo loại khách hàng
- ✅ Search và filter mạnh mẽ
- ✅ Category-based navigation
- ✅ Vietnamese localization
- ✅ Professional error handling
- ✅ Loading states và empty states
- ✅ SEO-friendly routing

## 🎯 Next Steps (Tùy chọn)
- [ ] Add authentication
- [ ] Add product images
- [ ] Export to Excel/PDF
- [ ] Admin dashboard
- [ ] Product comparison
- [ ] Shopping cart
- [ ] Order management
