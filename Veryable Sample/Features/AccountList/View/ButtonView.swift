//
//  ButtonView.swift
//  Veryable Sample
//
//  Created by Suzie on 2/15/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import UIKit

class ButtonView: UIButton {
    let blue = VBlue.dark.color

    override init(frame: CGRect) {
        super .init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        backgroundColor = blue
        setTitle("DONE", for: .normal)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4
        clipsToBounds = true
    }
}
