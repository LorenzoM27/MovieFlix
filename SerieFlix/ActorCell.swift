//
//  ActorCell.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 31/01/2024.
//

import SwiftUI

struct ActorCell: View {
    
    let actor : Actor
    
    var body: some View {
        VStack(spacing: 12) {
            image
            names
        }
    }
    
    // MARK: Private subviews
    
    private var image: some View {
        AsyncImage(url: actor.pictureURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
        } placeholder: {
            Circle()
                .foregroundColor(.cellBackground)
        }
        .frame(width: 80, height: 80)
    }
    
    private var names: some View {
        VStack(spacing: 4) {
            Text(actor.name)
                .font(.system(size: 18))
                .foregroundColor(.primaryText)
            Text(actor.characterName)
                .foregroundColor(.secondaryText)
        } }
}

#Preview {
    ActorCell(actor: .preview)
        .padding()
        .previewLayout(.sizeThatFits)
        .background(Color.appBackground)
}
