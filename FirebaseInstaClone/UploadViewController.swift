import UIKit
import Firebase
import FirebaseStorage



class UploadViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let image = UIImageView()
    let commentText = UITextField()
    let uploadButton = UIButton()
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        image.image = UIImage(named: "selectimage")
        image.frame = CGRect(x: width*0.5 - width*0.8/2,y: height*0.15 , width: width*0.8, height: height*0.3)
        view.addSubview(image)
        
        image.isUserInteractionEnabled = true
        let imageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        image.addGestureRecognizer(imageTapGestureRecognizer)
        
        commentText.placeholder = "Comment"
        commentText.textAlignment = .center
        commentText.frame = CGRect(x: 0, y: height*0.55, width: width, height: height*0.10)
        view.addSubview(commentText)
        
        uploadButton.setTitle("Upload", for: UIControl.State.normal)
        uploadButton.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        uploadButton.frame = CGRect(x: 0, y: height*0.65, width: width, height: height*0.10)
        view.addSubview(uploadButton)
        
        uploadButton.addTarget(self, action: #selector(uploadButtonClicked), for: UIControl.Event.touchUpInside)
        
        
        
    }
    
    @objc func selectImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        image.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func uploadButtonClicked(){
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media")
        
        if let data = image.image?.jpegData(compressionQuality: 0.5) {
            
            let uniqueID = UUID().uuidString
            let imageReference = mediaFolder.child("\(uniqueID).jpg")
            //let imageReference = mediaFolder.child("image.jpg")
            
            imageReference.putData(data, metadata: nil){ (metadata, error) in
                
                if error != nil {
                    
                    self.alertMessage(title: "Error!", message: error?.localizedDescription ?? "Error!")
                    
                }else{
                    
                    imageReference.downloadURL{ (url, error) in
                        
                        if error != nil {
                            self.alertMessage(title: "Error!", message: error?.localizedDescription ?? "Error!")

                        }else{
                            
                            let imageUrl = url?.absoluteString
                            
                        }
                    }
                    
                }
            
            }
        }
    }
    
    func alertMessage(title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    

   

}
