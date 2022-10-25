//
//  ViewController.swift
//  ShipExApp
//
//  Created by Ibrahim Diab on 10/10/2022.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class LoginAndSignUpVc: UIViewController {
    
    // Mark : Outlet Decleration
    @IBOutlet weak var basicViewForStack: UIView!
    @IBOutlet weak var mobileTxtField: UITextField!
    @IBOutlet weak var swapLabel: UILabel!
    @IBOutlet weak var swapBtn: UIButton!
    @IBOutlet weak var mobileContainer: UIView!
    @IBOutlet weak var usernameContainer: UIView!
    @IBOutlet weak var genderTxtField: UITextField!
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var emailContainer: UIView!
    @IBOutlet weak var takeActionBtn: UIButton!
    @IBOutlet weak var genderContainer: UIView!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var passwordContainer: UIView!
    @IBOutlet weak var emailTxtField: UITextField!
    
    // Mark : variable Intialization
    var data = ""
    let genderArray = ["Male","Female"]
    let mypicker = UIPickerView()
    var ref: DatabaseReference!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Mark : Set Up View
        setUpView()
        
    }
    
    
    
    @IBAction func takeActionBtn(_ sender: Any) {
        if takeActionBtn.titleLabel?.text == "Log in"
        {
            guard let email = emailTxtField.text ,email != "", let password = passwordTxtField.text , password != ""  else {
                self.addAlert(title: "Error", msg: "Complete data", action: UIAlertAction(title: "Ok", style: .cancel))
                return
            }
            let username = usernameTxtField.text!
            
            FirebaseConfig.sahredInstance.logIn(email: email, password: password, ViewController: self, username: username)
            
            
        }
        else if takeActionBtn.titleLabel?.text == "Sign Up"
        {
            guard let email = emailTxtField.text ,email != "", let password = passwordTxtField.text , password != "",let mobile = mobileTxtField.text,mobile != "",let username = usernameTxtField.text , username != "", let gender = genderTxtField.text , gender != ""  else {
                self.addAlert(title: "Error", msg: "Complete data", action: UIAlertAction(title: "Ok", style: .cancel))
                return
            }
            self.addAlert(title: "Success Register", msg: "LogIn Now", action: UIAlertAction(title: "Ok", style: .cancel))
            FirebaseConfig.sahredInstance.signUp(email: email, password: password, username: username, mobile: mobile, gender: gender)
            
        }
        
        
    }
    
    @IBAction func swapBtn(_ sender: Any) {
        
        
        
        if swapBtn.titleLabel?.text == "Log in"
        {
            
            swapBtn.setTitle("Sign Up", for: .normal)
            usernameContainer.isHidden = true
            mobileContainer.isHidden = true
            genderContainer.isHidden = true
            takeActionBtn.setTitle("Log in", for: .normal)
            swapLabel.text = "Dont have an account ? 👉 "
            
            
        }
        else if swapBtn.titleLabel?.text == "Sign Up"
        {
            swapBtn.setTitle("Log in", for: .normal)
            usernameContainer.isHidden = false
            mobileContainer.isHidden = false
            genderContainer.isHidden = false
            takeActionBtn.setTitle("Sign Up", for: .normal)
            swapLabel.text = "Alreedy ,Have An account 👉 "
            
        }
    }

    func setmypickerView(textfield:UITextField,mypicker:UIPickerView) {
        
        mypicker.delegate = self
        mypicker.dataSource = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Choose", style: .plain, target: self, action: #selector(self.done))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        textfield.inputView = mypicker
        textfield.inputAccessoryView = toolBar
        textfield.tintColor = UIColor.clear
        
        
        
    }
    @objc func done()
    {
        data = genderArray[mypicker.selectedRow(inComponent: 0)]
        genderTxtField.text = data
        self.view.endEditing(true)
        
    }
    
    
    
    func setUpView()
    {
        setmypickerView(textfield: genderTxtField, mypicker: mypicker)
        // Mark : add bottom Line
        self.addbottomLine(myTextField: usernameTxtField)
        self.addbottomLine(myTextField: emailTxtField)
        self.addbottomLine(myTextField: passwordTxtField)
        self.addbottomLine(myTextField: mobileTxtField)
        self.addbottomLine(myTextField: genderTxtField)
        // Mark : add Corner radious
        self.addCornerRadiousView(value: 10, view: takeActionBtn)
        self.addCornerRadiousView(value: 10, view: basicViewForStack)
        self.addCornerRadiousView(value: 10, view: swapBtn)
        // Mark : intialValue
        
        swapLabel.text = "Alreedy ,Have An account ? 👉 "
        swapBtn.setTitle("Log in", for: .normal)
        takeActionBtn.setTitle("Sign Up", for: .normal)
        
        
    }
    
}



extension LoginAndSignUpVc:UIPickerViewDelegate,UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderArray[row]
    }
    
    
}

