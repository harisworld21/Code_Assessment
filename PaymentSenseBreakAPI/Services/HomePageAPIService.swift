//
//  ServicesAPI.swift
//  SyncMoneyApp
//
//  Created by HariRamya on 15/07/2021.
//

import Foundation
import Alamofire
import CoreLocation
import UIKit

class HomePageAPIService{
    
    func searchItemAPI(item:String , completion: @escaping(_ result: Data? )->()){
        let itemUrl = BASE_URL + item
        AF.request(itemUrl, method: .get, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            if response.response?.statusCode == 200
            {
                print("Success")
                completion(response.data)
            }
            else{
                print("Failed fetching URL")
                completion(nil)
            }
        })
    }
    
}
