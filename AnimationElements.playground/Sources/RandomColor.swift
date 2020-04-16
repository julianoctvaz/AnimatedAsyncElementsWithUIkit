
import UIKit
import PlaygroundSupport


extension UIColor {
   public static func random() -> UIColor {
     return UIColor(red: .random(in: 0...1),
                             green: .random(in: 0...1),
                             blue: .random(in: 0...1),
                             alpha: 1.0)
    }
}
