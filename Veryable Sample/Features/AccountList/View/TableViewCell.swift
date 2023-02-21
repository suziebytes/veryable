//
//  TableViewCell.swift
//  Veryable Sample
//
//  Created by Suzie on 2/16/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import UIKit

class AccountCell: UITableViewCell {
    let titleLabel = UILabel()
    let accountLabel = UILabel()
    let activityLabel = UILabel()
    let icon = UIImageView()
    let expandButton = UIButton()
    let buttonContainer = UIView()
    let iconContainer = UIView()
    let title: String = ""
    let account: String = ""
    let activity: String = ""
    let darkColor = VGrey.dark.color
    let lightColor = VGrey.light.color
    let darkBlue = VBlue.dark.color
    let stackView = UIStackView()
    let bankDetailSV = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupBankTitle(title: "")
        setupAccount(account: "")
        setupActivity(activity: "")
        setupIconContainer()
        setupButtonContainer()
        setupIcon(iconName: "")
        setupExpandButton()
        setupSV()
        configureSV()
        configureBankDetailSV()
        setupBankDetailSV()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Horizontal SV
    func configureSV() {
        addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func setupSV() {
        stackView.addArrangedSubview(iconContainer)
        stackView.addArrangedSubview(bankDetailSV)
        stackView.addArrangedSubview(buttonContainer)
    }
    
    //MARK:  Bank Details SV
    func configureBankDetailSV() {
        bankDetailSV.axis = .vertical
        bankDetailSV.distribution = .fillProportionally
        bankDetailSV.spacing = 0
        bankDetailSV.translatesAutoresizingMaskIntoConstraints = false
        bankDetailSV.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        bankDetailSV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
    
    func setupBankDetailSV() {
        bankDetailSV.addArrangedSubview(titleLabel)
        bankDetailSV.addArrangedSubview(activityLabel)
        bankDetailSV.addArrangedSubview(accountLabel)
    }
    
    //MARK: Containers
    func setupButtonContainer() {
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonContainer.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupIconContainer() {
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        iconContainer.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //MARK: Setups
    func setupIcon(iconName: String) {
        iconContainer.addSubview(icon)
        icon.image = UIImage(named: iconName)?.withRenderingMode(.alwaysTemplate)
        icon.tintColor = darkBlue
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        icon.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor).isActive = true
//        icon.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor).isActive = true
        icon.topAnchor.constraint(equalTo: iconContainer.topAnchor, constant: 10).isActive = true
    }
    
    func setupExpandButton() {
        buttonContainer.addSubview(expandButton)
        let image = UIImage(named: "arrow")?.withRenderingMode(.alwaysTemplate)
        expandButton.tintColor = .darkGray
        expandButton.setImage(image, for: .normal)
        expandButton.translatesAutoresizingMaskIntoConstraints = false
        expandButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        expandButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        expandButton.centerXAnchor.constraint(equalTo: buttonContainer.centerXAnchor).isActive = true
        expandButton.centerYAnchor.constraint(equalTo: buttonContainer.centerYAnchor).isActive = true
    }
    // MARK: Bank Details
    func setupBankTitle(title: String) {
        titleLabel.font = .vryAvenirNextDemiBold(14)
        titleLabel.textColor = darkColor
        titleLabel.text = title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupActivity(activity: String) {
        activityLabel.font = .vryAvenirNextRegular(12)
        activityLabel.textColor = darkColor
        activityLabel.text = activity
        activityLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupAccount(account: String) {
        accountLabel.font = .vryAvenirNextRegular(12)
        accountLabel.textColor = lightColor
        accountLabel.text = account
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
