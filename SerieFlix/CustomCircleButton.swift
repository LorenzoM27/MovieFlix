//
//  CustomCircleButton.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 31/01/2024.
//

import SwiftUI

struct CustomCircleButton: View {
    
    let icon : String
    let action: () -> Void
    let activeColor: Color
    @Binding var isActive: Bool
    
    // Pour différencier les deux types de boutons (ceux qui auront un état d’activation, et ceux qui n’en ont pas), on va créer deux constructeurs. Ainsi, on donnera des valeurs par défaut à activeColor et à isActive lorsque le bouton ne disposera pas d’un état d’activation. struct CustomCircleButton: View {
    
    init(icon: String, activeColor: Color, isActive: Binding<Bool>, action: @escaping () -> Void) {
        self.icon = icon
        self.action = action
        self.activeColor = activeColor
        self._isActive = isActive
    }
    
    
    init(icon: String, action: @escaping () -> Void) {
        self.icon = icon
        self.action = action
        self.activeColor = .white
        self._isActive = .constant(false)
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Circle()
                .foregroundColor(.white.opacity(0.5))
                .frame(width: 50, height: 50)
                .shadow(color: .black, radius: 10)
                .overlay {
                    Image(systemName: isActive ? icon + ".fill" : icon)
                        .imageScale(.large)
                        .bold()
                        .foregroundColor(isActive ? activeColor : .white)
                }
                .padding(.top)
                .padding(.leading, 20)
        }
        
    }
}

#Preview {
    CustomCircleButton(icon: "chevron.left", action: {})
}
