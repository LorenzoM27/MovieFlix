//
//  MovieDBFetcher.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 29/01/2024.
//

import Foundation

class MovieDBFetcher {
    // après api_key -> notre clé token pour avoir accès aux données
    let stringURL = "https://api.themoviedb.org/3/movie/popular?api_key=8d5f561a5ec329fc0ae72d3a28158816"
    
    func getPopularMovies() async -> [Movie] {
        
        let url = URL(string: stringURL)!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(RestPopularMoviesResult.self, from: data)
            let movies = result.results.map { restMovie in
                MovieMapper.map(restMovie: restMovie)
            }
            return movies
            
        } catch {
            print(" \(error)")
            return []
        }
    }
    
    func getGenres(movieId: Int) async -> [String] {
        let stringURL = "https://api.themoviedb.org/3/movie/\(movieId)?api_key=8d5f561a5ec329fc0ae72d3a28158816"
        let url = URL(string: stringURL)!
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let details = try JSONDecoder().decode(RestMovieDetails.self, from: data)
            // Transformation de RestGenre en genre
            
            // Transformation de [RestGenre] en [string]
            let genres = details.genres.map { restGenre in
                return restGenre.name
            }
            return genres
            
        } catch {
            print(" \(error)")
            return []
        }
    }
    
    func getCast(movieId: Int) async -> [Actor] {
        
        let stringURL = "https://api.themoviedb.org/3/movie/\(movieId)/credits?api_key=8d5f561a5ec329fc0ae72d3a28158816"
        let url = URL(string: stringURL)!
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let credits = try JSONDecoder().decode(RestCredits.self, from: data)
            
            // Transformation des actors
            let actors = credits.cast.map { restActor in
                ActorMapper.map(restActor: restActor)
            }
            return actors
            
        } catch {
            print(" \(error)")
            return []
        }
    }
    
    func getSimilar(movieId: Int) async -> [Movie] {
        let stringURL = "https://api.themoviedb.org/3/movie/\(movieId)/similar?api_key=8d5f561a5ec329fc0ae72d3a28158816"
        let url = URL(string: stringURL)!
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(RestPopularMoviesResult.self, from: data)
            
            let movies = result.results.map { restMovie in
                MovieMapper.map(restMovie: restMovie)
            }
            return movies
            
        } catch {
            print(" \(error)")
            return []
        }
    }
}


// L’appel de la méthode data(from: url) doit être précédé des deux mots clé try et await car elle peut jeter une erreur, et que c’est une fonction asynchrone. Elle doit doit être encapsulée dans un bloc do - catch .

// On récupère donc les données transmises par le serveur (si tout s’est bien passé) dans la variable data.
