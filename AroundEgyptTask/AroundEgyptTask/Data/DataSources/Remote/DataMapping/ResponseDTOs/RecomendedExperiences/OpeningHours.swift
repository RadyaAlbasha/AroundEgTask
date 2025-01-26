//
//  OpeningHours.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 24/01/2025.
//

struct OpeningHours: Codable {
    let sunday, monday, tuesday, wednesday: [String]? // "09:00-16:00"
    let thursday, friday, saturday: [String]?
}
