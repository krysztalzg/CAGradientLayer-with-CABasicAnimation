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
    ///   - locations: Collection of starting point for all colors in range 0-1. Defaults to [0, 1, 1...].
    static func colorWithGradient(frame: CGRect, colors: [UIColor], angle: CGFloat = 0, locations: [NSNumber]? = nil) -> UIColor {

        // create the background layer that will hold the gradient
        let backgroundGradientLayer = CAGradientLayer()
        backgroundGradientLayer.frame = frame

        // we create an array of CG colors from out UIColor array
        let cgColors = colors.map({ $0.cgColor })

        backgroundGradientLayer.colors = cgColors

        backgroundGradientLayer.calculatePoints(for: -angle)
        backgroundGradientLayer.locations = locations ?? [0] + Array<NSNumber>(repeating: 1, count: colors.count - 1)

        UIGraphicsBeginImageContext(backgroundGradientLayer.bounds.size)
        if let currentContext = UIGraphicsGetCurrentContext() {
            backgroundGradientLayer.render(in: currentContext)
        }
        let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()

        return UIColor(patternImage: backgroundColorImage)
    }
}
