//
//  ViewController.swift
//  Beer_matcher
//
//  Created by Mikel Cobian on 4/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var busqueda: UISearchBar!
    
    //Añadir toda la mierda de las tablas y su puta madre para ver si se ve algo
    
    var cañas: [Result] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birras()
    }
    //añadir el parámetro de comida
    func birras(){
        //Llamamos cuando cambie el texto de la searchbar
        NetworkingProvider.shared.getBeersWithFood { beers in
            self.cañas = beers
            print(beers)
        } failure: { error in
            print(error ?? "Ha habido un error")
        }

    }

}

