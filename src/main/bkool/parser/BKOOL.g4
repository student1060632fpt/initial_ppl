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
Anh:	Use ANTLR to write regular expressions describing Pascal strings are made up of 
a sequence of characters between single quotes: 'string'. 
The single quote itself can appear as two single quotes back to back in a string: 'isn''t'.
Vịt:
Viết biểu thức chính quy:
1. Kí tự nằm ở giữa 2 dấu nháy đơn -> không thể có lẻ dấu nháy đơn
2. Nếu có dấu nháy đơn ở giữa phải có 2 dấu liên tục
*/
//-------Start---------

/*
để bắt được kí tự dấu nháy đơn ta có 2 cách viết:
1. '\''
2. sử dụng liệt kê, chả cần kẹp gì hết
Có 2 cách viết ngoại trừ dấu nháy đơn:
1. ~[']
2. ~('\'') cách này chỉ còn dùng ở phiên bản cũ

chú ý: [''] viết kiểu này là tập hợp 2 dấu nháy đơn-> chỉ bắt 1 dấu thui đó
*/
STRINGLIT: SING_Q (~['] | SING_Q SING_Q)* SING_Q;

fragment SING_Q: ['];

//-------End---------
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines

//Nếu phía trên không có cái nào thỏa thì phải quăng ra token
ERROR_CHAR: . {raise ErrorToken(self.text)}; // dấu . match mọi kí tự
UNCLOSE_STRING: .;//btl mô tả 2 lỗi này là như nào
ILLEGAL_ESCAPE: .;