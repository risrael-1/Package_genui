import UIKit

@IBDesignable public class Label: UIView {
    
    private let label = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    
    @IBInspectable public var text: String = "" {
        didSet {
            self.refreshUI()
        }
    }
    
    
    @IBInspectable public var numberOfLines: Int = 1 {
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable public var labelColor: UIColor = .white {
        didSet {
            self.refreshUI()
        }
    }
    
    
    @IBInspectable public var textColor: UIColor = .black {
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
        backgroundTextfield.backgroundColor = self.labelColor
        backgroundTextfield.clipsToBounds = true
        backgroundTextfield.frame = CGRect(x: 0, y: 0, width:  self.frame.size.width, height: bounds.size.height)
        
        self.addSubview(backgroundTextfield)
        label.text = text
        label.numberOfLines = numberOfLines
        label.textColor = textColor
        
        label.frame = self.frame
        self.addSubview(label)
        
        self.superview?.addSubview(self)
    }
    
    private func refreshUI() {
        self.setUp()
    }
    
}
