grammar BKOOL_b2; // do quy định, quy định răng để rứa

@lexer::header {
from lexererr import *
}

options {
	language=Python3;
}
/*
-Đề:
Anh:	
A program in BKOOL consists of many declarations, which are variable and function declarations. 
A variable declaration starts with a type, which is int or float, then a comma-separated list of identifiers and ends with a semicolon. 
A function declaration also start with a type and then an identifier, which is the function name, and then parameter declaration and ends with a body. The parameter declaration starts with a left round bracket ’(’ and a null-able semicolon-separated list of parameters and ends with a right round bracket ’)’. Each parameter always starts with a type and then a comma-separated list of identifier. 
Modify BKOOL.g4 as follows:
program: // write your rule here
//And some other rules for variable declaration, function declaration and other rules
body: 'body';
ID: // includes a sequence of alphabetic characters.
WS: [ \t\r\n] -> skip;
ERROR_CHAR: . {raise ErrorToken(self.text)};
Vịt:
-1 cái var declare là int hoặc float, danh sách identifyer cách nhau bằng dấu ;
-1 cái func bđ bởi type tiếp tới identifier
*/

//-------Start---------
//viết bằng BNF
program: decls EOF;

decls: decl decls | decl; //đệ quy
decl: vardecl | funcdecl;

vardecl: typ idlist SEMI;
funcdecl: typ ID paramdecl body;

//ghi chữ typ thôi vì type là từ khóa trong antrl, vì var declare là int hoặc float;
typ: INT | FLOAT;

paramdecl: LB paramlist RB;			// ( -- 1;2;3;4 -- )
paramlist: paramprime | ; 			// 1; -- 2; -- 3; -- 4
paramprime: param SEMI paramprime | param; // 1 -- ; |-- 2 -- ; |-- 3 -- ;| -- 4 --
param: typ idlist; // int [a-zA-Z]+

idlist: ID(','ID)*;

body: 'body';
LB: '(';
RB: ')';
COMMA:',';
SEMI: ';';
FLOAT: 'float';
INT: 'int';
//nhớ là nó xếp theo thứ tự nên phải viết chữ INT và FLOAT trước, nếu ko nó sẽ dễ bị hiểu nhầm là ID
ID: [a-zA-Z]+;
//-------End---------
WS: [ \t\r\n] -> skip;

ERROR_CHAR: . {raise ErrorToken(self.text)};
UNCLOSE_STRING: .;//btl mô tả 2 lỗi này là như nào
ILLEGAL_ESCAPE: .;