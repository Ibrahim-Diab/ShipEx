//
//  Extension.swift
//  ShipExApp
//
//  Created by Ibrahim Diab on 10/10/2022.
//

import Foundation
import UIKit

extension UIViewController
{
    func addbottomLine (myTextField:UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: myTextField.frame.height - 1, width: myTextField.frame.width, height: 0.5)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        myTextField.borderStyle = UITextField.BorderStyle.none
        myTextField.layer.masksToBounds = true
        myTextField.layer.addSublayer(bottomLine)
    }
    func addCornerRadiousView(value:CGFloat,view:UIView)
    {
        view.layer.cornerRadius = value
        view.clipsToBounds = true
    }

    func addShadow(myImage:UIImageView)
    {
        myImage.layer.shadowColor = UIColor.black.cgColor
        myImage.layer.shadowOpacity = 1
        myImage.layer.shadowOffset = CGSize.zero
        myImage.layer.shadowRadius = 5
        
    }
    
    func addAlert(title:String,msg:String,action:UIAlertAction)
    {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
}
