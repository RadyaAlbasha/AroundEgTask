//
//  APIConstants.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 24/01/2025.
//

struct APIConstants {
    static let baseURL = "https://aroundegypt.34ml.com"
    
//    https://aroundegypt.34ml.com/api/v2/experiences?filter[recommended]=true
    //https://aroundegypt.34ml.com/api/v2/experiences/7f209d18-36a1-44d5-a0ed-b7eddfad48d6
    //https://aroundegypt.34ml.com/api/v2/experiences/7f209d18-36a1-44d5-a0ed-b7eddfad48d6/like
    struct Endpoints {
        static let fetchRecentExperiences = "/api/v2/experiences"
        static let fetchRecommendedExperiences = "/api/v2/experiences?filter[recommended]=true"
        static func fetchSearchExperiences(query: String) -> String {
            return "/api/v2/experiences?filter[title]=\(query)"
        }
        static func fetchSingleExperience(id: String) -> String {
            return "/api/v2/experiences/\(id)"
        }
        static func likeExperience(id: String) -> String {
            return "/api/v2/experiences/\(id)/like"
        }

    }
    static func fullURL(for endpoint: String) -> String {
        return "\(baseURL)\(endpoint)"
    }
}
