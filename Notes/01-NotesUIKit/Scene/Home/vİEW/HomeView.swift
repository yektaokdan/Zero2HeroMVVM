//
//  ViewController.swift
//  01-NotesUIKit
//
//  Created by yekta on 4.03.2024.
//

import UIKit

class HomeView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var viewModel = HomeViewModel()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItem))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.notesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let note = viewModel.noteAtIndex(indexPath.row)
        var content = cell.defaultContentConfiguration()
        content.text = note.title
        content.secondaryText = note.content
        cell.contentConfiguration = content
        return cell
    }
    
    @objc func addNewItem(){
        addNoteWithAlert(title: "Test", message: "tST")
    }
    
    func addNoteWithAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let okButton = UIAlertAction(title: "OK", style: .default) { [self, weak alert] _ in
            
            let titleTextField = alert?.textFields?[0]
            let contentTextField = alert?.textFields?[1]
            
            if let title = titleTextField?.text, let content = contentTextField?.text {
                
                viewModel.addNote(Notes(title: titleTextField?.text ?? "Empty", content: contentTextField?.text ?? "Empty"))
                tableView.reloadData()
            }
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        alert.addTextField { (textField) in
            textField.placeholder = "Note title"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Note content"
        }
        self.present(alert, animated: true, completion: nil)
        
    }
}

