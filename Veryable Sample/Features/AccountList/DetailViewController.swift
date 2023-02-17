//
//  DetailView.swift
//  Veryable Sample
//
//  Created by Suzie on 2/15/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    let doneButton = ButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        setupDoneButton()
    }
    
    func setupDoneButton() {
        view.addSubview(doneButton)
        
        doneButton.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
        }
    }
}
