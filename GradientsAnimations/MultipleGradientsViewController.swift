//
//  MultipleGradientsViewController.swift
//  GradientsAnimations
//

import UIKit

class MultipleGradientsViewController: UIViewController {

    private let magenta = #colorLiteral(red: 0.7803921569, green: 0.1411764706, blue: 0.6941176471, alpha: 1)
    private let aqua = #colorLiteral(red: 0, green: 0.662745098, blue: 0.8078431373, alpha: 1)
    private let violet = #colorLiteral(red: 0.4588235294, green: 0.231372549, blue: 0.7411764706, alpha: 1)
    private let navy = #colorLiteral(red: 0, green: 0.1254901961, blue: 0.3568627451, alpha: 1)
    private let orange = #colorLiteral(red: 1, green: 0.5098039216, blue: 0, alpha: 1)

    private lazy var animatedGradientView = {
        return AnimatedMultipleGradientsView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: view.bounds.width,
                height: view.bounds.height
            ),
            colorsSets: [
                [aqua.cgColor, navy.cgColor],
                [navy.cgColor, violet.cgColor],
                [violet.cgColor, magenta.cgColor],
                [magenta.cgColor, orange.cgColor],
            ],
            angle: 45,
            duration: 2
        )
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        view.insertSubview(animatedGradientView, at: 0)
    }

}
