//
//  myNoteViewController.swift
//  myNote
//
//  Created by Mohan K on 20/03/23.
//

import UIKit
import CoreData
protocol BackgroundColorDelegate {
    func setBackgroundColor(color: Noted?)
}
class myNoteViewController: UIViewController,  UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var colorPaletteBtn: UIButton!
   
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var note = [Noted]()
    var colours = [String]()
    var selectedColor : String?
    var placeholderLabel: UILabel!


    var product: [Product]?
    var delegate: BackgroundColorDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        colours = ["black",
                   "blue",
                   "cyan",
                   "gray",
                   "green",
                   "purple",
                   "red",
                   "systemMint",
                   "systemPink",
                    "white"]
        
        titleTextField.becomeFirstResponder()
        placeholderLabel = UILabel()
        placeholderLabel.text = "Note"
        placeholderLabel.font = .italicSystemFont(ofSize: (contentTextView.font?.pointSize)!)
        placeholderLabel.sizeToFit()
        contentTextView.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (contentTextView.font?.pointSize)! / 2)
        placeholderLabel.textColor = .tertiaryLabel
        placeholderLabel.isHidden = !contentTextView.text.isEmpty
        self.titleTextField.delegate = self
        self.contentTextView.delegate = self
        self.contentTextView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender: )))
        colorCollectionView.isHidden = true
        collectionsetup()
        colorCollectionView.register(noteCollectionViewCell.self, forCellWithReuseIdentifier: "noteCollectionViewCell")
//         Do any additional setup after loading the view.
       
    }
    
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        contentTextView.resignFirstResponder()
        return true
    }
    
    @IBAction func submit(_ sender: Any) {
    
        let newProduct = Product(context: context)
        
        let date = Date()
        let dateFormatter = DateFormatter()
        let dateString = dateFormatter.string(from: date)
        
        newProduct.title = titleTextField.text
        newProduct.content = contentTextView.text
        newProduct.dateString = dateString
        newProduct.isPinned = 0
        newProduct.id = 0
        do {
            try context.save()
        }
        catch{
            print("error saving context : \(error)")
        }
      
    }
    
    @IBAction func colorButton(_ sender: Any) {
        
        UIView.transition(with:colorCollectionView, duration: 0.5, options: .curveEaseIn) {
           
            self.colorCollectionView.isHidden = !self.colorCollectionView.isHidden
            self.colorCollectionView.layoutIfNeeded()
        }
        
    }
    
    @IBAction func titleTextField(_ sender: Any) {
  
    }
    
    
    func collectionsetup() {
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.colorCollectionView.reloadData()
        }
    }
   

}

extension myNoteViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return colours.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell  = colorCollectionView.dequeueReusableCell(withReuseIdentifier: "noteCollectionViewCell", for: indexPath) as! noteCollectionViewCell
        cell.contentView.backgroundColor = UIColor(named: colours[indexPath.row])
        cell.contentView.clipsToBounds = true
        cell.contentView.layer.cornerRadius = 25
        cell.contentView.layoutIfNeeded()
        return cell

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        return CGSize(width: 50, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let color = colours[indexPath.row]
        selectedColor = color
        self.view.backgroundColor =  UIColor(named: color)
        titleTextField.textColor =  UIColor(named: color)
        contentTextView.textColor = UIColor(named: color)
        
        if color == "red" {
            titleTextField.textColor = .white
            contentTextView.textColor = .white
            self.view.backgroundColor =  UIColor(named: "red")
        }
        else if color == "gray" {
            titleTextField.textColor = .black
            contentTextView.textColor = .black
            self.view.backgroundColor =  UIColor(named: "gray")
        }

        else if color == "green" {
            titleTextField.textColor = .white
            contentTextView.textColor = .white
            self.view.backgroundColor =  UIColor(named: "green")
        }
        else if color == "cyan" {
            titleTextField.textColor = .black
            contentTextView.textColor = .black
            self.view.backgroundColor =  UIColor(named: "cyan")
        }
        else if color == "blue" {
            titleTextField.textColor = .white
            contentTextView.textColor = .white
            self.view.backgroundColor =  UIColor(named: "blue")
        }
        else if color == "black" {
            titleTextField.textColor = .white
            contentTextView.textColor = .white
            self.view.backgroundColor =  UIColor(named: "black")
        }
        else if color == "white" {
            titleTextField.textColor = .black
            contentTextView.textColor = .black
            self.view.backgroundColor =  UIColor(named: "white")
        }
        else if color == "black" {
            titleTextField.textColor = .white
            contentTextView.textColor = .white
            self.view.backgroundColor =  UIColor(named: "black")
        }

        else if color == "purple" {
            titleTextField.textColor = .white
            contentTextView.textColor = .white
            self.view.backgroundColor =  UIColor(named: "purple")
        }
        else if color == "systemMint" {
            titleTextField.textColor = .white
            contentTextView.textColor = .white
            self.view.backgroundColor =  UIColor(named: "systemMint")
        }
        else {
            self.view.backgroundColor =  UIColor(named: color)
        }
       
        if let index = note.firstIndex(where: {$0.id == 1 })
        {
            note[index].colors = UIColor(named: selectedColor!)!
            delegate?.setBackgroundColor(color: note[index])
        }
    }
   
   
}

extension myNoteViewController : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel?.isHidden = !contentTextView.text.isEmpty
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        placeholderLabel?.isHidden = !contentTextView.text.isEmpty
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel?.isHidden = true
    }
}

extension UITextView {
    func addDoneButton(title: String, target: Any, selector: Selector) {
        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: UIScreen.main.bounds.size.width, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)
        toolBar.setItems([flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
    }
}
