import UIKit

var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS.";
//分别找到起始点和结束点
let index1 = str.index(str.startIndex, offsetBy: 6)
let index2 = str.index(str.startIndex, offsetBy: 21)

let str1 = str[index1..<index2]
print(str1)

let str2 = str.replacingOccurrences(of:"OS", with:"")
print(str2)
