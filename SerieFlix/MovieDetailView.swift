//
//  MovieDetailView.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 30/01/2024.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    
    @State private var genres: [String] = []
    @State private var actors: [Actor] = []
    @State private var similarMovies: [Movie] = []
    
    @State private var isLiked = false
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject private var userData: UserData // Récupération de la variable d'environnement
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                coverImage
                VStack(alignment: .leading, spacing: 24) {
                    titleBox
                    genresBox
                    descriptionBox
                    castBox
                    similarMoviesBox
                }
                .padding()
            }
        }
        .overlay(alignment: .topLeading) {
            CustomCircleButton(icon: "chevron.left") {
                dismiss()
            }
            .padding(.top)
            .padding(.leading, 20)
        }
        .overlay(alignment: .topTrailing) {
            CustomCircleButton(icon: "heart", activeColor: .likeAccent, isActive: $isLiked) {
                // Dans ce code, on a remplacé le paramètre isLiked dans le bouton. Puis, on a ajouté l’identifiant du film si celui-ci n’était pas déjà présent (donc le film n’était pas favori), et on l’a supprimé s'il était présent (donc si le film était déjà en favori).
                
                // Ensuite, on doit ajouter userData.objectWillChange.send() . Cela permet d’indiquer à la vue MovieDetailView que la variable d’état a été modifiée, et donc qu’il faut mettre à jour la vue.
                if userData.favouriteMovieIds.contains(movie.id) {
                    userData.favouriteMovieIds.remove(movie.id)
                } else {
                    userData.favouriteMovieIds.insert(movie.id)
                }
                print(userData.favouriteMovieIds)
                userData.objectWillChange.send()
            }
            .padding(.top)
            .padding(.trailing, 20)
        }
        .onAppear {
            loadGenres()
            loadActors()
            loadSimilar()
        }
        .background(Color.appBackground)
        .navigationBarBackButtonHidden()
        .edgesIgnoringSafeArea(.top)
    }
    
    // MARK: - Private subviews
    
    
    // Pour obtenir cet effet qui donne l’impression que l’image se fonde dans l’écran, on peut utiliser le modifier .overlay et l’objet LinearGradient
    private var coverImage: some View {
        AsyncImage(url: movie.coverURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 400)
                .clipped()
                .overlay(alignment: .bottom) {
                    LinearGradient( // Création d'un gradient de la couleur de l'app
                        colors: [.clear, .appBackground],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height:300)
                }
        } placeholder: {
            Rectangle()
                .foregroundColor(.cellBackground)
        }
    }
    
    private var descriptionBox: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Description")
                .foregroundColor(.primaryText)
                .font(.system(size: 20, weight: .semibold))
            Text(movie.description)
                .foregroundColor(.secondaryText)
                .lineSpacing(4)
        }
    }
    
    private var titleBox: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .foregroundColor(.primaryText)
                    .font(.system(size: 28, weight: .bold))
                Text(movie.releaseDate.string(from: "dd/MM/yyyy") ?? "No date")
                    .foregroundColor(.secondaryText)
                    .font(.system(size: 16, weight: .light))
            }
            Spacer()
            RatingView(rating: movie.rate)
        }
    }
    
    private var genresBox: some View {
        HStack {
            ForEach(self.genres, id: \.self) { genre in
                GenrePill(name: genre)
            }
        }
    }
    
    // A noter que la variable actor est entre quotes, car actor est également un mot clé. Lorsqu’on souhaite créer une variable qui a le même nom qu’un mot clé en Swift, on doit ajouter ' autour
    private var castBox: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Acteurs")
                .foregroundColor(.primaryText)
                .font(.system(size: 20, weight: .semibold))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(actors) { `actor` in
                        ActorCell(actor: actor)
                            .frame(width: 120)
                    }
                }
                .padding(20)
            }
            .padding(-20)
        }
    }
    
    private var similarMoviesBox: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Similaires")
                .foregroundColor(.primaryText)
                .font(.system(size: 20, weight: .semibold))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(similarMovies) { movie in
                        NavigationLink {
                            MovieDetailView(movie: movie)
                        } label: {
                            MovieCover(coverURL: movie.coverURL)
                        }
                    }
                }
                .padding(20)
            }
            .padding(-20)
        }
    }
    
    
    // MARK: - Private methods
    
    func loadGenres() {
        Task {
            let fetcher = MovieDBFetcher()
            let genres = await fetcher.getGenres(movieId: movie.id)
            self.genres = genres
        }
    }
    
    func loadActors() {
        Task {
            let fetcher = MovieDBFetcher()
            let actors = await fetcher.getCast(movieId: movie.id)
            self.actors = actors
        }
    }
    
    func loadSimilar() {
        Task {
            let fetcher = MovieDBFetcher()
            let similarMovies = await fetcher.getSimilar(movieId: movie.id)
            self.similarMovies = similarMovies
        }
    }
    
}

#Preview {
    MovieDetailView(movie: .previewMovie)
        .environmentObject(UserData(favouriteMovieIds: []))
}


// Mais attention ! Dès qu’on récupère une variable d’environnement dans une vue, on doit transmettre une fausse variable d’environnement à la preview, sinon elle crash.
