//
//  Era.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 24/01/2025.
//

struct Era: Codable {
    let id, value, createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, value
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
