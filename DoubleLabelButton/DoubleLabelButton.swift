//
//  DoubleLabelButton.swift
//  LabelButton
//
//  Created by 양원석 on 06/12/2018.
//  Copyright © 2018 red. All rights reserved.
//

import UIKit

class DoubleLabelButton: UIButton {
    
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTitle("", for: .normal)
        setTitle("", for: .highlighted)
        setTitle("", for: .selected)
        
        addSubview(topLabel)
        addSubview(bottomLabel)
        
        addConstraints(withVisualFormat: "V:|-5-[v0][v1]-5-|", views: topLabel, bottomLabel)
        addConstraints(withVisualFormat: "H:|-10-[v0]-10-|", views: topLabel)
        addConstraints(withVisualFormat: "H:|-10-[v0]-10-|", views: bottomLabel)
        
        layoutIfNeeded()
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                topLabel.textColor = .yellow
                bottomLabel.textColor = .yellow
            } else {
                topLabel.textColor = .black
                bottomLabel.textColor = .gray
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
