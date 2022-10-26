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
// c -p - w -d

extension HomeTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if numberOfSection == 0
        {
            return DataFile.shared.getclothes().count
        }
        else  if numberOfSection == 1
        {
            return DataFile.shared.getPerfume().count
        }
        
         else  if numberOfSection == 2
        {
             return DataFile.shared.getdevices().count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TableCollectionViewCell", for: indexPath) as! TableCollectionViewCell
        if numberOfSection == 0
        {
            cell.porductPrice.text = "105 L.E"
            let image = UIImage(named: DataFile.shared.getclothes()[indexPath.row])
            cell.imageViewProduct.image = image
        }
        else  if numberOfSection == 1
        {
            cell.porductPrice.text = " 96 L.E"
            let image = UIImage(named: DataFile.shared.getPerfume()[indexPath.row])
            cell.imageViewProduct.image = image
        }
        
         else  if numberOfSection == 2
        {
            cell.porductPrice.text = "95 L.E"
            let image = UIImage(named: DataFile.shared.getdevices()[indexPath.row])
            cell.imageViewProduct.image = image
        }
        
       
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height-20)
    }
    
}
