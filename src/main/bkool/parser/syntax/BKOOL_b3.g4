grammar BKOOL_b3; // do quy định, quy định răng để rứa

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
A function declaration also start with a type and then an identifier, which is the function name, and then parameter declaration and ends with a body. The parameter declaration starts with a left round bracket ’(’ and a null-able semicolon-separated list of parameters and ends with a right round bracket ’)’. Each parameter always starts with a type and then a comma-separated list of identifier. A body starts with a left curly bracket ’{’, follows by a null-able list of variable declarations or statements and ends with a right curly bracket ’}’. 
There are 3 kinds of statements: assignment, call and return. All statements must end with a semicolon. An assignment statement starts with an identifier, then an equal ’=’, then an expression. A call starts with an identifier and then follows by a null-able comma-separated list of expressions enclosed by round brackets. A return statement starts with a symbol ’return’ and then an expression. 
Modify BKOOL.g4 as follows:
program :// write your rule for program here
//And some other rules for variable declaration, function declaration, statements but using following expr for an expression
expr: 'expr';
ID: //includes a sequence of alphabetic characters
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

body: LP stmtlist RP;
stmtlist: stmt stmtlist | ;
stmt: assign | callstmt | rtnstmt | vardecl;
assign: ID EQ expr SEMI;
callstmt: ID LB exprlist RB SEMI;
exprlist: exprprime | ;
exprprime: expr COMMA exprprime | expr;
rtnstmt: RETURN expr SEMI;

LP: '{';
RP: '}';
expr: 'expr';
RETURN: 'return';
EQ: '=';
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