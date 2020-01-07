//
//  UIViewExtensions.swift
//  GradientsAnimations
//

import UIKit

extension UIView {

    /// Adds CAGradientLayer to view's background.
    ///
    /// - Parameters:
    ///   - colors: Collection of CGColors for gradient.
    ///   - angle: Value for gradient angle. Defaults to 0 - horizontal.
    func addGradientBackground(colors: [CGColor], angle: CGFloat = 0, locations: [NSNumber]? = nil) {
        let gradientLayer = CAGradientLayer(layer: layer)
        gradientLayer.colors = colors
        gradientLayer.frame = bounds
        gradientLayer.calculatePoints(for: angle)
        gradientLayer.drawsAsynchronously = true

        let defaultLocations: [NSNumber] = [0] + Array(repeating: 1, count: colors.count - 1)
        gradientLayer.locations = locations ?? defaultLocations
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
