//
//  RestPopularMoviesResult.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 29/01/2024.
//

import Foundation


struct RestPopularMoviesResult: Decodable {
    let results: [RestMovie]
}
