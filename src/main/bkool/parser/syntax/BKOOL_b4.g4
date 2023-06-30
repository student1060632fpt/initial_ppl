grammar BKOOL_b4; // do quy định, quy định răng để rứa

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

An expression is a construct which is made up of operators and operands. They calculate on their operands and return new value. 
There are four kinds of infix operators: ’+’, ’-’, ’*’ and ’/’ where:
- ’+’ have lower precedence than ’-’ 
- while ’*’ and ’/’ have the highest precedence among these operators. 
- The ’+’ operator is right associative, ’-’ is non-associative while ’*’ and ’/’ is left-associative. To change the precedence, a sub-expression is enclosed in round brackets. The operands can be an integer literal, float literal, an identifier, a call or a sub-expression.

For example:

int a, b, c;
float foo(int a; float c, d) {
     int e;
     e = a + 4;
     c = a * d / 2.0;
     return c + 1;
}
float goo(float a, b) {
     return foo(1, a, b);
}
Some tokens:

1. An identifier includes a sequence of alphabetic characters.

2. An integer number includes a sequence of numerical characters.

3. A real (float) number includes two parts: integer and fractional parts. The integer and fractional part are like a integer number, but separated by a point (.).



Your task:

Write a grammar of the program in BKOOL using ANTLR and submit its generation files to this exercise.

Vịt:
expression có toán hạng và toán tử

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

expr: expr1 ADD expr | expr1;
expr1: expr2 SUB expr2 | expr2;
expr2: expr2 (MUL | DIV) expr3| expr3;
expr3: INTLIT | FLOATLIT | ID | callexpr | subexpr;
callexpr: ID LB exprlist RB;
subexpr: LB expr RB;

// foo();
// a = foo() + 1

ADD: '+';
SUB: '-';
MUL: '*';
DIV: '/';
INTLIT: ONLY_ZERO
| START_NO_ZERO NUMBER ('_' [0-9]+)* {self.text = self.text.replace("_","")};

//Cho trường hợp chỉ có 1 số 0 mà thôi
fragment ONLY_ZERO: '0';
//và phần còn lại
fragment NUMBER: [0-9]*;
fragment START_NO_ZERO: [1-9];

// có thể là dấu chấm động hoặc 0
FLOATLIT: INT_PART DEC_PART | INT_PART DEC_PART? EX_PART ;

//phần nguyên
fragment INT_PART: [0-9]+;
//Phần thập phân
fragment DEC_PART: '.' INT_PART;
// exponent part
fragment EX_PART: [eE] [-+]? INT_PART;

//phần cũ
LP: '{';
RP: '}';
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