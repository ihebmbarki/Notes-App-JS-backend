//
//  ViewController.swift
//  Note-App
//
//  Created by iheb mbarki on 18/8/2022.
//

import UIKit


protocol DataDelegate {
    func updateArray(newArray: String)
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //var
    var notesArray = [Note]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! AddNoteViewController
        
        if segue.identifier == "updateNoteSegue" {
            vc.note = notesArray[notesTableView.indexPathForSelectedRow!.row]
            vc.update = true
            
        }
    }
    
    
    
    //widgets
    @IBOutlet weak var notesTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)
        cell.textLabel?.text = notesArray[indexPath.row].title
        return cell
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        APIFunctions.functions.fetchNotes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        APIFunctions.functions.fetchNotes()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchNotes()
        
        notesTableView.delegate = self
        notesTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
}

extension ViewController: DataDelegate {
    
    func updateArray(newArray: String) {
        
        let decoder = JSONDecoder()
        do {
            let notesArray = try decoder.decode([Note].self, from: newArray.data(using: .utf8)!)
             print("Notes :", notesArray)
            
            } catch {
             print(error)
         }
        
        self.notesTableView?.reloadData()
    }
    
    
}
