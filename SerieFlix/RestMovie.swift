//
//  RestMovie.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 29/01/2024.
//

import Foundation

struct RestMovie: Decodable {
    
    let id : Int
    let overview: String
    let posterPath: String
    let releaseDate: String
    let title: String
    let voteAverage: Float
    
    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}

