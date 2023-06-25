import unittest
from TestUtils import TestLexer


class LexerSuite(unittest.TestCase):

    def test1(self):
        """test 1"""
        input = "21A"
        expect = "21A,<EOF>"
        self.assertTrue(TestLexer.test(input, expect, 101))

    def test_complex_string(self):
        """test complex string"""
        self.assertTrue(TestLexer.test("3dC","3dC,<EOF>",102))
    
