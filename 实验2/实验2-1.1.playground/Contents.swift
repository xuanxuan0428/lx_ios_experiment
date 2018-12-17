import UIKit

let dictionary = [["name":"liuxuan","age":"20"],["name":"lixin","age":"21"],["name":"liuminqi","age":"20"]]
let name = dictionary.map{ $0["name"]! }
print(name)

