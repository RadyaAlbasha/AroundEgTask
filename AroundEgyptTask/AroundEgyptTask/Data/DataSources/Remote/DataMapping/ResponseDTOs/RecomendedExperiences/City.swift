//
//  City.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 24/01/2025.
//

struct City: Codable {
    let id: Int
    let name: String
//    let disable: JSONNull?
    let topPick: Int

    enum CodingKeys: String, CodingKey {
        case id, name
//        case disable
        case topPick = "top_pick"
    }
}
