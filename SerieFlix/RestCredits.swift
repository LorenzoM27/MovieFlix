//
//  RestCredits.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 31/01/2024.
//

import Foundation


struct RestCredits: Decodable {
    let cast: [RestActor]
}
