//
//  UIColorExtension.swift
//  GradientsAnimations
//

import UIKit

extension UIColor {

    /// Using Core Graphics to create gradient UIColor.
    ///
    /// - Parameters:
    ///   - frame: View's frame to create gradient for.
    ///   - colors: Collection of CGColors for gradient.
    ///   - angle: Value for gradient angle - rotating counter-clockwise. Defaults to 0 - horizontal.
    ///   - locations: Collection of starting point for all colors in range 0-1. Defaults to nil allowing default colors distibution.
    static func colorWithGradient(frame: CGRect, colors: [UIColor], angle: CGFloat = 0, locations: [NSNumber]? = nil) -> UIColor {

        let backgroundGradientLayer = CAGradientLayer()
        backgroundGradientLayer.frame = frame
        backgroundGradientLayer.colors = colors.map({ $0.cgColor })
        backgroundGradientLayer.calculatePoints(for: angle)
        backgroundGradientLayer.locations = locations

        UIGraphicsBeginImageContext(backgroundGradientLayer.bounds.size)
        if let currentContext = UIGraphicsGetCurrentContext() {
            backgroundGradientLayer.render(in: currentContext)
        }
        let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()

        return UIColor(patternImage: backgroundColorImage)
    }
}
