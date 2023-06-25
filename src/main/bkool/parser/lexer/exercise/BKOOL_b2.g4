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
Anh:	Use ANTLR to write regular expressions describing a valid IPv4 address. It consists of exact 4 strings, whose length is from 1 to 3, of digits (0-9) but not starting with 0 unless the string is 0. The strings are separated by one dot (.). 
Vịt:
Dùng biểu thức chính quy
- mô tả địa chỉ IPv4
- 4 chuỗi: 

*/
//-------Start---------
IP: PART '.' PART '.' PART '.' PART;

fragment PART :'0' | NUM;
fragment NUM: [1-9] [0-9]? [0-9]?;

//-------End---------
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines

//Nếu phía trên không có cái nào thỏa thì phải quăng ra token
ERROR_CHAR: . {raise ErrorToken(self.text)}; // dấu . match mọi kí tự
UNCLOSE_STRING: .;//btl mô tả 2 lỗi này là như nào
ILLEGAL_ESCAPE: .;