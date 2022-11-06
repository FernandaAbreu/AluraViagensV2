//
//  ViagemTableViewCell.swift
//  Alura Viagens V2
//
//  Created by Fernanda Abreu on 05/11/22.
//

import UIKit

class ViagemTableViewCell: UITableViewCell {

    // MARK: Outlets
    
    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var viagemImageView: UIImageView!

    @IBOutlet weak var statusCancelamentoLabel: UILabel!
    @IBOutlet weak var precoComDescontoVIagemLabel: UILabel!
    @IBOutlet weak var precoSemDescontoViagemLabel: UILabel!
    @IBOutlet weak var diariasViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var tituloViagemLabel: UILabel!
    
    func configuraCelula(_ viagem: Viagem?){
        viagemImageView.image = UIImage(named: viagem?.asset ?? "")
        tituloViagemLabel.text = viagem?.titulo
        subtituloViagemLabel.text = viagem?.subtitulo
        precoComDescontoVIagemLabel.text = "R$ \(viagem?.preco ?? 0)"
        let atributoString: NSMutableAttributedString = NSMutableAttributedString(string:"R$ \(viagem?.precoSemDesconto ?? 0 )" )
        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0,atributoString.length))
        precoSemDescontoViagemLabel.attributedText =  atributoString
        if let numeroDeDias = viagem?.diaria , let numeroDeHospedes = viagem?.hospedes{
            let diarias = numeroDeDias == 1 ? "Diaria" : "Diarias"
            let hospede = numeroDeHospedes == 1 ? "Pessoa" : "Pessoas"
            diariasViagemLabel.text = "\(numeroDeDias) \(diarias) - \(numeroDeHospedes) \(hospede)"
            
            DispatchQueue.main.async {
                self.backgroundViewCell.addSombra()
            }
        }
    }
}
