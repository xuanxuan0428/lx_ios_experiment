import UIKit

var array = ["a", "b", "c", "d", "1","2"]

var array1 = array.filter{ Int($0) != nil }
print(array1)

// $0表示计算后的结果, $1表示数组中的每一个元素
var array2 = array.reduce("", {$0 == "" ? $1 : $0 + "," + $1})
print(array2)

