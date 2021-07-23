//
//  HomePageViewModel.swift
//  PaymentSenseBreakAPI
//
//  Created by HariRamya on 20/07/2021.
//

import Foundation

class HomePageViewModel{
    let serviceAPI = HomePageAPIService()
    var tableItem = [Any]()
    //MARK: Page 1 ViewModel Call from Page1 ViewController
    func makeAPICalls(completion: @escaping([Any])->()){
        for item in DISPLAY_ITEMS
        {
            searchItemAPICall(item: item, hasCompleted: { res in
                if res && self.tableItem.count == DISPLAY_ITEMS.count
                {
                    completion(self.tableItem)
                }
            })
        }
    }
    
    //MARK: Page 1 ViewModel actual place where call for episode, character & quotes
    func searchItemAPICall(item:String, hasCompleted: @escaping(Bool)->()){
        serviceAPI.searchItemAPI(item: item, completion: { data in
            switch(item){
            case DISPLAY_ITEMS[0]:
                let character = parse(type: [CharacterModel].self, data: data ?? Data())
                self.tableItem.append(character)
                hasCompleted(true)
                break
            case DISPLAY_ITEMS[1]:
                let episode = parse(type: [EpisodesModel].self, data: data ?? Data())
                self.tableItem.append(episode)
                hasCompleted(true)
                break
            case DISPLAY_ITEMS[2]:
                let quotes = parse(type: [QuotesModel].self, data: data ?? Data())
                self.tableItem.append(quotes)
                hasCompleted(true)
                break
            default:
                print("Do nothing")
            }
        })
    }
    
    


}
