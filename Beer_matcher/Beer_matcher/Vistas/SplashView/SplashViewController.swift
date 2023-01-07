import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator?.startAnimating()
        navigateNext()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        activityIndicator?.stopAnimating()
    }
    
    private func navigateNext() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self]  in
            
        
            let storyboardMain = UIStoryboard(name: .storyboardMain,
                                              bundle: nil)
            
            if let destination = storyboardMain.instantiateInitialViewController() {
                self?.navigationController?.setViewControllers([destination],
                                                               animated: true)
            }
            
        }
        
    }
}

private extension String {
    static let storyboardMain = "Main"
}
