//
//  ContentView.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 29/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           // MovieCell(movie: .previewMovie)
            CategoryListView()
                .background(Color.appBackground)
        }
    }
}

#Preview {
    ContentView()
}
