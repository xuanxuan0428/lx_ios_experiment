import UIKit

var arr = [111,222,333,444,555,666]
let arr1 = arr.reduce((max:arr[0],min:arr[0],sum:0),{(max:max($0.max,$1),min:min($0.min,$1),$0.sum + $1)})
print(arr1)

