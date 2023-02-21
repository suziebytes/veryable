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
    let iconView = UIImageView()
    let accountLabel = UILabel()
    let detailsLabel = UILabel()
    var accountLabelText = ""
    var detailsLabelText = ""
    var iconName = ""
    let darkBlue =  VBlue.dark.color
    let darkColor = VGrey.dark.color
    let lightColor = VGrey.light.color
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "DETAILS".uppercased()
    }
    
    required init?(coder: NSCoder) { nil }
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = darkColor
        
        view.backgroundColor = ViewColor.background.color
        setupIcon()
        setupAccount()
        setupDetails()
        setupDoneButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func setupIcon() {
        view.addSubview(iconView)
        iconView.image = UIImage(named: iconName)?.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = darkBlue
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        iconView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        iconView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
    }
    
    func setupAccount() {
        view.addSubview(accountLabel)
        accountLabel.font = .vryAvenirNextDemiBold(16)
        accountLabel.textColor = darkColor
        accountLabel.text = accountLabelText
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        accountLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 20).isActive = true
        accountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupDetails() {
        view.addSubview(detailsLabel)
        detailsLabel.font = .vryAvenirNextRegular(14)
        detailsLabel.textColor = darkColor
        detailsLabel.text = detailsLabelText
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsLabel.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 5).isActive = true
        detailsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupDoneButton() {
        view.addSubview(doneButton)
        doneButton.addTarget(self, action: #selector(backToAccounts), for: .touchUpInside)
        
        doneButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(200)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
            make.bottom.equalTo(view).offset(-40)
        }
    }
    
    @objc func backToAccounts() {
        print("done was tapped")
        navigationController?.popViewController(animated: true)
    }
}
