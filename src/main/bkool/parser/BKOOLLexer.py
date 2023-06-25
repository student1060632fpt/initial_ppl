# Generated from main/bkool/parser/BKOOL.g4 by ANTLR 4.9.2
from antlr4 import *
from io import StringIO
import sys
if sys.version_info[1] > 5:
    from typing import TextIO
else:
    from typing.io import TextIO


from lexererr import *



def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\7")
        buf.write("=\b\1\4\2\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7")
        buf.write("\4\b\t\b\4\t\t\t\3\2\3\2\3\2\3\2\3\2\6\2\31\n\2\r\2\16")
        buf.write("\2\32\7\2\35\n\2\f\2\16\2 \13\2\3\2\3\2\5\2$\n\2\3\3\3")
        buf.write("\3\3\4\7\4)\n\4\f\4\16\4,\13\4\3\5\3\5\3\6\6\6\61\n\6")
        buf.write("\r\6\16\6\62\3\6\3\6\3\7\3\7\3\7\3\b\3\b\3\t\3\t\2\2\n")
        buf.write("\3\3\5\2\7\2\t\2\13\4\r\5\17\6\21\7\3\2\5\3\2\62;\3\2")
        buf.write("\63;\5\2\13\f\17\17\"\"\2>\2\3\3\2\2\2\2\13\3\2\2\2\2")
        buf.write("\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\3#\3\2\2\2\5%\3\2")
        buf.write("\2\2\7*\3\2\2\2\t-\3\2\2\2\13\60\3\2\2\2\r\66\3\2\2\2")
        buf.write("\179\3\2\2\2\21;\3\2\2\2\23$\5\5\3\2\24\25\5\t\5\2\25")
        buf.write("\36\5\7\4\2\26\30\7a\2\2\27\31\t\2\2\2\30\27\3\2\2\2\31")
        buf.write("\32\3\2\2\2\32\30\3\2\2\2\32\33\3\2\2\2\33\35\3\2\2\2")
        buf.write("\34\26\3\2\2\2\35 \3\2\2\2\36\34\3\2\2\2\36\37\3\2\2\2")
        buf.write("\37!\3\2\2\2 \36\3\2\2\2!\"\b\2\2\2\"$\3\2\2\2#\23\3\2")
        buf.write("\2\2#\24\3\2\2\2$\4\3\2\2\2%&\7\62\2\2&\6\3\2\2\2\')\t")
        buf.write("\2\2\2(\'\3\2\2\2),\3\2\2\2*(\3\2\2\2*+\3\2\2\2+\b\3\2")
        buf.write("\2\2,*\3\2\2\2-.\t\3\2\2.\n\3\2\2\2/\61\t\4\2\2\60/\3")
        buf.write("\2\2\2\61\62\3\2\2\2\62\60\3\2\2\2\62\63\3\2\2\2\63\64")
        buf.write("\3\2\2\2\64\65\b\6\3\2\65\f\3\2\2\2\66\67\13\2\2\2\67")
        buf.write("8\b\7\4\28\16\3\2\2\29:\13\2\2\2:\20\3\2\2\2;<\13\2\2")
        buf.write("\2<\22\3\2\2\2\b\2\32\36#*\62\5\3\2\2\b\2\2\3\7\3")
        return buf.getvalue()


class BKOOLLexer(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    INTLIT = 1
    WS = 2
    ERROR_CHAR = 3
    UNCLOSE_STRING = 4
    ILLEGAL_ESCAPE = 5

    channelNames = [ u"DEFAULT_TOKEN_CHANNEL", u"HIDDEN" ]

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
 ]

    symbolicNames = [ "<INVALID>",
            "INTLIT", "WS", "ERROR_CHAR", "UNCLOSE_STRING", "ILLEGAL_ESCAPE" ]

    ruleNames = [ "INTLIT", "ONLY_ZERO", "NUMBER", "START_NO_ZERO", "WS", 
                  "ERROR_CHAR", "UNCLOSE_STRING", "ILLEGAL_ESCAPE" ]

    grammarFileName = "BKOOL.g4"

    def __init__(self, input=None, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.9.2")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


    def action(self, localctx:RuleContext, ruleIndex:int, actionIndex:int):
        if self._actions is None:
            actions = dict()
            actions[0] = self.INTLIT_action 
            actions[5] = self.ERROR_CHAR_action 
            self._actions = actions
        action = self._actions.get(ruleIndex, None)
        if action is not None:
            action(localctx, actionIndex)
        else:
            raise Exception("No registered action for:" + str(ruleIndex))


    def INTLIT_action(self, localctx:RuleContext , actionIndex:int):
        if actionIndex == 0:
            self.text = self.text.replace("_","")
     

    def ERROR_CHAR_action(self, localctx:RuleContext , actionIndex:int):
        if actionIndex == 1:
            raise ErrorToken(self.text)
     


