# Generated from f:\\BACH_KINH_XAY\\223\\ppl\\draft\\initial\\src\\main\\bkool\\parser\\BKOOL copy.g4 by ANTLR 4.9.2
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
        buf.write("?\b\1\4\2\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7")
        buf.write("\4\b\t\b\4\t\t\t\4\n\t\n\3\2\3\2\3\2\3\2\3\2\3\2\3\3\3")
        buf.write("\3\5\3\36\n\3\3\3\5\3!\n\3\3\3\5\3$\n\3\3\3\5\3\'\n\3")
        buf.write("\3\4\6\4*\n\4\r\4\16\4+\3\5\3\5\3\6\3\6\3\7\6\7\63\n\7")
        buf.write("\r\7\16\7\64\3\7\3\7\3\b\3\b\3\b\3\t\3\t\3\n\3\n\2\2\13")
        buf.write("\3\3\5\2\7\2\t\2\13\2\r\4\17\5\21\6\23\7\3\2\6\3\2c|\6")
        buf.write("\2\60\60\62;aac|\5\2\62;aac|\5\2\13\f\17\17\"\"\2@\2\3")
        buf.write("\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3")
        buf.write("\2\2\2\3\25\3\2\2\2\5\33\3\2\2\2\7)\3\2\2\2\t-\3\2\2\2")
        buf.write("\13/\3\2\2\2\r\62\3\2\2\2\178\3\2\2\2\21;\3\2\2\2\23=")
        buf.write("\3\2\2\2\25\26\5\7\4\2\26\27\7\60\2\2\27\30\5\7\4\2\30")
        buf.write("\31\5\5\3\2\31\32\5\13\6\2\32\4\3\2\2\2\33\35\5\t\5\2")
        buf.write("\34\36\5\t\5\2\35\34\3\2\2\2\35\36\3\2\2\2\36 \3\2\2\2")
        buf.write("\37!\5\t\5\2 \37\3\2\2\2 !\3\2\2\2!#\3\2\2\2\"$\5\t\5")
        buf.write("\2#\"\3\2\2\2#$\3\2\2\2$&\3\2\2\2%\'\5\t\5\2&%\3\2\2\2")
        buf.write("&\'\3\2\2\2\'\6\3\2\2\2(*\t\2\2\2)(\3\2\2\2*+\3\2\2\2")
        buf.write("+)\3\2\2\2+,\3\2\2\2,\b\3\2\2\2-.\t\3\2\2.\n\3\2\2\2/")
        buf.write("\60\t\4\2\2\60\f\3\2\2\2\61\63\t\5\2\2\62\61\3\2\2\2\63")
        buf.write("\64\3\2\2\2\64\62\3\2\2\2\64\65\3\2\2\2\65\66\3\2\2\2")
        buf.write("\66\67\b\7\2\2\67\16\3\2\2\289\13\2\2\29:\b\b\3\2:\20")
        buf.write("\3\2\2\2;<\13\2\2\2<\22\3\2\2\2=>\13\2\2\2>\24\3\2\2\2")
        buf.write("\t\2\35 #&+\64\4\b\2\2\3\b\2")
        return buf.getvalue()


class BKOOLLexer(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    BKNETID = 1
    WS = 2
    ERROR_CHAR = 3
    UNCLOSE_STRING = 4
    ILLEGAL_ESCAPE = 5

    channelNames = [ u"DEFAULT_TOKEN_CHANNEL", u"HIDDEN" ]

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
 ]

    symbolicNames = [ "<INVALID>",
            "BKNETID", "WS", "ERROR_CHAR", "UNCLOSE_STRING", "ILLEGAL_ESCAPE" ]

    ruleNames = [ "BKNETID", "NAM_LAN", "HO_TEN", "CHUOI", "CUOI", "WS", 
                  "ERROR_CHAR", "UNCLOSE_STRING", "ILLEGAL_ESCAPE" ]

    grammarFileName = "BKOOL copy.g4"

    def __init__(self, input=None, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.9.2")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


    def action(self, localctx:RuleContext, ruleIndex:int, actionIndex:int):
        if self._actions is None:
            actions = dict()
            actions[6] = self.ERROR_CHAR_action 
            self._actions = actions
        action = self._actions.get(ruleIndex, None)
        if action is not None:
            action(localctx, actionIndex)
        else:
            raise Exception("No registered action for:" + str(ruleIndex))


    def ERROR_CHAR_action(self, localctx:RuleContext , actionIndex:int):
        if actionIndex == 0:
            raise ErrorToken(self.text)
     


