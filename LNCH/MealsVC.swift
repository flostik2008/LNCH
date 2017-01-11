//
//  MealsVC.swift
//  LNCH
//
//  Created by Evgeny Vlasov on 1/8/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import UIKit

class MealsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let widthForScrollMenu: CGFloat = 420
    let cellWidth: CGFloat = 160
    let cellHeight: CGFloat = 160
    
    let meals = [Meal]()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        scrollView.contentSize = CGSize(width: widthForScrollMenu, height: scrollView.frame.size.height)
        
        let flow = UICollectionViewFlowLayout()
        flow.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flow.scrollDirection = UICollectionViewScrollDirection.vertical
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 0
        collectionView.collectionViewLayout = flow
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals.count 
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    @IBAction func allMealsBtn(_ sender: Any) {
    }
    @IBAction func breakfastMealsBtn(_ sender: Any) {
    }
    @IBAction func lunchBtn(_ sender: Any) {
    }
    @IBAction func dinnerBtn(_ sender: Any) {
    }
    @IBAction func desertBtn(_ sender: Any) {
    }
    
    @IBAction func snackBtn(_ sender: Any) {
    }
    
    @IBAction func addNewMeal(_ sender: Any) {
        
        // creation of the new meal. 
        
    }
    
}









