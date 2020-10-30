//
//  AvatarView.swift
//  VKClient
//
//  Created by Alexander Belyaev on 22.10.2020.
//



import UIKit

@IBDesignable class AvatarView: UIView {
    
    @IBInspectable var shadowMargin: CGFloat = 3
    
    @IBInspectable var shadowOpacity: CGFloat = 20
    
    var shadowColor:UIColor = UIColor.black
    
    var imageView: UIImageView!
    
    var avatarImage: UIImage = UIImage(){
        didSet{
            imageView.image = avatarImage
        }
    }
    let shadowView: UIView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupComponent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupComponent()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupComponent()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateComponent()
    }
    
    func updateComponent(){
        let aRect = CGRect(x: 0+shadowMargin, y: 0+shadowMargin, width: (self.bounds.width-2*shadowMargin), height: (self.bounds.height-2*shadowMargin))
        imageView.frame = aRect
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true
        
        shadowView.frame = aRect
        shadowView.layer.cornerRadius = shadowView.frame.size.height / 2
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOpacity = Float(shadowOpacity)/10
        shadowView.layer.shadowRadius = shadowMargin
    }
    
    func  setupComponent() {
        if imageView == nil {
            imageView = UIImageView(image: avatarImage)
            imageView.contentMode = .scaleAspectFill
            updateComponent()
            
            shadowView.backgroundColor = .black
            shadowView.clipsToBounds = true
            shadowView.layer.masksToBounds = false
            shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
            
            self.addSubview(shadowView)
            self.addSubview(imageView)
        }
    }
}



