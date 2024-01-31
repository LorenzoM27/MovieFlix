//
//  DateExtension.swift
//  SerieFlix
//
//  Created by Lorenzo Menino on 29/01/2024.
//

import Foundation


extension Date {
    
    // Ce constructeur permet de créer une date
    init?(from stringDate: String, format: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        if let date = dateFormatter.date(from: stringDate) {
            self = date
        } else {
            return nil
        }
    }
    // on transforme la chaîne de caractères en date en fonction du format passé en paramètre. Par exemple, si on lui fournit les paramètres stringDate: “23-06-2020” et format: “jj-MM-yyyy” , la date sera le 23 juin 2020

    // On va créer la fonction permettant de transformer un objet de type date en chaine de caractère
    func string(from format: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    // si on écrit Date.now.string(from: “jj-MM-yyyy”) , on obtient la date du jour au format “jour - mois - année” 
    
}
