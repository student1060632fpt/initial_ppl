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
Viết biểu thức chính quy:
1. Kí tự nằm ở giữa 2 dấu nháy đơn -> không thể có lẻ dấu nháy đơn
2. Nếu có dấu nháy đơn ở giữa phải có 2 dấu liên tục
*/
//-------Start---------
// có thể là dấu chấm động hoặc 0
REAL: INT_PART DEC_PART | INT_PART DEC_PART? EX_PART ;

//phần nguyên
fragment INT_PART: [0-9]+;
//Phần thập phần
fragment DEC_PART: '.' INT_PART;
// exponent part
fragment EX_PART: [eE] [-+]? INT_PART;

//-------End---------
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines

//Nếu phía trên không có cái nào thỏa thì phải quăng ra token
ERROR_CHAR: . {raise ErrorToken(self.text)}; // dấu . match mọi kí tự
UNCLOSE_STRING: .;//btl mô tả 2 lỗi này là như nào
ILLEGAL_ESCAPE: .;