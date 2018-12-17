import UIKit

//task 1
let currentDate = Date()
var formatter = DateFormatter()
formatter.dateFormat = "yyyy 年 M 月 dd 日 EEEE aa KK:mm"
formatter.locale = Locale(identifier: "zh_CN")

formatter.timeZone = TimeZone(abbreviation: "UTC+8:00")
let beijing = formatter.string(from: currentDate)
print("Beijing time:" + beijing)

formatter.timeZone = TimeZone(abbreviation: "UTC+9:00")
let tokyo = formatter.string(from: currentDate)
print("Tokyog time:" + tokyo)

formatter.timeZone = TimeZone(abbreviation: "UTC-5:00")
let newyork = formatter.string(from: currentDate)
print("NewYork time:" + newyork)
formatter.timeZone = TimeZone(abbreviation: "UTC+0:00")

let london = formatter.string(from: currentDate)
print("London time:" + london)

//task 2
var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS.";
//分别找到起始点和结束点
let index1 = str.index(str.startIndex, offsetBy: 6)
let index2 = str.index(str.startIndex, offsetBy: 21)

let str1 = str[index1..<index2]
print(str1)

let str2 = str.replacingOccurrences(of:"OS", with:"")

//task 3
print(str2)
let dic = ["date": ["Beijing": beijing, "Tokyo": tokyo, "NewYork": newyork, "London":london, "subString": str1]] as! AnyObject  //将字典转换为任意类型，便于后面写入文件
let defaultDoc = FileManager.default  //获取默认工作路径

//获取工作路径下的Document文件夹
let fileManager = FileManager.default
var path = fileManager.urls(for: .documentDirectory, in:.userDomainMask).first!

path.appendPathComponent("dic.txt")

try? dic.write(to: path, atomically: true)

