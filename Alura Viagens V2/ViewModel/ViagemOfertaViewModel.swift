//
//  ViagemOfertaViewModel.swift
//  Alura Viagens V2
//
//  Created by Fernanda Abreu on 06/11/22.
//

import Foundation
import UIKit

class ViagemOfertaViewModel: ViagemViewModel {
    var tituloSessao: String {
        return "Ofertas"
    }
    
    var tipo: ViagemViewModelType {
        return .ofertas
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int {
        return 1
    }
    
    // MARK : Construtor
    
    init(_ viagens: [Viagem]){
        self.viagens = viagens
    }
}
