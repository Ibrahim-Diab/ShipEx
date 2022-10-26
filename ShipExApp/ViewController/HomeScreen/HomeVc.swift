//
//  HomeVc.swift
//  ShipExApp
//
//  Created by Ibrahim Diab on 11/10/2022.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class HomeVc: UIViewController {
    // Mark : Outlet
    
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    var timer:Timer?
    var currentIndex = 0
    var tableViewSection:Int?
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      setUpView()
    }
    
    
    func setUpView()
    {
        
     
     
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.register(UINib(nibName: "SliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SliderCollectionViewCell")
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(sliderImages), userInfo: nil, repeats: true)
        pageControl.numberOfPages = DataFile.shared.getImageSlider().count
        
    }
    
    @objc func sliderImages()
    {
        
        if currentIndex < DataFile.shared.getImageSlider().count-1
        {
            currentIndex  = currentIndex + 1
        }
        else {
            currentIndex = 0
        }
    
        
        
        sliderCollectionView.scrollToItem(at: IndexPath(row: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentIndex
        
    }
    
    

    
    
}
extension HomeVc:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.numberOfSection = indexPath.section
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let label = UILabel()
        label.frame = CGRect.init(x: 10, y: 0, width: headerView.frame.width-10, height: headerView.frame.height-10)
        headerView.addSubview(label)
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        headerView.backgroundColor = #colorLiteral(red: 0.5960784314, green: 0.6588235294, blue: 0.9725490196, alpha: 1)
        
        
        
        
        let button = UIButton(frame: CGRect(x: 10, y: 0, width: headerView.frame.width-10, height: headerView.frame.height-10))
        headerView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.textColor = .white
        button.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10).isActive = true
        button.setTitle("See All 👉 ", for: .normal)
        button.addTarget(self, action: #selector(showAll), for: .touchUpInside)
        
        
        
        if section == 0
        {
            label.text = "Clothes"
            tableViewSection = 1
            
            
        }
        else if section == 1
        {
            label.text = "Perfume"
            tableViewSection = 2
            
            
            
        }
        else if section == 2
        {
            label.text = "Devices"
            tableViewSection = 3
            
            
        }

       
        
        return headerView
    }
    @objc func showAll()
    {
        switch tableViewSection
        {
        case 1:
             print("onr")
            print("Ahmed")
        case 2 :
  	           print("Two")
        case 3 :
              print("Three")
            
        case .none:
            print("nonr")
        case .some(_):
            print("some")
        }
    }
    
    
    
}
extension HomeVc:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataFile.shared.getImageSlider().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as! SliderCollectionViewCell
        cell.imageView.image = UIImage(named:  DataFile.shared.getImageSlider()[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
