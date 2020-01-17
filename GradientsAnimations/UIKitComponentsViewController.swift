//
//  UIKitComponentsViewController.swift
//  GradientsAnimations
//

import UIKit

class UIKitComponentsViewController: UIViewController {

    @IBOutlet private weak var uiView: UIView!
    @IBOutlet private weak var uiLabel: UILabel!
    @IBOutlet private weak var uiTextField: TextField!
    @IBOutlet private weak var uiSlider: Slider!

    private let aqua = #colorLiteral(red: 0, green: 0.662745098, blue: 0.8078431373, alpha: 1)
    private let violet = #colorLiteral(red: 0.4588235294, green: 0.231372549, blue: 0.7411764706, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        uiTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        uiView.backgroundColor = .colorWithGradient(frame: uiView.bounds, colors: [aqua, violet], angle: 10)
        uiLabel.textColor = .colorWithGradient(frame: uiView.bounds, colors: [aqua, violet], angle: 10)

        uiSlider.addGradientTrack()
    }

}

extension UIKitComponentsViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

