//
//  AnimatedGradientView.swift
//  GradientsAnimations
//

import UIKit

internal final class AnimatedSingleGradientView: UIView {

    private let colorsSets: [[CGColor]]
    private let duration: Double

    init(
        frame: CGRect,
        colorsSets: [[CGColor]],
        angle: CGFloat = 45,
        duration: Double
    ) {
        self.colorsSets = colorsSets
        self.duration = duration
        super.init(frame: frame)

        addGradientBackground(colors: colorsSets[0], angle: angle)
        animateGradient()
    }

    @available(*, unavailable, message: "Not available, use init(frame: colorsSets: angle: duration:)")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func animateGradient() {
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = duration
        gradientChangeAnimation.toValue = colorsSets[1]
        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradientChangeAnimation.repeatCount = .infinity
        gradientChangeAnimation.autoreverses = true

        if let gradientLayer = layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.add(gradientChangeAnimation, forKey: "colorChange")
        }
    }
}

