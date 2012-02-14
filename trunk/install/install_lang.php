<?php
if (!defined('THINKSNS_INSTALL'))
{
	exit ('Access Denied');
}

$i_message['install_lock'] = 'Hệ thống phát hiện ThinkSNS ' . $_TSVERSION . ', đã được cài đặt, nếu bạn muốn cài đặt lại, hãy xóa tệp tin install.lock trong thư mục install';
$i_message['install_title'] = 'ThinkSNS ' . $_TSVERSION . ' thuật sĩ cài đặt';
$i_message['install_wizard'] = 'Thuật sĩ cài đặt';
$i_message['install_warning'] = '<strong>Chú ý </strong>Đây là trang được sử dụng trong lần đầu tiên khi bạn truy cập để cài đặt, nếu bạn muốn update hãy truy cập thư mục update';
$i_message['install_intro'] = '<h4>Ghi chú cài đặt </h4>
<p>I, Yêu cầu hệ thống: PHP(5.2.0+)+MYSQL(4.1+)</p>
<p>II, Các bước cài đặt
<br /><br />
1, Sử dụng trình FTP để upload toàn bộ tệp tin lên máy chủ.
<br /><br />
2, Nếu bạn sử dụng hđh Unix, hãy thiết lập CHMOD thành 777 với các thư mục,tệp tin sau
<br /><br />
Thư mục: data
<br />
Thư mục: _runtime
<br />
Thư mục: install
<br />
Tệp tin: config.inc.php
<br />
Tệp tin: define.inc.php
<br />
3, Địa chỉ cài đặt là: http://yourdomain.ltd/install/install.php
<br />
4, Để xóa cache vào: ttp://yourwebsite/thinksns/cleancache.php
<br />
5, Trang chủ của website là ttp://yourwebsite/thinksns/index.php
</p>';
$i_message['install_start'] = 'Bắt đầu cài đặt';
$i_message['install_license_title'] = 'Điều khoản sử dụng';
$i_message['install_license'] = 'Bản quyền thuộc về ThinkSNS 2008-'.date('Y').'.

Nội dung thông tin bản quyền sẽ được update sau

