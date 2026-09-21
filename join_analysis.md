Giải trình kĩ thuật: Báo cáo Marketing

Việc sử dụng COUNT(o.order_id) thay vì COUNT(*) là yếu tố quyết định tính chính xác của báo cáo Marketing khi dùng LEFT JOIN.

Hàm COUNT(*) đếm tất cả các dòng trả về trong nhóm, bao gồm cả các dòng có chứa giá trị NULL. Khi khách hàng chưa từng mua hàng (như Charlie), LEFT JOIN vẫn giữ lại thông tin khách hàng và ghép với các giá trị NULL từ bảng Orders. Nếu dùng COUNT(*), câu truy vấn sẽ đếm dòng NULL này là 1, dẫn đến kết quả sai lệch rằng Charlie đã mua 1 đơn hàng.

Ngược lại, COUNT(o.order_id) chỉ đếm các giá trị không phải NULL (non-null) trên cột order_id của bảng Orders. Đối với khách hàng chưa phát sinh giao dịch, o.order_id mang giá trị NULL, do đó COUNT(o.order_id) trả về chính xác kết quả là 0.
