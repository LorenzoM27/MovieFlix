//
//  GenrePill.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 31/01/2024.
//

import SwiftUI

struct GenrePill: View {
    
    let name : String
    
    var body: some View {
        Text(name)
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(.secondaryText)
            .background {
                RoundedRectangle(cornerRadius: .infinity)
                    .foregroundColor(.white.opacity(0.1))
            }
    }
}

#Preview {
    GenrePill(name: "Test category")
        .padding()
        .background(Color.appBackground)
        .previewLayout(.sizeThatFits)
}
