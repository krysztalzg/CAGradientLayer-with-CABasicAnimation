//
//  Slider.swift
//  GradientsAnimations
//

import UIKit

class Slider: UISlider {

    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = bounds
        newBounds.size.height = 10
        return newBounds
    }

    func addGradientTrack() {
        superview?.layoutIfNeeded()

        clipsToBounds = false
        maximumTrackTintColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        setMinimumTrackImage(
            imageForColors(colors: [#colorLiteral(red: 0, green: 0.662745098, blue: 0.8078431373, alpha: 1), #colorLiteral(red: 0.4588235294, green: 0.231372549, blue: 0.7411764706, alpha: 1)]),
            for: .normal
        )
    }

    private func imageForColors(colors: [CGColor]) -> UIImage? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = 5
        gradientLayer.frame = CGRect(
            x: bounds.minX,
            y: bounds.minY,
            width: bounds.width,
            height: 10
        )
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y:  1)
        gradientLayer.endPoint = CGPoint(x: 1, y:  1)

        UIGraphicsBeginImageContextWithOptions(gradientLayer.frame.size, false, 0.0)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let layerImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return layerImage?.resizableImage(withCapInsets: .zero)
    }

}
