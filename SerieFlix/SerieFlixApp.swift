//
//  SerieFlixApp.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 29/01/2024.
//

import SwiftUI

@main
struct SerieFlixApp: App {
    
    @State private var userData = UserData(favouriteMovieIds: [])
    @Environment(\.scenePhase) var scenePhase // Récupération de la scène
    
    var body: some Scene {
        WindowGroup {
            CategoryListView()
                .environmentObject(userData)
        }
        .onChange(of: scenePhase) { newPhase in // Détection d'un changement de scène
            if newPhase == .active {
                // à compléter
            } else {
                // à compléter
            }
        }
    }
    
    // Dans cette méthode, on peut ensuite convertir la variable userData en une chaîne de caractères. Pour ça, on commence par la convertir en JSON, puis convertir ce JSON en String :
    
//    private func saveData() {
//        // Conversion de UserData en String
//        do {
//            let data = try JSONSerialization.data(withJSONObject: userData)
//            let jsonString = String(data: data, encoding: .utf8)
//            
//            // Sauvegarde des données dans le fichier data.json
//            if let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.app {
//                do {
//                    try jsonString?.write(to: fileURL, atomically: true, encoding: .utf8)
//                    print("Données JSON écrites avec succès dans le fichier : \(fileURL.path)")
//                } catch {
//                    print("Erreur lors de l'écriture des données JSON dans le fichier : \(error)")
//                }
//            }
//        } catch {
//            print("Erreur de serialisation")
//        }
//    }
}


// Ensuite, on peut passer cette variable en variable d’état. Comme elle doit être accessible dans toute l’application, on va la définir à la racine, c’est-à-dire dans le fichier MovieDBApp.swift .

// Comme au lancement de l’app, on n’a pas encore retrouvé les films favoris, on initialise userData avec un tableau vide.

// Grâce au modifier .environmentObject(userData) , on a maintenant accès à cette variable dans toute l’application. On peut, par exemple, la récupérer dans la vue MovieDetailView

// Ensuite, on va pouvoir enregistrer ces données. Pour ça, il faut décider quand sauvegarder ces données. On pourrait le faire à chaque fois que l’utilisateur clique sur un bouton favori, mais cela n’est peut-être pas nécessaire. Afin d’écrire le moins possible sur la mémoire, on peut enregistrer les données lorsque l’application se ferme.

// On peut utiliser le modifier .onChange(of:) qui nous permet de détecter quand l’application change de scène, c’est-à-dire lorsqu’elle passe en tâche de fond, qu’elle est quittée ou qu’elle revient en plein écran.
