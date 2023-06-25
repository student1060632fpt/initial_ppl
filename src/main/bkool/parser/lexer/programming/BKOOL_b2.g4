grammar BKOOL_b2; // do quy định, quy định răng để rứa

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
Anh:	Pascal tokens For a number to be taken as "real" (or "floating point") format, it must either have a decimal point, or use scientific notation. For example, 1.0, 1e-12, 1.0e-12, 0.000000001 are all valid reals. At least one digit must exist on either side of a decimal point.
Vịt:
Viết biểu thức chính quy:
1. Sử dụng dấu chấm động *floating point*
2. Sử dụng kí hiểu khoa học như chữ e
3. Có ít nhất là 1 số nằm ở giữa 2 bên của dấu chấm động
*/
//-------Start---------
// có thể là dấu chấm động hoặc 0
REAL: INT_PART DEC_PART | INT_PART DEC_PART? EX_PART ;

//phần nguyên
fragment INT_PART: [0-9]+;
//Phần thập phân
fragment DEC_PART: '.' INT_PART;
// exponent part
fragment EX_PART: [eE] [-+]? INT_PART;

//-------End---------
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines

//Nếu phía trên không có cái nào thỏa thì phải quăng ra token
ERROR_CHAR: . {raise ErrorToken(self.text)}; // dấu . match mọi kí tự
UNCLOSE_STRING: .;//btl mô tả 2 lỗi này là như nào
ILLEGAL_ESCAPE: .;