//
//  FirebaseCongfig.swift
//  ShipExApp
//
//  Created by Ibrahim Diab on 23/10/2022.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase
class FirebaseConfig
{
    static let sahredInstance = FirebaseConfig()
    
    
    
    
  
    func signUp(email:String,password:String,username:String,mobile:String,gender:String)
    {
        
        Auth.auth().createUser(withEmail: email, password: password) { UserData, error in
            if let error = error
            {
                print(error.localizedDescription)
            }
            let userid = UserData!.user.uid
            let email = UserData?.user.email
            self.saveDatainFierbase(username:username , mobile: mobile, gender: gender, userId: userid,email:email!)
            
            
            
        }
        
    }
    
    func logIn(email:String,password:String,ViewController:UIViewController,username:String)
    {
        Auth.auth().signIn(withEmail: email, password: password) { [self] UserData, error in
            if let error = error
            {
                ViewController.addAlert(title: "Error", msg: error.localizedDescription, action: UIAlertAction(title: "Ok", style: .cancel))
            }
            let tabbar = TabbarController()
            ViewController.navigationController?.setViewControllers([tabbar], animated: true)
            
            self.fetchDataFromFirebase(userId: UserData!.user.uid)
            
          
            
        }
    }
    
    func fetchDataFromFirebase(userId:String)
        {
          
            Database.database().reference().child("Users").child(userId).observe(.value, with: { snapshots in
              let snapshot = snapshots.value as? NSDictionary
                
                
                UserDefaults.standard.set(snapshot?["username"] as? String, forKey: "username")
                UserDefaults.standard.set( snapshot?["email"] as? String, forKey: "email")
                UserDefaults.standard.set(snapshot?["gender"] as? String, forKey: "gender")
                UserDefaults.standard.set(snapshot?["mobile"] as? String, forKey: "mobile")
               
            })

        }
        
        
    
    
    func saveDatainFierbase(username:String,mobile:String,gender:String,userId:String,email:String)
    {
        var ref:DatabaseReference!
        ref = Database.database().reference()
        
        let userDaraArray:[String:Any] = ["username":username
                                          ,"mobile":mobile,
                                          "gender":gender,
                                          "email":email]
        ref.child("Users").child(userId).setValue(userDaraArray) {
            (error:Error?, ref:DatabaseReference) in
            if let error = error {
                print("Data could not be saved: \(error).")
            } else {
                print("Data saved successfully!")
            }
        }
        
        
        
    }
    
}
