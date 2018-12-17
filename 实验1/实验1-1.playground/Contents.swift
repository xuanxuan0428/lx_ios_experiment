import UIKit

var prime = [Int]()  //创建一个空数组

for i in 2...10000{
    var flag = true
    for j in 2..<i {
        if i%j==0 {
            flag = false
        }
    }
    if flag {
        prime.append(i)   //将找出的质数存入数组
    }
}

func compare (x:Int,y:Int)->Bool {
    return x>y
}

print(prime)  //正序输出

prime.sort(by:compare)
print(prime)  //逆序输出

//下面都是用不同方法实现排序并输出结果
prime.sort(by: {
    (x:Int,y:Int)->Bool in
    return x>y
})
print(prime)

prime.sort(by: {
    (x,y) in
    return x>y
})
print(prime)

prime.sort(by: {
    (x,y) in
    x>y
})
print(prime)

prime.sort(by: { $0 > $1 })
print(prime)

prime.sort{ $0 > $1 }
print(prime)

prime.sort( by: > )
print(prime)

