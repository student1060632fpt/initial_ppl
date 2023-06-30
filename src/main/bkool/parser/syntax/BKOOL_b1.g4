grammar BKOOL_b1; // do quy định, quy định răng để rứa

@lexer::header {
from lexererr import *
}

options {
	language=Python3;
}
/*
-Đề:
Anh:	
Given the description of a program in BKOOL as follows: 
A program in BKOOL consists of many declarations, which are variable and function declarations. 
Modify the BKOOL.g4 as follows:
program: // write for program rule here using vardecl and funcdecl
vardecl: 'vardecl' ;
funcdecl: 'funcdecl' ;
WS: [ \t\r\n] -> skip;
ERROR_CHAR: . {raise ErrorToken(self.text)};
Vịt:
cho mô tả của chương trình BKOOL như sau
- một chương trình trong BKOOL có thể chứa nhìu declaration, ví dụ như var và func
- định nghĩ BKOOL.g4 như sau:
	- program: // viết program rule để dùng vardecl và funcdecl

*/

//-------Start---------
//viết bằng BNF
program: decls EOF;
decls: decl decls | decl; //đệ quy
decl: vardecl | funcdecl;

// // EBNF
// program: decl+ EOF;
// decl: vardecl | funcdecl;

// // EBNF - 2
// program: (vardecl | funcdecl)+ EOF;

vardecl: 'vardecl' ;
funcdecl: 'funcdecl' ;






//-------End---------
WS: [ \t\r\n] -> skip;

ERROR_CHAR: . {raise ErrorToken(self.text)};
UNCLOSE_STRING: .;//btl mô tả 2 lỗi này là như nào
ILLEGAL_ESCAPE: .;