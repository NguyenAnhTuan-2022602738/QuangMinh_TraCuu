import React from 'react';
import { Link, useLocation } from 'react-router-dom';
import { useCustomer } from '../context/CustomerContext';
import './Home.css';

const Home = () => {
    const { customerType, locked } = useCustomer();
    const location = useLocation();
    
    // Check if we're on a price-type specific path
    const priceTypePrefix = locked ? `/${customerType}` : '';
    
    const getPriceTypeName = (type) => {
        const names = {
            'BBCL': 'Bán buôn chính lẻ',
            'BBPT': 'Bán buôn phụ tùng',
            'BL': 'Bán lẻ',
            'BLVIP': 'Bán lẻ VIP',
            'HONDA247': 'Honda 247'
        };
        return names[type] || type;
    };

    return (
        <div className="home">
            {/* Hero Section */}
            <section className="hero">
                <div className="container">
                    <div className="hero-content">
                        <h1 className="hero-title">
                            Hệ thống tra cứu sản phẩm
                            <span className="gradient-text"> chuyên nghiệp</span>
                        </h1>
                        <p className="hero-subtitle">
                            Tra cứu nhanh chóng, chính xác với giá phù hợp cho từng loại khách hàng
                        </p>
                        <div className="hero-actions">
                            <Link to={`${priceTypePrefix}/catalog`} className="btn btn-secondary btn-lg">
                                Xem danh mục sản phẩm
                            </Link>
                            <Link to={`${priceTypePrefix}/search`} className="btn btn-outline btn-lg">
                                Tra cứu ngay
                            </Link>
                        </div>
                        {/* <div className="hero-badge">
                            {locked ? (
                                <>🔒 Bảng giá: <strong>{getPriceTypeName(customerType)}</strong></>
                            ) : (
                                <>Bạn đang xem giá: <strong>{customerType}</strong></>
                            )}
                        </div> */}
                    </div>
                </div>
            </section>

            {/* Features Section */}
            <section className="features">
                <div className="container">
                    <h2 className="section-title">Tính năng nổi bật</h2>
                    <div className="grid grid-3">
                        <div className="feature-card card">
                            <div className="feature-icon">🔍</div>
                            <h3>Tra cứu nhanh</h3>
                            <p>Tìm kiếm sản phẩm theo mã hoặc tên trong tích tắc</p>
                        </div>
                        
                        <div className="feature-card card">
                            <div className="feature-icon">💰</div>
                            <h3>Giá phù hợp</h3>
                            <p>Hiển thị giá theo từng loại khách hàng (BBCL, BBPT, BL, BLVIP, Honda247)</p>
                        </div>
                        
                        <div className="feature-card card">
                            <div className="feature-icon">📊</div>
                            <h3>Danh mục đa dạng</h3>
                            <p>Phân loại sản phẩm rõ ràng, dễ tìm kiếm</p>
                        </div>
                        
                        <div className="feature-card card">
                            <div className="feature-icon">⚡</div>
                            <h3>Cập nhật liên tục</h3>
                            <p>Dữ liệu được cập nhật thường xuyên</p>
                        </div>
                        
                        <div className="feature-card card">
                            <div className="feature-icon">📱</div>
                            <h3>Đa nền tảng</h3>
                            <p>Sử dụng trên mọi thiết bị, mọi lúc mọi nơi</p>
                        </div>
                        
                        <div className="feature-card card">
                            <div className="feature-icon">🔒</div>
                            <h3>Bảo mật cao</h3>
                            <p>Thông tin được bảo vệ an toàn tuyệt đối</p>
                        </div>
                    </div>
                </div>
            </section>

            {/* CTA Section */}
            <section className="cta-section">
                <div className="container">
                    <div className="cta-card">
                        <h2>Bắt đầu tra cứu ngay hôm nay</h2>
                        <p>Truy cập hàng nghìn sản phẩm với giá cạnh tranh</p>
                        <Link to="/catalog" className="btn btn-primary btn-lg">
                            Khám phá ngay
                        </Link>
                    </div>
                </div>
            </section>
        </div>
    );
};

export default Home;
