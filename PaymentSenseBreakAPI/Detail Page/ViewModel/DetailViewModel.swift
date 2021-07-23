//
//  DetailVM.swift
//  PaymentSenseBreakAPI
//
//  Created by HariRamya on 23/07/2021.
//

import Foundation
import UIKit

//MARK: Page 2 view model
class DetailViewModel : NSObject{
    //MARK: Parse the data coming from page 1 and convert to a string of array
    func parseData(data:Any?) -> ([String]){
        if let character = data as? CharacterModel {
            var arr = [""]
            var str = String(format:"Character ID: %d",character.charID ?? 0)
            arr.append(str)
            str = "Name : " + (character.name ?? "")
            arr.append(str)
            str = "Occupation : " + (character.occupation?.joined(separator: ",") ?? "")
            arr.append(str)
            str = "Birthday : " + (character.birthday ?? "")
            arr.append(str)
            str = "Status : " + ((character.status) ?? "")
            arr.append(str)
            str = "NickName : " + ((character.nickname) ?? "")
            arr.append(str)
            let appearence = character.appearance?.map({String($0)}).joined(separator: ",")
            str = "Appearence : " + (appearence ?? "")
            arr.append(str)
            str = "Portrayed : " + ((character.portrayed) ?? "")
            arr.append(str)
            
            return arr
        }
        if let quotes = data as? QuotesModel{
            var arr = [""]
            var str = String(format:"Quote ID: %d",quotes.quoteID ?? 0)
            arr.append(str)
            arr.append(quotes.quote ?? "")
            str = "Author : " + (quotes.author ?? "")
            arr.append(str)
            str = "Series : " + (quotes.series ?? "")
            arr.append(str)
            return arr
        }
        if let episode = data as? EpisodesModel{
            var arr = [""]
            var str = String(format:"Episode ID: %d",episode.episodeID ?? 0)
            arr.append(str)
            arr.append(episode.title ?? "")
            str = "Seasons : " + (episode.season ?? "")
            arr.append(str)
            str = "Release Date : " + (episode.airDate ?? "")
            arr.append(str)
            str = "Characters : " + (episode.characters?.joined(separator: ",") ?? "")
            arr.append(str)
            str = "Episodes : " + (episode.episode ?? "")
            arr.append(str)
            str = "Series : " + (episode.series ?? "")
            arr.append(str)
            return arr
        }
        return [""]
    }
    
    //MARK: Page 2 uses this to show or hide image
    func fetchImage(data:Any?, completion: @escaping(UIImage?)->()){
        if let character = data as? CharacterModel, let url = URL(string: character.img ?? "") {
            downloadImage(from: url, completion: { img in
                completion(img)
            })
        }
        else
        {
            completion(nil)
        }
    }
    
    
}
