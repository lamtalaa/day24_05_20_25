//
//  EnterDataViewController.swift
//  ToDoApp
//
//  Created by Yassine Lamtalaa on 5/19/25.
//

import UIKit
import FirebaseAnalytics

class EnterDataViewController: UIViewController {

    @IBOutlet weak var enterDataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        saveNotes()
        
        Analytics.logEvent("note_submitted", parameters: [
            "note_length": enterDataTextField.text?.count ?? 0
            ])
        
        enterDataTextField.text = ""
    }
    
    func saveNotes() {
       
        let moc = CoreDataManager.shared.persistentContainer.viewContext
        
        let note = Notes(context: moc)
        note.id = UUID()
        note.date = Date()
        note.note = enterDataTextField.text
        
        CoreDataManager.shared.saveContext()
    }
}
