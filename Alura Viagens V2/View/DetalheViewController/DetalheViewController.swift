//
//  DetalheViewController.swift
//  Alura Viagens V2
//
//  Created by Fernanda Abreu on 06/11/22.
//

import UIKit

class DetalheViewController: UIViewController {

    //MARK: IBOUTLETS
    
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var subtituloLabel: UILabel!
   
    @IBOutlet weak var precoViagemLabel: UILabel!
    @IBOutlet weak var precoSemDescontoLabel: UILabel!
    @IBOutlet weak var diariasLabel: UILabel!
    var viagem: Viagem? = nil
    
    //MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraView()
        // Do any additional setup after loading the view.
    }

    //MARK: ACTIONS

    @IBAction func botaoVoltar(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    class func instanciar(_ viagem: Viagem) -> DetalheViewController {
        let detalheController = DetalheViewController(nibName: String(describing: self), bundle: nil)
        detalheController.viagem = viagem
        return detalheController
    }
    
    func configuraView(){
        viagemImage.image = UIImage(named: viagem?.asset ?? "")
        tituloLabel.text = viagem?.titulo
        subtituloLabel.text = viagem?.subtitulo
        precoViagemLabel.text = "R$ \(viagem?.preco ?? 0)"
        let atributoString: NSMutableAttributedString = NSMutableAttributedString(string:"R$ \(viagem?.precoSemDesconto ?? 0 )" )
        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0,atributoString.length))
        precoSemDescontoLabel.attributedText =  atributoString
        if let numeroDeDias = viagem?.diaria , let numeroDeHospedes = viagem?.hospedes{
            let diarias = numeroDeDias == 1 ? "Diaria" : "Diarias"
            let hospede = numeroDeHospedes == 1 ? "Pessoa" : "Pessoas"
            diariasLabel.text = "\(numeroDeDias) \(diarias) - \(numeroDeHospedes) \(hospede)"
            
            
        }
    }

}
