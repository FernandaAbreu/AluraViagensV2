//
//  ViagemViewModel.swift
//  Alura Viagens V2
//
//  Created by Fernanda Abreu on 05/11/22.
//

import UIKit

enum ViagemViewModelType: String {
    case destaques
    case ofertas
    case internacionais
}

protocol ViagemViewModel {
    var tituloSessao: String {get}
    var tipo: ViagemViewModelType {get}
    var viagens: [Viagem] {get set}
    var numeroDeLinhas: Int {get}
}
