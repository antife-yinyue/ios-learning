import UIKit

public extension UIColor {

    public convenience init?(var hex: String, alpha: Float = 1.0) {

        if (hex.rangeOfString("(^#?[0-9A-Fa-f]{6}$)|(^#?[0-9A-Fa-f]{3}$)", options: .RegularExpressionSearch) == nil) {
            self.init()
            return nil
        }

        var red: String
        var green: String
        var blue: String

        // Check for hash and remove the hash
        if hex.hasPrefix("#") {
            hex = hex.substringFromIndex(hex.startIndex.advancedBy(1))
        }

        // Deal with 3 character Hex strings
        if hex.characters.count == 3 {
            red = (hex as NSString).substringToIndex(1)
            green = (hex as NSString).substringWithRange(NSMakeRange(1, 1))
            blue = (hex as NSString).substringFromIndex(2)

            red += red
            green += green
            blue += blue
        } else {
            red = (hex as NSString).substringToIndex(2)
            green = (hex as NSString).substringWithRange(NSMakeRange(2, 2))
            blue = (hex as NSString).substringFromIndex(4)
        }

        var redInt: CUnsignedInt = 0
        var greenInt: CUnsignedInt = 0
        var blueInt: CUnsignedInt = 0

        NSScanner(string: red).scanHexInt(&redInt)
        NSScanner(string: green).scanHexInt(&greenInt)
        NSScanner(string: blue).scanHexInt(&blueInt)

        self.init(
            red: CGFloat(redInt) / 255.0,
            green: CGFloat(greenInt) / 255.0,
            blue: CGFloat(blueInt) / 255.0,
            alpha: CGFloat(alpha)
        )
    }

}
