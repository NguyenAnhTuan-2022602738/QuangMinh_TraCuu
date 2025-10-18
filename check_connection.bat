@echo off
echo ========================================================
echo    KIỂM TRA KẾT NỐI TỚI SERVER TRÊN MẠNG LAN
echo ========================================================
echo.

REM Lấy địa chỉ IP của máy tính
echo Đang lấy thông tin IP...
ipconfig | findstr /i "IPv4" > temp_ip.txt
for /f "tokens=14" %%a in (temp_ip.txt) do (
  set IP_ADDRESS=%%a
  goto :found_ip
)

:found_ip
del temp_ip.txt

echo.
echo Địa chỉ IP của server là: %IP_ADDRESS%
echo.

echo ========================================================
echo    KIỂM TRA TƯỜNG LỬA
echo ========================================================
echo.
echo Lưu ý: Nếu không thể kết nối từ thiết bị di động,
echo có thể tường lửa Windows đang chặn port 5000.
echo.
echo Vui lòng kiểm tra và tạo quy tắc cho phép kết nối đến 
echo port 5000 (cần quyền Administrator).
echo.
echo Các bước để mở port 5000 trong tường lửa Windows:
echo 1. Mở Control Panel
echo 2. Chọn System and Security
echo 3. Chọn Windows Defender Firewall
echo 4. Chọn Advanced settings
echo 5. Chọn Inbound Rules ở menu bên trái
echo 6. Chọn New Rule... ở menu bên phải
echo 7. Chọn Port, nhấn Next
echo 8. Chọn TCP, nhập 5000, nhấn Next
echo 9. Chọn Allow the connection, nhấn Next
echo 10. Chọn tất cả các profile, nhấn Next
echo 11. Nhập tên cho quy tắc (ví dụ: Allow Port 5000), nhấn Finish
echo.

echo ========================================================
echo    KIỂM TRA SERVER
echo ========================================================
echo.
echo Đang kiểm tra kết nối đến server trên port 5000...
echo.

curl -s -o nul -w "%%{http_code}" http://localhost:5000/api/products > temp_status.txt
set /p STATUS=<temp_status.txt
del temp_status.txt

if "%STATUS%" == "200" (
  echo Server đang hoạt động bình thường! (Status: 200 OK)
  echo.
  echo Bạn có thể truy cập API từ thiết bị di động qua:
  echo http://%IP_ADDRESS%:5000/api
  echo.
) else (
  echo Server không hoạt động hoặc có lỗi! (Status: %STATUS%)
  echo Vui lòng kiểm tra lại server của bạn.
  echo.
)

echo ========================================================
echo    THÔNG TIN KỊCH BẢN KIỂM TRA BẰNG ĐIỆN THOẠI
echo ========================================================
echo.
echo Để kiểm tra từ điện thoại, hãy thực hiện các bước sau:
echo.
echo 1. Kết nối điện thoại vào cùng mạng WiFi với máy tính
echo 2. Mở trình duyệt trên điện thoại
echo 3. Truy cập vào: http://%IP_ADDRESS%:5000/api/products
echo.
echo Nếu hiển thị dữ liệu JSON, server đang hoạt động bình thường.
echo Nếu không kết nối được, có thể do tường lửa Windows.
echo.
echo ========================================================
echo.
pause