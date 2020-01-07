//
//  TextField.swift
//  GradientsAnimations
//

import UIKit

internal class TextField: UITextField {

    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        return view
    }()

    private lazy var gradientColor: UIColor = {
        return .colorWithGradient(
            frame: CGRect(x: 0, y: 0, width: bounds.width, height: 3),
            colors: [#colorLiteral(red: 0, green: 0.662745098, blue: 0.8078431373, alpha: 1), #colorLiteral(red: 0.4588235294, green: 0.231372549, blue: 0.7411764706, alpha: 1)],
            angle: 10,
            locations: [0, 0.6]
        )
    }()

    // MARK: - Computed properties

    /// The line below the text field color
    var lineColor : UIColor? {
        get {
            return lineView.backgroundColor
        }
        set {
            lineView.backgroundColor = newValue
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        textColor = gradientColor
        addSubview(lineView)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        lineView.frame = CGRect(x: 0, y: frame.height - 4, width: frame.width, height: 2)
    }

    override func becomeFirstResponder() -> Bool {
        lineView.backgroundColor = gradientColor
        return super.becomeFirstResponder()
    }

    override func resignFirstResponder() -> Bool {
        lineView.backgroundColor = (text ?? "").isEmpty ? #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1) : gradientColor
        return super.resignFirstResponder()
    }
}
