import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var busqueda: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    

    
    var cañas: [Result] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        tableView?.delegate = self
        
        //birras()
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

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeerTableViewCell",
                                                       for: indexPath) as? BeerTableViewCell else {return UITableViewCell()}
        
        cell.configureViews(beerName: "Franziskaner")
        
        return cell
    }
    
   
    
}

extension ViewController: UITableViewDelegate {
    //Función lógica detalle
}


