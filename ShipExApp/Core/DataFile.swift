//
//  DataFile.swift
//  ShipExApp
//
//  Created by Ibrahim Diab on 12/10/2022.
//

import Foundation


class DataFile {
    
   public static let shared = DataFile()
    
    func getImageSlider() -> [String]
    {
        return ["mobileback","clothes","watche","shoes"]
        
    }
    
}


