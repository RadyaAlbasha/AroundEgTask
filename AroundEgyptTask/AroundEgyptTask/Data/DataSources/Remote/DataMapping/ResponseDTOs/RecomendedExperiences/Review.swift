//
//  Review.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 24/01/2025.
//

struct Review: Codable {
    let id, experience, name: String
    let rating: Int
    let comment, createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, experience, name, rating, comment
        case createdAt = "created_at"
    }
}
