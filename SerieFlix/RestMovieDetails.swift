//
//  RestMovieDetails.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 31/01/2024.
//

import Foundation

struct RestMovieDetails: Decodable {
    let genres: [RestGenre]
}
