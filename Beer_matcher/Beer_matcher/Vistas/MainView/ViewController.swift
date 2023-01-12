import UIKit

class ViewController: UIViewController {
    
    var cañas: [Result] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    @IBOutlet weak var busqueda: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        tableView?.delegate = self
        busqueda.delegate = self
        
    }
    
    func birras(comida: String){
        
        NetworkingProvider.shared.getBeersWithFood(comida: comida) { beers in
            self.cañas = beers
            print(beers)
        } failure: { error in
            print(error ?? "Ha habido un error")
        }
        
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cañas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeerTableViewCell",
                                                       for: indexPath) as? BeerTableViewCell else {return UITableViewCell()}
        
        if cañas.count > indexPath.row {
            let caña = cañas[indexPath.row]
            
            cell.configureViews(beerName: caña.name)
        }
        
        
        
        return cell
    }
    
    
    
}

extension ViewController: UITableViewDelegate {
    //Función lógica detalle
}


extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let textoBusqueda = busqueda.text
        birras(comida: textoBusqueda!)
        
    }
}
