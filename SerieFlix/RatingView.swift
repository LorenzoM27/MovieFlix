//
//  RatingView.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 30/01/2024.
//

import SwiftUI

struct RatingView: View {
    
    let rating : Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5)
                .foregroundColor(.white.opacity(0.5))
            
            Circle()
                .trim(from: 0, to: CGFloat(rating)/10.0)
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .foregroundColor(.primaryAccent)
                .rotationEffect(.degrees(-90))
            
            //  .trim(from: 0, to: 0.3) pour couper le cercle de 0 à 30 %.
            // .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round)) pour créer une bordure d’épaisseur 5 et donc les bords sont arrondis.
            // .rotationEffect(.degrees(-90)) car la troncature du cercle avec .trim commence à 3h sur le cercle.
            // Attention : il faut absolument diviser par 10.0 et non par 10 , car une division d’un flottant par un entier donnera un entier. Or, le résultat de la division entière donnera soit 1 soit 0.
            
            Text(String(format: "%.1F", rating))
                .foregroundStyle(.primaryText)
                .font(.system(size: 14))
        }
        .frame(width: 40, height: 40)
    }
}

// On peut utiliser .stroke(lineWidth: 5) pour transformer un disque (plein) en un cercle (non plein). Ce modifier est valable pour toutes les formes.
// On peut utiliser .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round)) pour arrondir les extrémités de la bordure.


#Preview {
    Group {
        RatingView(rating: -3)
        RatingView(rating: 0)
        RatingView(rating: 3.2)
        RatingView(rating: 7.5)
        RatingView(rating: 10)
        RatingView(rating: 14)
    }
    .padding()
    .background(Color.appBackground)
    .previewLayout(.sizeThatFits)
}
