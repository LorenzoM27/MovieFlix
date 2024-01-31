//
//  ActorMapper.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 31/01/2024.
//

import Foundation

struct ActorMapper {
    
    static func map(restActor: RestActor) -> Actor {
        var url: URL? = nil
        
        if let path = restActor.profilePath {
            url = URL(string: "https://image.tmdb.org/t/p/w500/\(path)")
        }
        
        return Actor(
            id : restActor.id,
            name: restActor.name,
            characterName: restActor.characterName,
            pictureURL: url
        )
    }
}
