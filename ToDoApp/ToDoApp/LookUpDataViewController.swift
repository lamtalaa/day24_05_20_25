//
//  LookUpDataViewController.swift
//  ToDoApp
//
//  Created by Yassine Lamtalaa on 5/19/25.
//

import UIKit
import FirebaseAnalytics

class LookUpDataViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var notes: [Notes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Analytics.logEvent(AnalyticsEventScreenView,
                               parameters: [AnalyticsParameterScreenName: "LookUpScreen",
                                            AnalyticsParameterScreenClass: "LookUpDataViewController"])
        tableView.dataSource = self
        readNotes()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? LookUpDataTableViewCell
        cell?.lookUpDataLabel.text = note.note
        return cell ?? UITableViewCell()
    }
    
    func readNotes() {
        
        let fetchRequest = Notes.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
            fetchRequest.sortDescriptors = [sortDescriptor]
        
        let moc = CoreDataManager.shared.persistentContainer.viewContext

        do {
            let notes = try moc.fetch(fetchRequest)
            self.notes = notes
            tableView.reloadData()
            
            Analytics.logEvent("notes_displayed", parameters: [
                "notes_count": notes.count
            ])
        } catch {
            print("Failed to fetch notes: \(error)")
        }
    }
}