';
$i_message['install_agree'] = 'Tôi đã đọc và đồng ý với điều khoản';
$i_message['install_disagree'] = 'Không đồng ý';
$i_message['install_disagree_license'] = 'Bạn phải đồng ý với điều khoản sử dụng thì mới có thể cài đặt';
$i_message['install_prev'] = 'Bước trước';
$i_message['install_next'] = 'Tiếp tục';
$i_message['dirmod'] = 'Kiểm tra quyền thư mục,tệp';
$i_message['install_dirmod'] = 'Các thư mục và tệp phải được cấp quyền ghi, nếu có lỗi phát sinh, vui lòng đổi CHMOD thành 777';
$i_message['install_env'] = 'Cấu hình máy chủ';
$i_message['php_os'] = 'Hệ điều hành';
$i_message['php_version'] = 'Phiên bản';
$i_message['file_upload'] = 'Upload max';
$i_message['support'] = 'Hỗ trợ';
$i_message['unsupport'] = 'Không hỗ trợ';
$i_message['php_extention'] = 'PHP Extension';
$i_message['php_extention_unload_gd'] = 'Phần mở rộng php: gd';
$i_message['php_extention_unload_mbstring'] = 'Phần mở rộng php: mbstring';
$i_message['php_extention_unload_mysql'] = 'Phần mở rộng php: mysql';
$i_message['php_extention_unload_curl'] = 'Phần mở rộng php: curl';
$i_message['mysql'] = 'MySQL database';
$i_message['mysql_unsupport'] = 'Máy chủ của bạn không hỗ trợ MySQL, không thể cài đặt';
$i_message['install_setting'] = 'Thiết lập thông số kết nối, tài khoản quản trị';
$i_message['install_mysql'] = 'Cấu hình cơ sở dữ liệu';
$i_message['install_mysql_host'] = 'Máy chủ dữ liệu';
$i_message['install_mysql_host_intro'] = 'Địa chỉ máy chủ (:port) thường là localhost';
$i_message['install_mysql_username'] = 'Tài khoản db';
$i_message['install_mysql_password'] = 'Mật khẩu db';
$i_message['install_mysql_name'] = 'Tên db';
$i_message['install_mysql_prefix'] = 'Tiền tố';
$i_message['install_mysql_prefix_intro'] = 'Nếu bạn muốn cài đặt website khác, cùng trong 1 csdl';
$i_message['site_url'] = ' Địa chỉ website';
$i_message['site_url_intro'] = '';
$i_message['founder'] = 'Thông tin quản trị tối cao';
$i_message['install_founder_name'] = 'Tài khoản';
$i_message['install_founder_password'] = 'Mật khẩu';
$i_message['install_founder_rpassword'] = 'Xác nhận';
$i_message['install_founder_email'] = 'Email';
$i_message['install_mysql_host_empty'] = 'Bạn phải nhập địa chỉ máy chủ';
$i_message['install_mysql_username_empty'] = 'Tên tài khoản không được để trống';
$i_message['install_mysql_name_empty'] = 'Bạn phải nhập tên cơ sở dữ liệu';
$i_message['install_founder_name_empty'] = 'Tên tài khoản quản trị không được để trống';
$i_message['install_founder_password_length'] = 'Mật khẩu quản trị phải nhiều hơn 6 ký tự';
$i_message['install_founder_rpassword_error'] = 'Mật khẩu xác nhận không trùng khớp!';
$i_message['install_founder_email_empty'] = 'Địa chỉ email quản trị không được để trống!';
$i_message['mysql_invalid_configure'] = 'Bạn chưa nhập đầy đủ thông tin kết nối';
$i_message['mysql_invalid_prefix'] = 'Bạn nhập giá trị tiền tố không hợp lệ (dấu .), hãy sửa lại.';
$i_message['forbidden_character'] = 'Tên tài khoản có chứa ký tự không hợp lệ';
$i_message['founder_invalid_email'] = 'Định dạng email không hợp lệ';
$i_message['founder_invalid_configure'] = 'Bạn chưa nhập đầy đủ thông tin quản trị';
$i_message['founder_invalid_password'] = 'Chiều dài mật khẩu phải có nhiều hơn 6 ký tự';
$i_message['founder_invalid_rpassword'] = 'Mật khẩu không trùng khớp';
$i_message['founder_intro'] = 'Quản trị tối cao, có quyền cao nhất';
$i_message['config_log_success']	= 'Lưu thông tin cấu hình kết nối thành công';
$i_message['define_log_success']	= 'Lưu thông tin cấu hình chung website thành công';
$i_message['config_read_failed'] = 'Lưu thông tin kết nối không thành công, vui lòng kiếm tra tệp config.inc.php xem đã đặt CHMOD 777 chưa';
$i_message['define_read_failed'] = 'Lưu thông tin cấu hình chung hệ thống không thành công, vui lòng kiểm tra tệp define.inc.php';
$i_message['error'] = 'Lỗi';
$i_message['database_errno_2003'] = 'Không thể kết nối tới csdl, vui lòng kiểm tra lại thông số máy chủ';
$i_message['database_errno_1045'] = 'Không thể kết nối tới csdl, vui lòng kiểm tra lại tài khoản, mật khẩu dữ liệu';
$i_message['database_errno_1044'] = 'Không thể tạo db mới, hãy kiểm tra lại tên dữ liệu';
$i_message['database_errno_1064'] = 'Thực thi truy vấn SQL lỗi, hãy kiểm tra lại tên db';
$i_message['database_errno'] = 'Trong quá trình thực thi truy vấn tới csdl có lỗi phát sinh, không thể tiếp tục cài đặt.';
$i_message['configure_read_failed'] = 'Cấu hình csdl không thành công';
$i_message['mysql_version_402'] = 'Phiên bản MySQL của bạn thấp hơn 4.1.0, không thể cài đặt';
$i_message['thinksns_rebuild'] = 'Có dữ liệu cũ đã tồn tại, nếu bạn tiếp tục cài đặt ThinkSNS sẽ xóa toàn bộ dữ liệu cũ';
$i_message['mysql_import_data'] = 'Nhấn tiếp tục để bắt đầu import dữ liệu';
$i_message['import_processing'] = 'Import dữ liệu';
$i_message['import_processing_error'] = 'Có lỗi khi import csdl';
$i_message['create_table'] = 'Tạo bảng';
$i_message['create_founder'] = 'Tạo tài khoản quản trị';
$i_message['create_founder_success'] = 'Tạo tài khoản quản trị thành công';
$i_message['create_founder_error']	= 'Tạo tài khoản quản trị không thành công';
$i_message['create_founderpower_success'] = 'Thiết lập đặc quyền tài khoản quản trị thành công';
$i_message['create_founderpower_error']	= 'Có lỗi phát sinh khi thiết lập đặc quyền quản trị';
$i_message['create_cache'] = 'Tạo tệp cache';
$i_message['create_cache_success'] = 'Đã tạo cache thành công';
$i_message['auto_increment'] = 'Mã ID bắt đầu';
$i_message['set_auto_increment_success'] = 'Thiết lập id khởi đầu thành công';
$i_message['set_auto_increment_error'] = 'Có lỗi phát sinh khi thiết lập id khởi đầu';
$i_message['install_success'] = 'Cài đặt thành công';
$i_message['install_success_intro'] = '<p>Cài đặt thành công, sau khi cài đặt, bạn hãy xóa thư mục cài đặt để đảm bảo an toàn, nếu bạn muốn cài đặt lại, xóa xóa tệp install.lock</p><p><a href="../index.php">Truy cập trang chủ</a></p>';
$i_message['install_dbFile_error'] = 'Không thể đọc tệp chứa csdl mẫu, hãy kiểm tra /install/t_thinksns_com.sql.';