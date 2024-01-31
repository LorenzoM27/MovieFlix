//
//  Actor.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 31/01/2024.
//

import Foundation

struct Actor: Identifiable {
    let id : Int
    let name: String
    let characterName: String
    let pictureURL: URL?
}


#if DEBUG

extension Actor {
    
    static let preview = Actor(
        id : 0,
        name: "Margot Robbie",
        characterName: "Barbie",
        pictureURL: URL(string: "https://media.themoviedb.org/t/p/w600_and_h900_bestv2/euDPyqLnuwaWMHajcU3oZ9uZezR.jpg")!
    )
}

#endif
