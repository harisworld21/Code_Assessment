//
//  CharacterModel.swift
//  PaymentSenseBreakAPI
//
//  Created by HariRamya on 22/07/2021.
//

import Foundation

// MARK: - CharacterModel
struct CharacterModel: Codable {
    let charID: Int?
    let name, birthday: String?
    let occupation: [String]?
    let img: String?
    let status, nickname: String?
    let appearance: [Int]?
    let portrayed, category: String?
    let betterCallSaulAppearance: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case charID = "char_id"
        case name, birthday, occupation, img, status, nickname, appearance, portrayed, category
        case betterCallSaulAppearance = "better_call_saul_appearance"
    }
}
