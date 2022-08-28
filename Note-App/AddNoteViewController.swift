//
//  AddNoteViewController.swift
//  Note-App
//
//  Created by iheb mbarki on 19/8/2022.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    
    //MARK: - Initialization
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    var note: Note?
    var update = false
    
    //MARK: - UI Buttons
    
    @IBAction func deleteClick(_ sender: Any) {
        
    }
    
    @IBAction func saveClick(_ sender: Any) {
        
        if update == true  {
            
            APIFunctions.functions.updateNote(title: titleTextField.text!, date: "placeholder", note: bodyTextField.text,
                                              id: note!._id)
            
        } else {
            
            APIFunctions.functions.addNote(title: titleTextField.text!, date: "placeholder", note: bodyTextField.text)
        }
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    //MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        if update == false {
            self.deleteButton.isEnabled = false
            self.deleteButton.title = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if update == true {
            titleTextField.text = note!.title
            bodyTextField.text = note!.note
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
}
