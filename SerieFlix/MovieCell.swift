//
//  MovieCell.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 29/01/2024.
//

import SwiftUI

struct MovieCell: View {
    
    let movie: Movie
    
    var body: some View {
        HStack {
            cover
            details
        }
        .padding()
        .onAppear {
            Task {
                let fetcher = MovieDBFetcher()
                let movies = await fetcher.getPopularMovies()
                print(movies)
            }
        }
    }
    
    // MARK: Private subviews
    
    private var cover: some View {
        AsyncImage(url: movie.coverURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Rectangle()
                .foregroundColor(.white.opacity(0.2))
        }
        .frame(width: 100, height: 120)
        .clipped()
        .cornerRadius(10)
    }
    
    private var details: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    VStack(alignment: .leading) {
                        title
                        publicationDate
                    }
                    Spacer()
                    RatingView(rating: movie.rate)
                }
                description
            }
        }
    }
    
    private var title: some View {
        Text(movie.title)
            .multilineTextAlignment(.leading)
            .font(.system(size: 18))
            .bold()
            .foregroundColor(.primaryText)
    }
    
    private var publicationDate: some View {
        Text(movie.releaseDate.string(from: "yyyy") ?? "No date")
            .font(.system(size: 12))
            .fontWeight(.light)
            .foregroundColor(.secondaryText)
    }
    
    private var description: some View {
        Text(movie.description)
            .multilineTextAlignment(.leading)
            .lineLimit(4)
            .font(.system(size: 14))
            .fontWeight(.light)
            .foregroundColor(.primaryText)
    }
    
}

#Preview {
    MovieCell(movie: Movie.previewMovie)
        .background(Color.appBackground)
        .previewLayout(.sizeThatFits)
}
