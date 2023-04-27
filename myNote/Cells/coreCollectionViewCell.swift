//
//  coreCollectionViewCell.swift
//  myNote
//
//  Created by Mohan K on 20/03/23.
//

import Foundation
import UIKit
import CoreData

class coreCollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var bodytext: UILabel!
    @IBOutlet weak var noteDateLabel: UILabel!
    @IBOutlet weak var tapPinBtn: UIButton!
    
    var product : [Product]? 
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
     override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
         let newDate = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context) as! Product
         newDate.date = Date()
         do {
             try context.save()
         }
         catch {
             print("Error saving date:\(error.localizedDescription)")
         }
     }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
  
    func configure(with prod: Product? ) {
//        let request : NSFetchRequest<Product> = Product.fetchRequest()
////        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
//        do {
//            let dates = try context.fetch(request)
//            print("count : \(dates.count)")
//            if let mostRecentDate = dates.first {
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateStyle = .medium
//                dateFormatter.timeStyle = .none
//                noteDateLabel?.text = mostRecentDate.dateString
//            }
//        }
//        catch {
//                print ("Error fetching dates : \(error.localizedDescription)")
//            }
        
//        let request : NSFetchRequest<Product> = Product.fetchRequest()
//        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
//        do {
//            let dates = try context.fetch(request)
//            if let mostRecentDate = dates.first {
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateStyle = .medium
//                dateFormatter.timeStyle = .none
//                noteDateLabel.text = dateFormatter.string(from: mostRecentDate.date!)
//            }
//        }
//        catch {
//                print ("Error fetching dates : \(error.localizedDescription)")
//            }
        let isPinned = prod?.isPinned == 1
        let imagename = isPinned ? "pin.fil" : "pin"
            tapPinBtn.alpha = isPinned ? 1 : 0
            tapPinBtn.setImage(UIImage(systemName: imagename), for: .normal)
    }
    
    
    @IBAction func pinnedBtn(_ sender: Any) {
    }
}
