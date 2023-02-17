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
    
    //MARK: Public API
    
    //MARK: Inits
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Accounts".uppercased()
    }
    required init?(coder: NSCoder) { nil }
    
    //MARK: Overrides
    override func viewDidLoad() {
        view = customView
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
    private lazy var customView: AccountListView = {
        AccountListView(delegate: self)
    }()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! AccountCell
                
        cell.backgroundColor = .white
        cell.setupBankTitle(title: bankingInfo[indexPath.row].account_name)
        cell.setupActivity(activity: bankingInfo[indexPath.row].desc)
//        cell.setupAccount(account: bankingInfo[indexPath.row].account_type)
                           
        return cell
    }
}
