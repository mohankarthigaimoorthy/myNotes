//
//  coreTableViewCell.swift
//  myNote
//
//  Created by Mohan K on 20/03/23.
//

import Foundation
import UIKit
import CoreData


class coreTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var pinButton: UIButton!
    
    var product : [Product]? = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let newDate = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context) as! Product
        newDate.date = Date()
        do {
            try context.save ()
            
        }
        
        catch {
            print("Error saving date:\(error.localizedDescription)")
        }
        // Initialization code
    }
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
         
    func configure(with prod: Product? ) {
//        let request : NSFetchRequest<Product> = Product.fetchRequest()
//        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
//        do {
//            let dates = try context.fetch(request)
//            if let mostRecentDate = dates.first {
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateStyle = .medium
//                dateFormatter.timeStyle = .none
//                dateLabel.text = dateFormatter.string(from: mostRecentDate.date!)
//            }
//        }
//        catch {
//                print ("Error fetching dates : \(error.localizedDescription)")
//            }
//
//        if prod?.isPinned == true{
//            pinButton.alpha = 1
//            pinButton.setImage(UIImage(systemName: "pin.fil"), for: .normal)
//        }
//
//        else {
//            pinButton.alpha = 0
//            pinButton.setImage(UIImage(systemName: "pin"), for: .normal)
//        }
//
        let isPinned = prod?.isPinned == 1
        let imagename = isPinned ? "pin.fil" : "pin"
        pinButton.alpha = isPinned ? 1 : 0
//        pinButton.setImage(UIImage(systemName: imagename), for: .normal)
        
//
//        if prod!.isEdited == true {
//            dateLabel?.text = formatDate(prod!.creationDate) + " (edited)"
//        }
//        else{
//            dateLabel.text = formatDate(prod?.creationDate!) + ""
//        }
//        contentView.backgroundColor = UIColor(named: prod!.color.backgroundColor)
    }
}
