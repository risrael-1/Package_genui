import UIKit

@IBDesignable public class RoundButtonGradient: UIButton {
    
    let gradientLayer = CAGradientLayer()
    var backgroundImageView = UIImageView()
    
    enum Position: Int {
        case topLeading
        case topTrailing
        case bottomLeading
        case bottomTrailing
        case center
        case topCenter
        case bottomCenter
        case centerTrailing
        case centerLeading
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable public var imagePosition: Int {
        get {
            return self.position.rawValue
        }
        set(value) {
            self.position = Position(rawValue: value)!
        }
    }
    
    @IBInspectable public
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable public
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable public
    var imageBackground: UIImage? {
        didSet {
            
        }
    }
    
    var position = RoundButtonGradient.Position.center {
        didSet {
            self.setUp()
        }
    }
    
    private func setUp() {
        self.subviews.forEach({ subview in
            subview.removeFromSuperview()
        })
        guard let imageBackground = self.imageBackground else {
            return
        }
        switch self.position {
            
        case .topLeading:
            self.backgroundImageView = UIImageView(frame: CGRect(
                x: 0,
                y: 0,
                width: imageBackground.size.width,
                height: imageBackground.size.height))
        case .topTrailing:
            self.backgroundImageView = UIImageView(frame: CGRect(
                x: self.frame.width - imageBackground.size.width ,
                y: 0,
                width: imageBackground.size.width,
                height: imageBackground.size.height))
        case .bottomLeading:
            self.backgroundImageView = UIImageView(frame: CGRect(
                x: 0 ,
                y: self.frame.height - imageBackground.size.height,
                width: imageBackground.size.width,
                height: imageBackground.size.height))
        case .bottomTrailing:
            self.backgroundImageView = UIImageView(frame: CGRect(
                x: self.frame.width - imageBackground.size.width ,
                y: self.frame.height - imageBackground.size.height,
                width: imageBackground.size.width,
                height: imageBackground.size.height))
        case .center:
            self.backgroundImageView = UIImageView(frame: CGRect(
                x: (self.frame.width / 2) - (imageBackground.size.width / 2) ,
                y: (self.frame.height / 2) - (imageBackground.size.height / 2),
                width: imageBackground.size.width,
                height: imageBackground.size.height))
        case .topCenter:
            self.backgroundImageView = UIImageView(frame: CGRect(
                x: (self.frame.width / 2) - (imageBackground.size.width / 2),
                y: 0,
                width: imageBackground.size.width,
                height: imageBackground.size.height))
        case .bottomCenter:
            self.backgroundImageView = UIImageView(frame: CGRect(
                x: (self.frame.width / 2) - (imageBackground.size.width / 2),
                y: self.frame.height - imageBackground.size.height,
                width: imageBackground.size.width,
                height: imageBackground.size.height))
        case .centerTrailing:
            self.backgroundImageView = UIImageView(frame: CGRect(
                x: self.frame.width - imageBackground.size.width ,
                y: (self.frame.height / 2) - (imageBackground.size.height / 2),
                width: imageBackground.size.width,
                height: imageBackground.size.height))
        case .centerLeading:
            self.backgroundImageView = UIImageView(frame: CGRect(
                x: 0 ,
                y: (self.frame.height / 2) - (imageBackground.size.height / 2),
                width: imageBackground.size.width,
                height: imageBackground.size.height))
        }
        
        self.backgroundImageView.image = imageBackground
        self.addSubview(backgroundImageView)
    }
    
    private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.locations = [0.3, 1.4]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint   = CGPoint(x: 1, y: 1)
            gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
        }
    }
    
    override public func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradientLayer.frame = bounds
    }
}
