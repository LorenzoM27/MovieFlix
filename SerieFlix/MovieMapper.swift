//
//  MovieMapper.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 29/01/2024.
//

import Foundation

//Structure qui contient une méthode. Cette méthode se chargera de faire la transformation du RestMovie en Movie -> on récupère les données sous forme de RestMovie, on les transfomes en Movie afin de les afficher.

struct MovieMapper {
    
    static func map(restMovie: RestMovie) -> Movie {
        
        return Movie(
            id : restMovie.id,
            title: restMovie.title,
            coverURL: URL(string: "https://image.tmdb.org/t/p/w500/\(restMovie.posterPath)")!,
            description: restMovie.overview,
            rate: restMovie.voteAverage,
            releaseDate: Date(from: restMovie.releaseDate, format: "yyyy-MM-dd")!
        )
    }
}
