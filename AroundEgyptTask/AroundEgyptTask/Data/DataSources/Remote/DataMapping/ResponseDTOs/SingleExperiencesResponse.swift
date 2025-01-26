//
//  SingleExperiencesResponse.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 26/01/2025.
//

struct SingleExperiencesResponse : Codable {
    let meta : Meta?
    let data : Datum?
    let pagination : Pagination?

    enum CodingKeys: String, CodingKey {

        case meta = "meta"
        case data = "data"
        case pagination = "pagination"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
        data = try values.decodeIfPresent(Datum.self, forKey: .data)
        pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
    }

}
