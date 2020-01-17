//
//  SingleGradientViewController.swift
//  GradientsAnimations
//

import UIKit

class SingleGradientViewController: UIViewController {

    private let magenta = #colorLiteral(red: 0.7803921569, green: 0.1411764706, blue: 0.6941176471, alpha: 1)
    private let aqua = #colorLiteral(red: 0, green: 0.662745098, blue: 0.8078431373, alpha: 1)
    private let violet = #colorLiteral(red: 0.4588235294, green: 0.231372549, blue: 0.7411764706, alpha: 1)

    private lazy var animatedGradientView = {
        return AnimatedSingleGradientView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: view.bounds.width,
                height: view.bounds.height
            ),
            colorsSets: [
                [aqua.cgColor, violet.cgColor],
                [violet.cgColor, magenta.cgColor]
            ],
            angle: 15,
            duration: 3
        )
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        view.insertSubview(animatedGradientView, at: 0)
    }

}

