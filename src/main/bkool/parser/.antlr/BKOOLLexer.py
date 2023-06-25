# Generated from f:\\BACH_KINH_XAY\\223\\ppl\\draft\\initial\\src\\main\\bkool\\parser\\BKOOL.g4 by ANTLR 4.9.2
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
        buf.write("\62\b\1\4\2\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t")
        buf.write("\7\4\b\t\b\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\3\3\3\5\3")
        buf.write("\34\n\3\3\4\3\4\5\4 \n\4\3\4\5\4#\n\4\3\5\6\5&\n\5\r\5")
        buf.write("\16\5\'\3\5\3\5\3\6\3\6\3\6\3\7\3\7\3\b\3\b\2\2\t\3\3")
        buf.write("\5\2\7\2\t\4\13\5\r\6\17\7\3\2\5\3\2\63;\3\2\62;\5\2\13")
        buf.write("\f\17\17\"\"\2\63\2\3\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2")
        buf.write("\2\r\3\2\2\2\2\17\3\2\2\2\3\21\3\2\2\2\5\33\3\2\2\2\7")
        buf.write("\35\3\2\2\2\t%\3\2\2\2\13+\3\2\2\2\r.\3\2\2\2\17\60\3")
        buf.write("\2\2\2\21\22\5\5\3\2\22\23\7\60\2\2\23\24\5\5\3\2\24\25")
        buf.write("\7\60\2\2\25\26\5\5\3\2\26\27\7\60\2\2\27\30\5\5\3\2\30")
        buf.write("\4\3\2\2\2\31\34\7\62\2\2\32\34\5\7\4\2\33\31\3\2\2\2")
        buf.write("\33\32\3\2\2\2\34\6\3\2\2\2\35\37\t\2\2\2\36 \t\3\2\2")
        buf.write("\37\36\3\2\2\2\37 \3\2\2\2 \"\3\2\2\2!#\t\3\2\2\"!\3\2")
        buf.write("\2\2\"#\3\2\2\2#\b\3\2\2\2$&\t\4\2\2%$\3\2\2\2&\'\3\2")
        buf.write("\2\2\'%\3\2\2\2\'(\3\2\2\2()\3\2\2\2)*\b\5\2\2*\n\3\2")
        buf.write("\2\2+,\13\2\2\2,-\b\6\3\2-\f\3\2\2\2./\13\2\2\2/\16\3")
        buf.write("\2\2\2\60\61\13\2\2\2\61\20\3\2\2\2\7\2\33\37\"\'\4\b")
        buf.write("\2\2\3\6\2")
        return buf.getvalue()


class BKOOLLexer(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    IP = 1
    WS = 2
    ERROR_CHAR = 3
    UNCLOSE_STRING = 4
    ILLEGAL_ESCAPE = 5

    channelNames = [ u"DEFAULT_TOKEN_CHANNEL", u"HIDDEN" ]

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
 ]

    symbolicNames = [ "<INVALID>",
            "IP", "WS", "ERROR_CHAR", "UNCLOSE_STRING", "ILLEGAL_ESCAPE" ]

    ruleNames = [ "IP", "PART", "NUM", "WS", "ERROR_CHAR", "UNCLOSE_STRING", 
                  "ILLEGAL_ESCAPE" ]

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
            actions[4] = self.ERROR_CHAR_action 
            self._actions = actions
        action = self._actions.get(ruleIndex, None)
        if action is not None:
            action(localctx, actionIndex)
        else:
            raise Exception("No registered action for:" + str(ruleIndex))


    def ERROR_CHAR_action(self, localctx:RuleContext , actionIndex:int):
        if actionIndex == 0:
            raise ErrorToken(self.text)
     


