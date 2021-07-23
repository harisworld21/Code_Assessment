//
//  Constants.swift
//  PaymentSenseBreakAPI
//
//  Created by HariRamya on 19/07/2021.
//

import UIKit

// MARK: API URL and KEYS
let DISPLAY_ITEMS = ["characters","episodes","quotes"]
let BASE_URL = "https://www.breakingbadapi.com/api/"
let CONST_TWITTERAPI_RULE__URL = "https://api.twitter.com/2/tweets/search/stream/rules"
let CONST_TWITTERAPI_FILTER_STREAM_URL = "https://api.twitter.com/2/tweets/search/stream?tweet.fields=geo%2Cauthor_id&expansions=geo.place_id%2Cauthor_id&place.fields=geo%2Cname&user.fields=location"


//MARK: Convert data to a MODEL
func parse<T:Codable>(type:T.Type, data: Data)->T?{
    guard let R = try? JSONDecoder().decode(T.self, from: data) else
    {
        return nil
    }
    return R
}


//MARK: Download image from URL
func downloadImage(from url: URL, completion: @escaping(UIImage?)->()) {
    getData(from: url) { data, response, error in
        guard let data = data, error == nil, let img = UIImage(data: data) else { return }
        completion(img)
    }
}

func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
}





