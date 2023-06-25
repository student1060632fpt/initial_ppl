grammar BKOOL_b1; // do quy định, quy định răng để rứa

@lexer::header {
from lexererr import *
}

options {
	language=Python3;
}
// luật sinh ngữ pháp
program: ;
//-------Start---------

IDENTIFIER: [a-z] [a-z0-9]*;
//[a-z] bắt đầu từ chữ cái thường
// có thể có nhiều kí tự [a-z0-9], có thể viết chi tiết ([a-z]|[0-9])*
//-------End---------
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines

ERROR_CHAR: . {raise ErrorToken(self.text)};
UNCLOSE_STRING: .;
ILLEGAL_ESCAPE: .;