//
//  NewTaskVC.swift
//  ToDoList
//
//  Created by Omer Keskin on 20.05.2024.
//

import UIKit

class NewTaskVC: UIViewController, UITextViewDelegate {

    let placeholderLabel = UILabel()
    @IBOutlet weak var headerTF: UITextView!
    @IBOutlet weak var detailTF: UITextView!
    
    
    var newTaskVM = NewTaskVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveData))
        self.navigationItem.rightBarButtonItem = saveButton
        
        

        headerTF.delegate = self
        detailTF.delegate = self
        
        placeholderLabel.text = "New Task"
        placeholderLabel.font = UIFont.systemFont(ofSize: 27)
        placeholderLabel.sizeToFit()
        placeholderLabel.frame.origin = CGPoint(x: 9, y: (headerTF.font?.pointSize ?? 25) / 2)
        placeholderLabel.textColor = .lightGray
        placeholderLabel.isHidden = !headerTF.text.isEmpty
        headerTF.addSubview(placeholderLabel)
    }
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    

    
    
   @objc func saveData() {
        
       if let header = headerTF.text, let task = detailTF.text{
           newTaskVM.saveTask(header: header, task: task)
           
           let alert = UIAlertController(title: "Saved", message: "Task has been saved", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
              self.navigationController?.popViewController(animated: true)
          }))
           present(alert, animated: true, completion: nil)
       }
       

       
    }

 
}
