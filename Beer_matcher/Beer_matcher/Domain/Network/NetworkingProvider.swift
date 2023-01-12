import Foundation
import Alamofire

final class NetworkingProvider{
    
    static let shared = NetworkingProvider()
    
    private let baseUrl = "https://api.punkapi.com/v2/beers"
    private let statusOk = 200...299
    

    
    func getBeersWithFood(success: @escaping (_ beers: [Result]) -> (), failure: @escaping (_ error: Error?) -> ()){
        
        let url = "\(baseUrl)?food=banana"
        

        
        AF.request(url, method: .get).responseData { (response) in
            switch response.result {
            case .failure(let error):
                failure(error)
            case .success(let value):
                do {
                    
                   let decoder = JSONDecoder()
                    let beers = try decoder.decode([Result].self, from: value)
                    success(beers)
                    
                } catch {
                    print(error)
                }
            }
 
    }
}


}
