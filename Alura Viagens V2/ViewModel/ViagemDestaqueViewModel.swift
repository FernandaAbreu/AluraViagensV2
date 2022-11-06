//
//  ViagemDestaqueViewModel.swift
//  Alura Viagens V2
//
//  Created by Fernanda Abreu on 05/11/22.
//

import Foundation

class ViagemDestaqueViewModel :ViagemViewModel {
    var tituloSessao: String {
        return "Destaques"
    }
    
    var tipo: ViagemViewModelType {
        return .destaques
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int {
        return viagens.count
    }
    
    init (_ viagens: [Viagem] ){
        self.viagens = viagens
    }
    
}
