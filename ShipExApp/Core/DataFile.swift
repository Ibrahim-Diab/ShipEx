//
//  DataFile.swift
//  ShipExApp
//
//  Created by Ibrahim Diab on 12/10/2022.
//

import Foundation


class DataFile {
    
    var clothes = Array(1...5).map{"clothes\($0)"}
    var device = Array(1...4).map{"device\($0)"}
    var banner = Array(1...6).map{"banner\($0)"}
    var perfume = Array(1...5).map{"perfume\($0)"}
   public static let shared = DataFile()
    
    func getImageSlider() -> [String]
    {
        
        return banner
        
    }
    func getPerfume() -> [String]
    {
        
        return perfume
        
    }
    
    func getdevices() -> [String]
    {
        
        return device
        
    }
    
    func getclothes() -> [String]
    {
        
        return clothes
        
    }
    
    
}


