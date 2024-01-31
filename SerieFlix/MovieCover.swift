//
//  MovieCover.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 31/01/2024.
//

import SwiftUI

struct MovieCover: View {
    
    let coverURL : URL
    
    var body: some View {
        AsyncImage(url: coverURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Rectangle()
                .foregroundColor(.cellBackground)
        }
        .frame(width: 100, height: 150)
        .cornerRadius(10)
    }
}

#Preview {
    MovieCover(coverURL: Movie.previewMovie.coverURL)
        .padding()
        .background(Color.appBackground)
        .previewLayout(.sizeThatFits)
}
