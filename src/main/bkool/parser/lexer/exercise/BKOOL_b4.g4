grammar BKOOL_b4; // do quy định, quy định răng để rứa

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
Dùng biểu thức chính quy
- cho token SHEXA 
- mô tả các chuỗi số thập lục phân thoả mãn tất cả các yêu cầu sau:

- không rỗng
- tương ứng với một số nguyên chẵn
- có ký tự đầu tiên chỉ gồm các ký tự số
- không phân biệt chữ thường và hoa
- không sử dụng action khi viết biểu thức chính qui cho SHEXA

*/
//-------Start---------
//miễn răng kí tự chẵn ở cuối là đc kệ cha mấy thứ khác
SHEXA: [0-9] [0-9a-fA-F]* [02468ACEace] ;


//-------End---------
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines

//Nếu phía trên không có cái nào thỏa thì phải quăng ra token
ERROR_CHAR: . {raise ErrorToken(self.text)}; // dấu . match mọi kí tự
UNCLOSE_STRING: .;//btl mô tả 2 lỗi này là như nào
ILLEGAL_ESCAPE: .;