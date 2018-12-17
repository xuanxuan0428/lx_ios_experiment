import UIKit

//函数类型为(Int) -> Int
func f0(a: Int) -> Int {
    return a
}

//函数类型为(String) -> Int
func f1(a: String) -> Int {
    return Int(a)!
}

//函数类型为() -> Int
func f2() -> Int {
    return 2
}

//函数类型为(Int) -> Void
func f3(a: Int) {
    
}

//函数类型为(Int) -> Int
func f4(a: Int) -> Int {
    return a + 1
}

var funcArray: [Any] = [f0, f1, f2, f3, f4]
for (index, value) in funcArray.enumerated() {
    //因为循环过程中需要设计到数组的下标，要将数组元素一一列举出来，所以需要调用数组的enumerated()方法。
    if value is (Int) -> Int {
        print(index)  //输出类型为(Int) -> Int的函数在数组中的下标
    }
}

