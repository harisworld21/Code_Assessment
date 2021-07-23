//
//  QuotesModel.swift
//  PaymentSenseBreakAPI
//
//  Created by HariRamya on 22/07/2021.
//

import Foundation

// MARK: - QuotesModel
struct QuotesModel: Codable {
    let quoteID: Int?
    let quote, author, series: String?
    
    enum CodingKeys: String, CodingKey {
        case quoteID = "quote_id"
        case quote, author, series
    }
}
