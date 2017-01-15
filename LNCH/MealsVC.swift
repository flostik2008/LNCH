//
//  MealsVC.swift
//  LNCH
//
//  Created by Evgeny Vlasov on 1/8/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import UIKit
import CoreData


class MealsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, NSFetchedResultsControllerDelegate {

    let widthForScrollMenu: CGFloat = 470
    let cellWidth: CGFloat = 160
    let cellHeight: CGFloat = 160
    
    let meals = [Meal]()
    
    var blockOperations: [BlockOperation] = []
    
    var controller: NSFetchedResultsController<Meal>!
    
    
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
        
        generateData()
        attemptFetch()
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionCell
            configureCell(cell: cell, indexPath: indexPath)
            return cell
    }
    
    func configureCell (cell: CollectionCell, indexPath: IndexPath) {
        
        let meal = controller.object(at: indexPath)
        cell.configureCell(meal: meal)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let sections = controller.sections {
            let sectionInfo = sections[section]
          return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let numberOfItems = self.collectionView(self.collectionView, numberOfItemsInSection: 0)
        
        if (indexPath.row == numberOfItems - 1) {
            UIAlertView(title: "you did it!", message: "Add button was pressed :)", delegate: nil, cancelButtonTitle: "Great!").show()
        }
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
    
    @IBAction func addMealBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "showChooseCategory", sender: nil)
    }
    
    
    func attemptFetch() {
        let fetchRequest: NSFetchRequest<Meal> = Meal.fetchRequest()
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        
        
        /*
         https://code.tutsplus.com/tutorials/core-data-and-swift-relationships-and-more-fetching--cms-25070
         
         let predicate = NSPredicate(format: "%K == %@", "last", "Doe")
         fetchRequest.predicate = predicate
         
         for now, get all the data from Core Data. Letter, figure out where the sorting should take place.
         */
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print("Couldn't fetch data from CoreData with error: \(error.debugDescription)")
        }
        
    }
    
    func  controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        blockOperations.removeAll(keepingCapacity: false)
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        collectionView!.performBatchUpdates({ () -> Void in
            
            for operation: BlockOperation in self.blockOperations {
                operation.start()
            }
        }, completion: { (finished) in
            self.blockOperations.removeAll(keepingCapacity: false)
        })
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                collectionView.insertItems(at: [indexPath])
            }
            break
        case.delete:
            if let indexPath = indexPath {
                collectionView.deleteItems(at: [indexPath])
            }
            break
            
        case.update:
            if let indexPath = indexPath {
                let cell = collectionView.cellForItem(at: indexPath) as! CollectionCell
                configureCell(cell: cell, indexPath: indexPath)
            }
            break
            
        case.move:
            if let indexPath = indexPath {
                collectionView.deleteItems(at: [indexPath])
            }
            if let indexPath = newIndexPath {
                collectionView.insertItems(at: [indexPath])
            }
            
            break
        }
    }
    
    func generateData() {
        let meal = Meal(context: context)
        meal.category = "Breakfast"
        meal.directions = "Flip dat shit"
        meal.ingridients = "Chicken, potato, greens, pees"
        meal.title = "Chicken/ s potato"
        
        let meal2 = Meal(context: context)
        meal2.category = "Lunch"
        meal2.directions = "Flip dat shit"
        meal2.ingridients = "Chicken, potato, greens, pees"
        meal2.title = "Salmon/ rice"
        
        let meal3 = Meal(context: context)
        meal3.category = "Dinner"
        meal3.directions = "Flip dat shit"
        meal3.ingridients = "Chicken, potato, greens, pees"
        meal3.title = "Cod Fish with bruccel sprouts"
    
    }
    
    
    
}









