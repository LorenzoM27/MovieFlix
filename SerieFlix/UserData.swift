//
//  UserData.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 31/01/2024.
//

import Foundation

class UserData: ObservableObject, Codable {
    var favouriteMovieIds: Set<Int>
    
    init(favouriteMovieIds: Set<Int>) {
        self.favouriteMovieIds = favouriteMovieIds
    }
}


// Dans un premier temps, définissons une variable pour stocker les films favoris de l’utilisateur. Comme on utilisera cette variable en tant que variable d’environnement, elle doit être observable. On est donc obligés de créer un nouveau type qui se conforme au protocole ObservableObject

// On a créé un type UserData pour y stocker toutes les données qui seront sauvegardées par l’utilisateur. La propriété favouriteMovieIds est de type Set<Int> , c’est-à-dire un ensemble. Un ensemble est un groupe d’éléments qui ne permet pas les doublons. Si je stocke “2” plusieurs fois dans ce set, alors “2” ne sera présent qu’une seule fois.

