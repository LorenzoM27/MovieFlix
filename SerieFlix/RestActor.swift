//
//  RestActor.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 31/01/2024.
//

import Foundation

struct RestActor: Decodable {
    let id : Int
    let name: String
    let characterName: String
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case characterName = "character"
        case profilePath = "profile_path"
    }
}
