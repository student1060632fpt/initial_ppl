grammar BKOOL_p3; // do quy định, quy định răng để rứa

@lexer::header {
from lexererr import *
}

options {
	language=Python3;
}
// luật sinh ngữ pháp
program: ;
/*
-Đề:
Anh:	Use ANTLR to write regular expressions describing Pascal strings are made up of 
a sequence of characters between single quotes: 'string'. 
The single quote itself can appear as two single quotes back to back in a string: 'isn''t'.
Vịt:
Viết biểu thức chính quy:
1. Kí tự nằm ở giữa 2 dấu nháy đơn -> không thể có lẻ dấu nháy đơn
2. Nếu có dấu nháy đơn ở giữa phải có 2 dấu liên tục
*/
//-------Start---------

/*
để bắt được kí tự dấu nháy đơn ta có 2 cách viết:
1. '\''
2. sử dụng liệt kê, chả cần kẹp gì hết
Có 2 cách viết ngoại trừ dấu nháy đơn:
1. ~[']
2. ~('\'') cách này chỉ còn dùng ở phiên bản cũ

chú ý: 
1. [''] viết kiểu này là tập hợp 2 dấu nháy đơn-> chỉ bắt 1 dấu thui đó -> nên phải viết tách ra singQ 2 lần
2. việc thêm ? vào * thành *? khác nhau, chỉ xảy ra trong antlr
	a. * không thôi thì sẽ bắt từ dấu nháy đầu tiên tới dấu nháy cuối cùng, tức cố gắng bắt dài nhất có thể longest possible, tính tham lam : greedy
	b. *? bắt dấu nháy đầu tiên tới dấu nháy gần nhất, rồi từ dấu nháy sau đó tới dấu nháy cuối cùng, ko tham nữa: non greedy
3. non-greedy dùng cho comment, vì nó ko tham lam
*/
STRINGLIT: SING_Q (~['] | SING_Q SING_Q)* SING_Q;

fragment SING_Q: ['];

//-------End---------
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines

//Nếu phía trên không có cái nào thỏa thì phải quăng ra token
ERROR_CHAR: . {raise ErrorToken(self.text)}; // dấu . match mọi kí tự
UNCLOSE_STRING: .;//btl mô tả 2 lỗi này là như nào
ILLEGAL_ESCAPE: .;