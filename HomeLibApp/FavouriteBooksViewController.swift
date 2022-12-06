//
//  FavouriteBooksViewController.swift
//  HomeLibApp
//
//  Created by Grigory Don on 06.12.2022.
//

import UIKit
import RealmSwift

class FavouriteBooksViewController: UITableViewController {
    
    var books: Results<Book>!
    var favouriteBooks: Results<Book>!
    
    var numOfFavourite = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        books = StorageManager.shared.realm.objects(Book.self)
        
//        self.numOfFavourite = 0
        for book in books {
            if book.isFavourite {
                numOfFavourite += 1
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numOfFavourite
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteBook", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let book = books[indexPath.row]
        
        if book.isFavourite {
            content.text = book.name
            content.secondaryText = book.author
            
            if let bookImage = UIImage(named: book.name) {
                content.image = bookImage
            } else {
                content.image = UIImage(named: "Заглушка")
            }
            
            
            cell.contentConfiguration = content
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let book = books[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            
            DispatchQueue.main.async {
                StorageManager.shared.delete(book)
            }
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let book = books[indexPath.row]
        let favouriteAction = UIContextualAction(style: .destructive, title: "Favourite") {_, _, _ in
            
            self.numOfFavourite -= 1
            
            DispatchQueue.main.async {
                StorageManager.shared.edit(book, newValue: !book.isFavourite)
            }
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
        
        favouriteAction.backgroundColor = .green
        favouriteAction.image = book.isFavourite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")

        return UISwipeActionsConfiguration(actions: [favouriteAction])
    }

    // MARK: - Navigation


    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
