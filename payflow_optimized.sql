-- HỆ THỐNG PAYFLOW (OPTIMIZED SCRIPT)
USE payflow_db;

-- 1. Tạo Composite Index tối ưu trên 2 cột (transaction_type, created_at)
-- Cột transaction_type đứng trước vì có tính lọc bằng (=), created_at đứng sau cho truy vấn khoảng (range)
CREATE INDEX idx_type_date ON Transactions(transaction_type, created_at);

-- 2. Truy vấn đã được tối ưu hóa (SARGable Query)
-- Chuyển đổi điều kiện YEAR() và MONTH() thành khoảng ngày [2026-06-01, 2026-07-01)
EXPLAIN
SELECT SUM(amount) AS total_deposit
FROM Transactions
WHERE transaction_type = 'DEPOSIT'
AND created_at >= '2026-06-01 00:00:00'
AND created_at < '2026-07-01 00:00:00';
