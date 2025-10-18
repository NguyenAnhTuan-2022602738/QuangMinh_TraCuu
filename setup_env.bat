@echo off
echo ============================================================
echo       THIẾT LẬP MÔI TRƯỜNG CHO HỆ THỐNG TRA CỨU
echo ============================================================
echo.

REM Lấy địa chỉ IP của máy tính
ipconfig | findstr /i "IPv4" > temp.txt
for /f "tokens=14" %%a in (temp.txt) do (
  set IP_ADDRESS=%%a
  goto :found_ip
)

:found_ip
del temp.txt

echo Địa chỉ IP của máy tính là: %IP_ADDRESS%
echo.

REM Cập nhật file .env cho client
echo # Cài đặt API cho client > .\product-lookup-system\client\.env
echo REACT_APP_API_URL=http://%IP_ADDRESS%:5000/api >> .\product-lookup-system\client\.env

echo Đã cập nhật API_URL trong client/.env thành http://%IP_ADDRESS%:5000/api
echo.

echo ============================================================
echo       HƯỚng DẪN KHỞI ĐỘNG SERVER VÀ CLIENT
echo ============================================================
echo.
echo 1. Mở hai cửa sổ Terminal riêng biệt
echo.
echo 2. Để khởi động server:
echo    cd product-lookup-system\server
echo    npm start
echo.
echo 3. Để khởi động client:
echo    cd product-lookup-system\client
echo    npm start
echo.
echo 4. Để truy cập từ điện thoại hoặc thiết bị khác trên cùng mạng LAN:
echo    Sử dụng URL: http://%IP_ADDRESS%:3000
echo.
echo ============================================================
echo.
pause