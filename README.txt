Set environment variable ANTLR_JAR to the file antlr-4.9.2-complete.jar in your computer
Change current directory to initial/src where there is file run.py
Type: python run.py gen 
Then type: python run.py test LexerSuite
Then type: python run.py test ParserSuite
Then type: python run.py test ASTGenSuite
Then type: python run.py test CheckerSuite
Then type: python run.py test CodeGenSuite



//luyen tap 1:
	// BKNETID : (TEN'.'TEN)(TUDO1)?(TUDO1)?(TUDO1)?(TUDO1)?(TUDO2);
	// fragment TEN: [a-z]+;
	// fragment TUDO1: [a-z0-9_.]|';';
	// fragment TUDO2: [a-z0-9_]|';';

	//luyen tap 2:
	// IPV4: (ST)'.'(ST)'.'(ST)'.'(ST);
	// fragment ST: [1-9][0-9]?[0-9]?| '0';

	// luyen tap 3:
	// DECIMAL : '0'|[1-9]([_]?[0-9])*{self.text = self.text.replace("_","")};


	// luyen tap 4:
	// SHEXA: [0-9][0-9A-Fa-f]*[02468ACEace];