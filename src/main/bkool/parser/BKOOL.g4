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
Anh:	Use ANTLR to write regular expressions describing PHP's integers (in decimal) which is a sequence of digits (0-9) starting with a non-zero digit or only a zero. 
Integer literals may contain underscores (_) between digits, 
for better readability of literals but these underscores are removed by PHP's scanner.
Vịt:
Dùng biểu thức chính quy
- php: integer là 1 chuỗi kí tự
	+từ 0-9
	+kí tự bắt đầu != 0
	+TH1: hoặc chỉ có 1 số 0 mà thôi 
	- integer literal có thể chứa _ ở giữa digit -> tức là sau _ phải có digit
*/
//-------Start---------

INTLIT: ONLY_ZERO
| START_NO_ZERO NUMBER ('_' [0-9]+)*
;

//Cho trường hợp chỉ có 1 số 0 mà thôi
fragment ONLY_ZERO: '0';
//và phần còn lại
fragment NUMBER: [0-9]*;
fragment START_NO_ZERO: [1-9];





//-------End---------
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines

//Nếu phía trên không có cái nào thỏa thì phải quăng ra token
ERROR_CHAR: . {raise ErrorToken(self.text)}; // dấu . match mọi kí tự
UNCLOSE_STRING: .;//btl mô tả 2 lỗi này là như nào
ILLEGAL_ESCAPE: .;