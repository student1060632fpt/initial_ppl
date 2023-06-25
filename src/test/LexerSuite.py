import unittest
from TestUtils import TestLexer


class LexerSuite(unittest.TestCase):

    def test1(self):
        """test 1"""
        input = "1.0"
        expect = "1.0,<EOF>"
        self.assertTrue(TestLexer.test(input, expect, 101))

    def test2(self):
        """test 2"""
        input = ".01"
        expect = "Error Token ."
        self.assertTrue(TestLexer.test(input, expect, 102))
