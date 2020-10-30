//
//  LikeControl.swift
//  VKClient
//
//  Created by Alexander Belyaev on 28.10.2020.
//

import UIKit

@IBDesignable
class LikeControl: UIControl {
    
    @IBInspectable
    var isLiked: Bool = false {
        didSet {
            updateLike()
        }
    }
    
    @IBInspectable
    var likesCount: Int = 0 {
        didSet {
            countLabel.text = "\(likesCount) "
        }
    }
    
    @IBInspectable
    var color: UIColor = .red {
        didSet {
            likeButton.tintColor = color
            countLabel.textColor = color
        }
    }
    
    //MARK: - Subviews
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = color
        button.addTarget(self,
                         action: #selector(likeButtonTapped),
                         for: .touchUpInside)
        return button
    } ()
    
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = color
        label.text = "0 "
        return label
    } ()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.alignment = .center
        return stackView
    } ()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        stackView.addArrangedSubview(likeButton)
        stackView.addArrangedSubview(countLabel)
    }
    
    //MARK: - Actions
    
    @objc private func likeButtonTapped(_ sender: UIButton) {
        isLiked.toggle()
        sendActions(for: .valueChanged)
    }
    
    private func updateLike() {
        let imageName = isLiked ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: imageName), for: .normal)
        likesCount = isLiked ? likesCount + 1 : likesCount - 1
    }
}
