

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    //Variables*************************************
    
    let signInButton = UIButton()
    let signUpButton = UIButton()
    
    let mailTextField = UITextField()
    let passwordTextField = UITextField()
    
    let titleLabel = UILabel()
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        titleLabel.text = "Instagram Clone"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        titleLabel.textAlignment = .center
        titleLabel.frame = CGRect(x: 0, y: height*0.1, width: width, height: height*0.065)
        
        
        view.addSubview(titleLabel)
        
        mailTextField.placeholder = "Email"
        mailTextField.textAlignment = .center
        mailTextField.frame = CGRect(x: width/2 - width*0.75/2, y: height*0.2, width: width*0.75, height: height*0.065)
        view.addSubview(mailTextField)
        
        passwordTextField.placeholder = "Password"
        passwordTextField.textAlignment = .center
        passwordTextField.frame = CGRect(x: width/2 - width*0.75/2, y: height*0.28, width: width*0.75, height: height*0.065)
        view.addSubview(passwordTextField)
        
        signInButton.setTitle( "Sign In", for: UIControl.State.normal)
        signInButton.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        signInButton.frame = CGRect(x: (width/4 - width*0.375/2), y: height*0.36, width: width*0.375, height: height*0.065)
        view.addSubview(signInButton)
        
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: UIControl.Event.touchUpInside)

        
        signUpButton.setTitle( "Sign Up", for: UIControl.State.normal)
        signUpButton.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        signUpButton.frame = CGRect(x: (width*0.75 - width*0.375/2), y: height*0.36, width: width*0.375, height: height*0.065)
        view.addSubview(signUpButton)
        
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: UIControl.Event.touchUpInside)
        
        
        
            
    }
    
    
    
    @objc func signInButtonPressed() {
        
        if mailTextField.text != "" && passwordTextField.text != ""{
            
            Auth.auth().signIn(withEmail: mailTextField.text!, password: passwordTextField.text!) {(authdata, error) in
                
                if error != nil{
                    self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    
                }
                
                
                
                
            }
            
            
            
        }else{
            makeAlert(title: "Error!", message: "Username/Password cannot be empty")
        }
        
        
        
        
    }
    
    @objc func signUpButtonPressed() {
        
        if (mailTextField.text != "" && passwordTextField.text != ""){
            

            Auth.auth().createUser(withEmail: mailTextField.text!, password: passwordTextField.text!) {(authdata, error) in
                
                if error != nil {
                    self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Error")
                    
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    
                    
                }
                
                
            }
            
        }else{
            makeAlert(title: "Error!", message: "Username/Password cannot be empty")
        }


    }
    
    func makeAlert(title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    
    
    


}

