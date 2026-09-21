Báo Cáo Phân Tích Hiệu Năng Truy Vấn (EXPLAIN Analysis)

Trước khi tối ưu, câu lệnh legacy sử dụng hàm YEAR() và MONTH() bọc quanh cột created_at (truy vấn Non-SARGable), khiến B-Tree Index không thể sử dụng. Kế hoạch thực thi báo cáo chỉ số type = ALL (Quét toàn bộ 5,000,000 dòng) với possible_keys = NULL, gây quá tải CPU 100% và treo hệ thống.

Sau khi refactor sang dạng so sánh khoảng thời gian (>= và <) kết hợp với Composite Index idx_type_date(transaction_type, created_at):

Chỉ số type chuyển từ ALL sang range (hoặc ref).

possible_keys và key ghi nhận chính xác idx_type_date.

Chỉ số rows giảm đột biến từ 5,000,000 dòng xuống chỉ còn vài nghìn dòng trùng khớp với tháng 6/2026.

Cột Extra hiển thị Using index condition, xác nhận MySQL Optimizer đã tận dụng Index Seek thành công, loại bỏ hoàn toàn hiện tượng Full Table Scan.
