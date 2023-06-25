import unittest
from TestUtils import TestLexer

class LexerSuite(unittest.TestCase):
      
    def test1(self):
        """test simple string"""
        input = "abc"
        expect = "abc,<EOF>"
        self.assertTrue(TestLexer.test(input,expect,101))
        # hàm assertTrue để test 

    # def test_complex_string(self):
    #     """test complex string"""
    #     self.assertTrue(TestLexer.test("'isn''t'","'isn''t',<EOF>",102))
    