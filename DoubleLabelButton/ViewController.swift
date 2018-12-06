//
//  ViewController.swift
//  DoubleLabelButton
//
//  Created by 양원석 on 06/12/2018.
//  Copyright © 2018 red. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstButton: DoubleLabelButton!
    @IBOutlet weak var secondButton: DoubleLabelButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFirstButton()
        setupSecondButton()
    }
    
    func setupFirstButton() {
        firstButton.topText = "Follower"
        firstButton.bottomText = "14k"
        firstButton.layer.borderColor = UIColor.red.cgColor
        firstButton.layer.borderWidth = 1.0
        firstButton.layer.cornerRadius = 7.0
    }
    
    func setupSecondButton() {
        secondButton.topText = "LAMAMA'S FRIENDS"
        secondButton.bottomText = "1,633,833,740"
        secondButton.layer.borderColor = UIColor.red.cgColor
        secondButton.layer.borderWidth = 1.0
        secondButton.layer.cornerRadius = 7.0
    }


}

