Set environment variable ANTLR_JAR to the file antlr-4.9.2-complete.jar in your computer
Change current directory to initial/src where there is file run.py
Type: python run.py gen
Then type: python run.py test LexerSuite
Then type: python run.py test ParserSuite
Then type: python run.py test ASTGenSuite
Then type: python run.py test CheckerSuite
Then type: python run.py test CodeGenSuite



// // câu 1
// program : (vardecl | funcdecl)+ EOF;
// vardecl: 'vardecl' ;
// funcdecl: 'funcdecl' ;


//cau2
	// program : (vardecl | funcdecl)+ EOF;	
	// vardecl : typ idlist ';';
	// idlist : ID(','ID)*;
	// funcdecl : typ ID paramdecl body ;

	// paramdecl: LB (listparam)? RB;
	// listparam : param(';'param)*;
	// param : typ idlist;
	// typ : ('int' | 'float');

	// ID: [a-zA-Z][a-zA-Z0-9]*;
	// body : 'body';
	// LB : '(';
	// RB : ')';


//cau3:
	// program : (vardecl | funcdecl)+ EOF;	
	// vardecl : typ idlist ';';
	// funcdecl : typ ID paramdecl body ;

	// paramdecl: LB (listparam)? RB;
	// listparam : param(';'param)*;
	// param : typ idlist;
	// typ : ('int' | 'float');

	// body : '{' (vardecl | stmt)* '}';
	// stmt : (assignment_stmt | call_stmt | return_stmt);

	// assignment_stmt : ID '=' expr ';';
	// call_stmt : ID LB list_expr? RB';';
	// return_stmt : 'return' expr ';';
	// list_expr : expr (','expr)*;
	// idlist : ID(','ID)*;
	// expr: 'expr';

	// ID: [a-zA-Z][a-zA-Z0-9]*;
	// LB : '(';
	// RB : ')';



// //cau4:
	// program : (vardecl | funcdecl)+ EOF;	
	// vardecl : typ idlist ';';
	// funcdecl : typ ID paramdecl body ;

	// paramdecl: LB (listparam)? RB;
	// listparam : param(';'param)*;
	// param : typ idlist;
	// typ : ('int' | 'float');

	// body : '{' (vardecl | stmt)* '}';
	// stmt : (assignment_stmt | call_stmt | return_stmt) ';';

	// assignment_stmt : ID '=' expr;
	// call_stmt : ID LB list_expr? RB;
	// return_stmt : 'return' expr;
	// list_expr : expr (','expr)*;
	// idlist : ID(','ID)*;
	// expr : '('expr')'| expr1;
	// expr1: expr2 '+' expr1 | expr2;
	// expr2 : expr2 '-' expr3 | expr3;
	// expr3 : expr3 ('*'|'/') expr4| expr4;
	// expr4 : ID | FLOAT | INT | call_stmt;

	// ID: [a-zA-Z][a-zA-Z0-9]*;
	// INT : [0-9]+;
	// FLOAT : [0-9]+'.'[0-9]+;
	// LB : '(';
	// RB : ')';

//cau5:
	// program : vardecl+ EOF ;	
	// vardecl : ID '=' expr';';

	// expr : expr '??' expr1 | expr1;
	// expr1 : expr2 ('+'|'-') expr1 | expr2;
	// expr2 : expr2 ('*'|'/'|'%') expr3 | expr3;
	// expr3 : expr3 '.' expr4 | expr4;
	// expr4 : expr5 '**' expr4 | expr5;
	// expr5 : LP expr RP | expr6; 
	// expr6 : ID | INTLIT | FLOATLIT | STRINGLIT | index_array | asso_array ;

	// index_array: 'array''(' list_expr? ')';
	// asso_array : 'array''(' pair_name_list? ')';
	// list_expr : expr (','expr)*;
	// pair_name : ID '=>' expr;
	// pair_name_list : pair_name (','pair_name)*;

	// ID: [a-z][a-zA-Z0-9]*;
	// INTLIT : [0-9]+;
	// FLOATLIT : [0-9]+'.'[0-9]+;
	// LP : '(';
	// RP : ')';
	// STRINGLIT: '\''(~('\'')|'\''(~('\''))*'\'')*'\'';