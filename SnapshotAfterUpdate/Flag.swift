import UIKit

@IBDesignable
class Flag: UIView {
    
    
    @IBInspectable var text: String? {
        didSet {
            label?.text = text
        }
    }

    @IBInspectable var style: String? {
        didSet {
            updateStyle()
        }
    }

    @IBOutlet var contentView: UIView!
    @IBOutlet var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        Bundle(for: type(of: self)).loadNibNamed("Flag", owner: self, options: nil)
        contentView.fixInView(self)
        label.text = text
        label.backgroundColor = .clear
        updateStyle()
    }
    
    private func updateStyle() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.contentView.backgroundColor = .red
            self.label.textColor = .yellow
            self.setNeedsDisplay()
            self.setNeedsLayout()
        }
    }
}

extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
