//
//  EpisodesModel.swift
//  PaymentSenseBreakAPI
//
//  Created by HariRamya on 22/07/2021.
//

import Foundation

// MARK: - EpisodesModel
struct EpisodesModel: Codable {
    let episodeID: Int?
    let title, season, airDate: String?
    let characters: [String]?
    let episode, series: String?
    
    enum CodingKeys: String, CodingKey {
        case episodeID = "episode_id"
        case title, season
        case airDate = "air_date"
        case characters, episode, series
    }
}
