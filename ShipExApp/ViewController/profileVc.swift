//
//  profileVcViewController.swift
//  ShipExApp
//
//  Created by Ibrahim Diab on 23/10/2022.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
class profileVc: UIViewController {
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var uploadImage: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phonelabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var baseStackView: UIView!
    @IBOutlet weak var logout: UIButton!
 
    
    var imagePicker = UIImagePickerController()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
       passDataTolabels()
       
        
        
       
    }
 

    
    
    @IBAction func uploadImage(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    func setUpView()
    {
        self.view.bringSubviewToFront(imageView)
        imagePicker.delegate = self
        self.addCornerRadiousView(value: imageView.frame.height/2, view: imageView)
        self.addCornerRadiousView(value: imageView.frame.height/2, view: userImage)
        self.addShadow(myImage: userImage)
        self.addCornerRadiousView(value: 20, view: baseStackView)
        self.addCornerRadiousView(value: 20, view: logout)
        userImage.contentMode = .scaleAspectFit
        
    }
    

    
    func passDataTolabels()
    {
        
       let username =  UserDefaults.standard.object(forKey: "username")
        let email =  UserDefaults.standard.object(forKey: "email")
        let gender =  UserDefaults.standard.object(forKey: "gender")
        let mobile =  UserDefaults.standard.object(forKey: "mobile")
       
        self.nameLabel.text = ("Name : \(username!)")
        self.emailLabel.text = ("Email : \(email!)")
        self.genderLabel.text = ("gender : \(gender!)")
        self.phonelabel.text = ("Tele: \(mobile!)")
        
    }
    
    @IBAction func logout(_ sender: Any) {
 
        try? Auth.auth().signOut()
        do {
            UserDefaults.standard.removeObject(forKey: "username")
            UserDefaults.standard.removeObject(forKey: "gender")
            UserDefaults.standard.removeObject(forKey: "mobile")
            UserDefaults.standard.removeObject(forKey: "email")
            let homeVc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Loging") as! LoginAndSignUpVc
            navigationController?.setViewControllers([homeVc], animated: true)
        }catch {
            print("Error happen when log out")
        }
        
    }
    
    
}

extension profileVc:UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        userImage.image = image
        
    }
}
