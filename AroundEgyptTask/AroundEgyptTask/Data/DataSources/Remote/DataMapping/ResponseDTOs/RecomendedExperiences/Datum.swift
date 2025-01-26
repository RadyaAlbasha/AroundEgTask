//
//  Datum.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 24/01/2025.
//

struct Datum: Codable {
    let id, title: String
    let coverPhoto: String
    let description: String
    let viewsNo, likesNo, recommended, hasVideo: Int
    let tags: [City]
    let city: City
    let tourHTML: String
    let famousFigure: String
    let period, era: Era?
    let founded, detailedDescription, address: String
    let gmapLocation: GmapLocation
    let openingHours: OpeningHours
    let translatedOpeningHours: TranslatedOpeningHours
    let startingPrice: Int?
    let ticketPrices: [TicketPrice]
//    let experienceTips: [JSONAny]
//    let isLiked: JSONNull?
    let reviews: [Review]
    let rating, reviewsNo: Int
    let audioURL: String
    let hasAudio: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case coverPhoto = "cover_photo"
        case description
        case viewsNo = "views_no"
        case likesNo = "likes_no"
        case recommended
        case hasVideo = "has_video"
        case tags, city
        case tourHTML = "tour_html"
        case famousFigure = "famous_figure"
        case period, era, founded
        case detailedDescription = "detailed_description"
        case address
        case gmapLocation = "gmap_location"
        case openingHours = "opening_hours"
        case translatedOpeningHours = "translated_opening_hours"
        case startingPrice = "starting_price"
        case ticketPrices = "ticket_prices"
//        case experienceTips = "experience_tips"
//        case isLiked = "is_liked"
        case reviews, rating
        case reviewsNo = "reviews_no"
        case audioURL = "audio_url"
        case hasAudio = "has_audio"
    }
}
