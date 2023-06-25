grammar BKOOL; // do quy định, quy định răng để rứa

@lexer::header {
from lexererr import *
}

options {
	language=Python3;
}
// luật sinh ngữ pháp
program: ;
/*
-Đề:
Anh:	
Vịt:
Khi nhập học tại trường Đại học Bách Khoa, sinh viên được yêu cầu đặt một tên tài khoản gọi là BKNetID, gồm ba thành phần theo thứ tự: tên, họ và chuỗi tự chọn. Giữa tên và họ, sinh viên phải đặt một dấu chấm (.). Tên và họ là chuỗi chỉ bao gồm các ký tự chữ thường với độ dài tối thiểu là 1. Chuỗi tự chọn là một chuỗi có chiều dài từ 1 đến 5 kí tự bao gồm chữ thường, ký tự số, dấu chấm, dấu gạch dưới nhưng không được kết thúc bằng dấu chấm.

Ví dụ: duy.tran2903, duy.tran.3_12 là các chuỗi BKNetID hợp lệ nhưng duy.tran2903. hoặc duy2.tran2903 là BKNetID không hợp lệ.

Hãy sử dụng ANTLR để viết biểu thức chính quy cho BKNetID nói trên. Sinh viên phải sử dụng fragment để nhận trọn điểm.*/
//-------Start---------

/*
*/
BKNETID : HO_TEN ('.') HO_TEN NAM_LAN CUOI ;

fragment NAM_LAN: CHUOI CHUOI? CHUOI? CHUOI? CHUOI?;
fragment HO_TEN: [a-z]+;
fragment CHUOI: [a-z0-9._];
fragment CUOI: [a-z0-9_];

//-------End---------
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines

//Nếu phía trên không có cái nào thỏa thì phải quăng ra token
ERROR_CHAR: . {raise ErrorToken(self.text)}; // dấu . match mọi kí tự
UNCLOSE_STRING: .;//btl mô tả 2 lỗi này là như nào
ILLEGAL_ESCAPE: .;