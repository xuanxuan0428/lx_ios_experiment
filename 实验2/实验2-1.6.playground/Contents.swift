import UIKit

import func Darwin.sqrt
extension Int {
    func sqrt() -> Double {
        return Darwin.sqrt(Double(self))
    }
}
print(4.sqrt())

