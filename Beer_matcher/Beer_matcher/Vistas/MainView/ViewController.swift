//
//  ViewController.swift
//  Beer_matcher
//
//  Created by Mikel Cobian on 4/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var busqueda: UISearchBar!
    
    let searchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Búsqueda de cervezas"
        navigationItem.searchController = searchController
    }


}

