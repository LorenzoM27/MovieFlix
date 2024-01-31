//
//  CategoryListView.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 29/01/2024.
//

import SwiftUI

struct CategoryListView: View {
    
    @State private var movies: [Movie] = []
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(movies) { movie in
                        NavigationLink {
                            MovieDetailView(movie: movie)
                        } label: {
                            MovieCell(movie: movie)
                        }
                    }
                }
            }
            .navigationTitle("Nom de la catégorie")
            .background(Color.appBackground)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .onAppear {
                Task {
                    let fetcher = MovieDBFetcher()
                    self.movies = await fetcher.getPopularMovies()
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        CategoryListView()
    }
    
}
