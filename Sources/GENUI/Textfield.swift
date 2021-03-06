import UIKit

@IBDesignable class Textfield: UIView {
    
    private let textfield = UITextField()
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setUp()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.setUp()
        }
    

    @IBInspectable var text: String = "" {
            didSet {
                self.refreshUI()
            }
        }
    
    @IBInspectable var minimumFontSize : CGFloat = 12.0 {
            didSet {
                self.refreshUI()
            }
        }

        @IBInspectable var placeholder: String = "" {
            didSet {
                self.refreshUI()
            }
        }

        @IBInspectable var textfieldColor: UIColor = .white {
            didSet {
                self.refreshUI()
            }
        }
    

        @IBInspectable var textColor: UIColor = .black {
            didSet {
                self.refreshUI()
            }
        }
    
    
    private func setUp() {

            self.subviews.forEach({ subview in
               subview.removeFromSuperview()
            })

            self.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.size.width, height: self.frame.size.height)
            self.backgroundColor = .clear
            let backgroundTextfield = UIView.init(frame: self.frame)
            backgroundTextfield.backgroundColor = self.textfieldColor
            backgroundTextfield.clipsToBounds = true
            backgroundTextfield.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.size.width, height: self.frame.size.height)

            self.addSubview(backgroundTextfield)

            textfield.text = text
            textfield.minimumFontSize = minimumFontSize
            textfield.placeholder = placeholder
            textfield.textColor = textColor
        
            textfield.frame = self.frame
            self.addSubview(textfield)

            self.superview?.addSubview(self)
        }
    
    private func refreshUI() {
            self.setUp()
        }

}
