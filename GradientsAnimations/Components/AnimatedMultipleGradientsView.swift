//
//  AnimatedMultipleGradientsView.swift
//  GradientsAnimations
//

import UIKit

internal final class AnimatedMultipleGradientsView: UIView {

    private let colorsSets: [[CGColor]]
    private var currentGradient: Int = 0
    private let duration: Double
    private var isReverted = false

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

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        animateGradient()
    }

    private func animateGradient() {
        if !isReverted && currentGradient < colorsSets.count - 1 {
            currentGradient += 1
        } else if isReverted && currentGradient > 0 {
            currentGradient -= 1
        }
        if currentGradient == colorsSets.count - 1 || currentGradient == 0 {
            isReverted.toggle()
        }

        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = duration
        gradientChangeAnimation.toValue = colorsSets[currentGradient]
        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradientChangeAnimation.delegate = self

        if let gradientLayer = layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.add(gradientChangeAnimation, forKey: "colorChange")
        }
    }
}

extension AnimatedMultipleGradientsView: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard
            flag,
            let gradientLayer = layer.sublayers?.first as? CAGradientLayer
        else { return }

        gradientLayer.colors = colorsSets[currentGradient]
        animateGradient()
    }
}
