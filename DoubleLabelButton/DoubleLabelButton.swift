//
//  DoubleLabelButton.swift
//  LabelButton
//
//  Created by 양원석 on 06/12/2018.
//  Copyright © 2018 red. All rights reserved.
//

import UIKit

class DoubleLabelButton: UIButton {
    
    private let photoView: UIImageView = {
        let photoView = UIImageView()
        photoView.contentMode = .scaleAspectFill
        
        return photoView
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        
        return label
    }()
    
    var topText: String = "-" {
        didSet {
            topLabel.text = topText
            layoutIfNeeded()
        }
    }
    
    var bottomText: String = "" {
        didSet {
            bottomLabel.text = bottomText
            layoutIfNeeded()
        }
    }
    
    var photo: UIImage? = nil {
        didSet {
            photoView.image = photo
            layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTitle("", for: .normal)
        setTitle("", for: .highlighted)
        setTitle("", for: .selected)
        
        addSubview(topLabel)
        addSubview(bottomLabel)
        addSubview(photoView)
        
        addConstraints(withVisualFormat: "V:|-10-[v0][v1]-10-|", views: topLabel, bottomLabel)
        addConstraints(withVisualFormat: "V:|-10-[v0]-10-|", views: photoView)
        addConstraints(withVisualFormat: "H:|-10-[v0(<=40)]-5-[v1]-10-|", views: photoView, topLabel)
        addConstraints(withVisualFormat: "H:[v0]-5-[v1]-10-|", views: photoView, bottomLabel)
        
        addConstraint(
            NSLayoutConstraint(item: photoView, attribute: .width, relatedBy: .equal, toItem: photoView, attribute: .height, multiplier: 1.0, constant: 1.0)
            )
        
        layoutIfNeeded()
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                topLabel.textColor = .yellow
                bottomLabel.textColor = .yellow
                photoView.alpha = 0.8
            } else {
                topLabel.textColor = .black
                bottomLabel.textColor = .gray
                photoView.alpha = 1.0
            }
            
        }
    }
    
}
extension UIView {
    
    func addConstraints(withVisualFormat format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        views.enumerated().forEach({ index, view in
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary["v\(index)"] = view
        })
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
