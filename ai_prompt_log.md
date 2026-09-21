Nhật Ký Tương Tác AI (AI Prompt Log)

Prompt 1: Tìm hiểu hành vi mặc định của JOIN

User: "Trong cơ sở dữ liệu MySQL, mặc định từ khóa JOIN (khi không ghi rõ LEFT hay RIGHT) sẽ hoạt động như thế nào? Nó sẽ bỏ qua hay giữ lại các bản ghi không có sự trùng khớp ở cả hai bảng?"

AI Summary: Mặc định JOIN trong MySQL là INNER JOIN. Nó chỉ trả về các dòng có sự trùng khớp khóa giữa hai bảng. Bản ghi không khớp sẽ bị loại bỏ completely.

Prompt 2: Hàm COUNT() trong LEFT JOIN

User: "Khi tôi sử dụng LEFT JOIN và đếm số lượng đơn hàng bằng hàm COUNT, tôi nên dùng COUNT(*) hay COUNT(tên_cột_khóa_chính_bảng_order)? Sự khác biệt khi kết quả trả về NULL là gì?"

AI Summary: Dùng COUNT(order_id) vì nó bỏ qua các ô NULL, cho ra số lượng đếm bằng 0 cho bản ghi mồ côi. COUNT(*) đếm số dòng nên sẽ trả về 1 cho dòng chứa NULL.

Prompt 3: Hiệu năng Anti-Join vs Subquery

User: "Hãy phân tích hiệu năng (Performance) của việc dùng LEFT JOIN kết hợp IS NULL so với việc dùng subquery NOT IN khi muốn tìm kiếm các bản ghi không tồn tại trong bảng khác."

AI Summary: LEFT JOIN ... WHERE IS NULL (Anti-Join) có hiệu năng tốt hơn NOT IN trong MySQL vì query planner tối ưu hóa tốt hơn và tránh được vấn đề xử lý logic NULL bất ngờ của NOT IN.

Prompt 4: Mở rộng về MySQL Optimizer & Nested-Loop Join

User: "MySQL Optimizer thực thi các câu lệnh JOIN bằng thuật toán gì? Sự khác biệt giữa Block Nested-Loop (BNL) và Index Nested-Loop Join là gì?"

AI Summary: MySQL sử dụng các biến thể của thuật toán Nested-Loop Join (NLJ). Khi có chỉ mục (Index), MySQL dùng Index Nested-Loop Join truy xuất cực nhanh. Khi không có chỉ mục, MySQL áp dụng Block Nested-Loop (BNL) hoặc Hash Join (từ MySQL 8.0+) để load dữ liệu vào bộ nhớ đệm (Join Buffer) nhằm giảm bớt số lần đọc đĩa.
