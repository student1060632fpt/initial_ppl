import unittest
from TestUtils import TestLexer

class LexerSuite(unittest.TestCase):
      
    def test1(self):
        """test simple string"""
        testfile = [101,102,103]
        input = "1.0"
        expect = "1.0,<EOF>"
        for item in testfile:
            print(item)
            self.assertTrue(TestLexer.test(input,expect,item))