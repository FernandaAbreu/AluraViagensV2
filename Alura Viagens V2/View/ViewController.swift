//
//  ViewController.swift
//  Alura Viagens V2
//
//  Created by Fernanda Abreu on 05/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viagensTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       configuraView()
        view.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
    }

    func configuraView(){
        viagensTableView.register(UINib(nibName: "OfertaTableViewCell", bundle: nil), forCellReuseIdentifier: "OfertaTableViewCell")
        viagensTableView.register(UINib(nibName: "ViagemTableViewCell", bundle: nil), forCellReuseIdentifier: "ViagemTableViewCell")
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
        
    }
    
    func irParaDestaques(_ viagem: Viagem?){
        
        if let viagemselecionada = viagem {
            let detalheController = DetalheViewController.instanciar(viagemselecionada)
            navigationController?.pushViewController(detalheController, animated: true)
        }
       
    }
}

extension ViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessaoDeViagens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = sessaoDeViagens?[indexPath.section]
        switch viewModel?.tipo{
        case .destaques:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell") as? ViagemTableViewCell else{
                fatalError("error to create ViagemTableViewCell")
            }
            cell.configuraCelula(viewModel?.viagens[indexPath.row])
            return cell
        case .ofertas:
            guard let celulaOferta = tableView.dequeueReusableCell(withIdentifier: "OfertaTableViewCell") as? OfertaTableViewCell else{
                fatalError("error to create OfertaTableViewCell")
            }
            celulaOferta.delegate = self
            celulaOferta.configuraCelula(viewModel?.viagens)
            return celulaOferta
        default:
            return UITableViewCell()
        }
        
    }
    
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewModel = sessaoDeViagens?[indexPath.section]
        switch viewModel?.tipo{
        case .destaques , .internacionais:
            let viagemSelecionada = viewModel?.viagens[indexPath.row]
            irParaDestaques(viagemSelecionada)
        default:
            break
        }
       
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if(section == 0){
            let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
            headerView?.configuraView()
            return headerView
        }
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 300 : 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 : 500
    }
}

extension ViewController: OfertaTableViewCellDelegate {
    func didSelectView(_ viagem: Viagem?) {
        irParaDestaques(viagem)
    }
    
    
}

