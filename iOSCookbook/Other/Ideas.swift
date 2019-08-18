import UIKit


// MARK: - Syntax for organizing Colors better
// Usage: UIFont.buttons.primary
extension UIFont {
    static let buttons = Buttons()
}

struct Buttons {
    var primary = UIColor.red
}

