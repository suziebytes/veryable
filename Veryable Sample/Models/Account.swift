//
//  Account.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import UIKit
import Alamofire
import Moya

struct Account: Codable {
    let id: Int
    let account_name: String
    let account_type: String
    let desc: String
}

struct allAccounts: Codable {
    let all: [Account]
}

public class FetchData {
    var bankingInfo = [Account]()
    
    func fetchBankingInfo(completion: @escaping () -> Void) {
        let provider = MoyaProvider<accountName>()
        
        provider.request(.get) { result in
            switch result {
            case .success(let response):
                do {
                    let result = try JSONDecoder().decode([Account].self, from: response.data)
                    print(result)
                    //getting specific account details
                    print("this is the result laflflahhadlashsfhafa \(result[0].account_name)")
                    
                    self.bankingInfo = result // set the fetched data to the published variable
                    
                    completion() // call the completion handler after data is fetched
                    
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

enum accountName {
    case get
    case send
}

extension accountName: TargetType {
    var baseURL: URL {
        URL(string: "https://veryable-public-assets.s3.us-east-2.amazonaws.com")!
    }
    
    var path: String {
        "/veryable.json"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return [:]
    }
}




