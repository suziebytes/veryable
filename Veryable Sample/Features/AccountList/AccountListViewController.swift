//
//  AccountListViewController.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import Moya

class AccountListViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource  {
    var detailsCount = 0
    let tableView = UITableView()
    var fetchData = FetchData()
    var count: Int = 0
    var bankingInfo: [Account] = []
    let lightGray = VGrey.light.color
    let headerTitles = ["Bank Accounts", "Card"]
    var bankAccountData: Array = [""]
    var cardData: Array = [""]
    
    //MARK: Public API
    
    //MARK: Inits
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Accounts".uppercased()
    }
    required init?(coder: NSCoder) { nil }
    
    //MARK: Overrides
    override func viewDidLoad() {
        setupTV()
        fetchData.fetchBankingInfo {
            // This closure will be called after the data has been fetched and bankingInfo has been updated
            // Reload tableview or update UI with fetched data
            self.count = self.fetchData.bankingInfo.count
            self.bankingInfo = self.fetchData.bankingInfo
            self.tableView.reloadData() // tableview will call all tableView funcs again
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //MARK: Private members
    
    //MARK: Lazy Loads
    //    private lazy var customView: AccountListView = {
    //        AccountListView(delegate: self)
    //    }()
}

extension AccountListViewController: AccountListDelegate {
    func setupTV() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AccountCell.self, forCellReuseIdentifier: "cellId")
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }
    
    func filterData() {
        //check data and filter out based on card or bank account
        bankAccountData = bankingInfo.filter({ account in
            account.account_type == "bank"
        })
        
        cardData = bankingInfo.filter({ account in
            account.account_type == "card"
        })
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let label = UILabel()
        
        headerView.backgroundColor = lightGray
        //        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.font = .vryAvenirNextDemiBold(16)
        
        if section == 0 {
            label.text = "Bank Accounts"
        }
        if section == 1 {
            label.text = "Card"
        }
        
        headerView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 15).isActive = true
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return bankAccountData.count
        }
        if section == 1 {
            return cardData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! AccountCell
        
        //
        //        cell.setupBankTitle(title: bankingInfo[indexPath.row].account_name)
        //        cell.setupActivity(activity: bankingInfo[indexPath.row].desc)
        //        cell.setupAccount(account: bankingInfo[indexPath.row].account_type)
        
        
        
        switch (indexPath.section)  {
        case 0: //Bank Account
            cell.setupBankTitle(title: bankingInfo[indexPath.row].account_name)
            cell.setupActivity(activity: bankingInfo[indexPath.row].desc)
            
        case 1: //Card
            cell.setupBankTitle(title: bankingInfo[indexPath.row].account_name)
            cell.setupActivity(activity: bankingInfo[indexPath.row].desc)
            
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
