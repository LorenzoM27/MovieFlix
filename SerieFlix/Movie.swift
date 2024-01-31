//
//  Movie.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 29/01/2024.
//

import Foundation

struct Movie: Identifiable {
    
    let id : Int
    let title: String
    let coverURL: URL
    let description: String
    let rate: Float
    let releaseDate: Date
}

#if DEBUG
extension Movie {
    static let previewMovie: Movie = Movie(
        id: 0,
        title: "Cars : Quatre roues",
        //coverURL: URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hvHw7ASXEK8x3EawlOtwYXrovdo")!,
        coverURL: URL(string: "https://www.themoviedb.org/t/p/w1280/4P0NYzeNFqddAjllEICPAbd0iiu.jpg")!,
        description: "Un champion de course, Flash McQueen vit à cent à l'heure jusqu’à ce qu’un détour le mène à Radiator Springs, une petite ville oubliée sur la Route 66. Il y rencontre Sally, Martin, Doc Hudson et un tas de personnages amusants qui l’aident à découvrir que la vie vaut plus que les trophées et la célébrité.",
        rate: 6.9,
        releaseDate: Date(from: "14/06/2006", format: "dd/MM/yyyy")!
    )
    
    static let popularMovies: [Movie] = [
        Movie(
            id: 1,
            title: "Transformers: Rise of the Beasts",
            coverURL: URL(string: "https://www.themoviedb.org/t/p/w1280/kq6AYN96FjWSZQVRYpAPmBAVq2s.jpg")!,
            description: "En 1994, alors que les Autobots viennent d'arriver, Optimus Prime s'acclimate à la Terre. Une archéologue et un ancien militaire vont découvrir les traces d'une guerre entre deux anciennes factions de Transformers, les Maximals et les Predacons. Optimus Prime devra faire face à de nouveaux ennemis, les Predacons et leur redoutable chef Scourge. Les Autobots et les Maximals feront face à une menace encore plus grande : Unicron, une planète métallique géante qui s'apprête à dévorer la Terre.",
            rate: 7.3,
            releaseDate: Date(from: "07/06/2023", format: "dd/MM/yyyy")!),
        
        Movie(
            id: 2,
            title: "Sound of Freedom",
            coverURL: URL(string: "https://www.themoviedb.org/t/p/w1280/mx4O9OEvIB265VM3UATLslsSW5t.jpg")!,
            description: "Après avoir sauvé un garçon des trafiquants d'enfants impitoyables, un agent fédéral apprend que la sœur du garçon est toujours captive et décide de se lancer dans une dangereuse mission pour la sauver. Le temps presse, il quitte son travail et s'enfonce dans la jungle colombienne, mettant sa vie en jeu pour la libérer d'un destin pire que la mort.",
            rate: 8.3,
            releaseDate: Date(from: "04/07/2023", format: "dd/MM/yyyy")!
        ),
        
        Movie(
            id: 3,
            title: "Barbie",
            coverURL: URL(string: "https://www.themoviedb.org/t/p/w1280/oQjqjIQ46VVa8Q80y3FfLrPXoK3.jpg")!,
            description: "Une barbie jugée pas assez \"parfaite\" part à l'aventure dans le monde réel.",
            rate: 8.4,
            releaseDate: Date(from: "19/07/2023", format: "dd/MM/yyyy")!
        )
    ]
}
#endif
