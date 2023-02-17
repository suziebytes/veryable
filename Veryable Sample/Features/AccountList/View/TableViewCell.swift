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
    let title: String = ""
    let account: String = ""
    let activity: String = ""
    let darkColor = VGrey.dark.color
    let lightColor = VGrey.light.color
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupBankTitle(title: "")
        setupAccount(account: "")
        setupActivity(activity: "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBankTitle(title: String) {
      addSubview(titleLabel)
        titleLabel.font = .vryAvenirNextDemiBold(14)
        titleLabel.textColor = darkColor
        titleLabel.text = title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    func setupAccount(account: String) {
        addSubview(accountLabel)
        accountLabel.font = .vryAvenirNextRegular(12)
        accountLabel.textColor = darkColor
        accountLabel.text = account
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        accountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
    }
    
    func setupActivity(activity: String) {
        addSubview(activityLabel)
        activityLabel.font = .vryAvenirNextRegular(12)
        activityLabel.textColor = lightColor
        activityLabel.text = activity
        activityLabel.translatesAutoresizingMaskIntoConstraints = false
        activityLabel.topAnchor.constraint(equalTo: accountLabel.bottomAnchor).isActive = true
    }
}
