import Foundation
import UIKit

class BeerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var beerName: UILabel?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        beerName?.text = nil
        
    }
    
    func configureViews(beerName: String? = nil){
        
        
        self.beerName?.text = beerName
        
        
    }
}
