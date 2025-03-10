import UIKit

class SettingsViewController: UIViewController {
    
    let logoutButton = UIButton()
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        logoutButton.setTitle( "Logout", for: UIControl.State.normal)
        logoutButton.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        logoutButton.frame = CGRect(x: (width/2 - width*0.375/2), y: height*0.36, width: width*0.375, height: height*0.065)
        view.addSubview(logoutButton)
        
        logoutButton.addTarget(self, action: #selector(logoutButtonPressed), for: UIControl.Event.touchUpInside)
        
        
        
        
        
        

    }
    
    @objc func logoutButtonPressed() {
        performSegue(withIdentifier: "toViewController", sender: nil)
    }
    

    
    
    
    
}
