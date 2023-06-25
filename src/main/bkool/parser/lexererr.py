# File chuyên bắt lỗi , 
# trong bài tập lớn đòi bắt 3 lỗi liên quan tới lỗi về mặt từ vựng:

from abc import ABC
class LexerError(ABC,Exception):
	pass
# Lỗi không phù hợp với bất kì mô tả nào hết
class ErrorToken(LexerError):
    def __init__(self,s):
        self.message = "Error Token "+ s

# string mở ra nhưng ko đóng lại
class UncloseString(LexerError):
    def __init__(self,s):
        self.message = "Unclosed String: "+ s

# sử dụng mí cái xẹt không được quy định
class IllegalEscape(LexerError):
    def __init__(self,s):
        self.message = "Illegal Escape In String: "+ s



