//
//  HomeTableViewCell.swift
//  ShipExApp
//
//  Created by Ibrahim Diab on 11/10/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellCollectionView: UICollectionView!
    
    // Mark : <#Summary#>
    
    var numberOfSection:Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
        // Initialization code
    }
    
    
    
    func setUpView()
    {
        cellCollectionView.delegate = self
        cellCollectionView.dataSource = self
        cellCollectionView.register(UINib(nibName: "TableCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TableCollectionViewCell")
        
    }
    
}


extension HomeTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TableCollectionViewCell", for: indexPath) as! TableCollectionViewCell
        if numberOfSection == 0
        {
            cell.porductPrice.text = "100"
        }
        else  if numberOfSection == 1
        {
            cell.porductPrice.text = "200"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height-20)
    }
    
}
