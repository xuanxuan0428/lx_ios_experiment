import UIKit

func backMaxAndMin<T: Comparable>(a: [T]) -> (T, T) {
    var max = a[0]
    var min = a[0]
    
    for i in a {
        if i > max {
            max = i
        }
        else if i < min {
            min = i
        }
    }
    
    return (max, min)
}

print(backMaxAndMin(a:[1, 2, 3, 4]))
print(backMaxAndMin(a:[1.1, 2.2, 3.3, 4.4]))

