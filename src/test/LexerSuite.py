import unittest
from TestUtils import TestLexer


class LexerSuite(unittest.TestCase):

    def test1(self):
        """test 1"""
        input = "'Yanxi Palace - 2018'"
        expect = "'Yanxi Palace - 2018',<EOF>"
        self.assertTrue(TestLexer.test(input, expect, 101))

    def test_complex_string(self):
        """test complex string"""
        self.assertTrue(TestLexer.test("'isn''t'","'isn''t',<EOF>",102))
    
