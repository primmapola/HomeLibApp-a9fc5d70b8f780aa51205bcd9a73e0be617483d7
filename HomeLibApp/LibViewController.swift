//
//  LibViewController.swift
//  HomeLibApp
//
//  Created by Ma Millerr on 24.10.2022.
//

import UIKit
import RealmSwift

class LibViewController: UITableViewController {
    
    private var realm = try! Realm()
    private var books: Results<Book>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        createTempData()
        books = realm.objects(Book.self)
        print(books ?? 0)
        print(books.count)
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRecognizer.direction = .down
        view.addGestureRecognizer(swipeRecognizer)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        self.tableView.reloadData()
        print("a")
    }
    
    @objc func addButtonTapped() {
        
        
        let contactOption = AddBookTableViewController()
        navigationController?.pushViewController(contactOption, animated: true)
    }
    
    private func createTempData() {
        if !UserDefaults.standard.bool(forKey: "done") {
            DataManager.shared.createTempData { [unowned self] in
                UserDefaults.standard.set(true, forKey: "done")
                tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "book", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let book = books[indexPath.row]
        
        content.text = book.name
        content.secondaryText = book.author
        
        if let bookImage = UIImage(named: book.name) {
            content.image = bookImage
        } else {
            content.image = UIImage(named: "Заглушка")
        }
        
        
        cell.contentConfiguration = content
        
        
        return cell
    }
    
    //    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
    //        false
    //    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let book = books[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            
            StorageManager.shared.delete(book)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            self.tableView.reloadData()
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let book = books[indexPath.row]
        let favouriteAction = UIContextualAction(style: .normal, title: "Favourite") {_, _, _ in
            
            DispatchQueue.main.async {
                StorageManager.shared.edit(book, newValue: !book.isFavourite)
            }
            
            tableView.reloadData()
        }
        
        favouriteAction.backgroundColor = .yellow
        favouriteAction.image = book.isFavourite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        
        return UISwipeActionsConfiguration(actions: [favouriteAction])
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bookInfoVC = segue.destination as? BookInfoViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        bookInfoVC.book = books[indexPath.row]
    }
    
//    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
//        guard segue.identifier == "saveSegue" else { return }
//        guard let addVC = segue.source as? AddNewBookViewController else { return }
//        let newBook = addVC.book
//        
//        let indexPath = IndexPath(row: books.count, section: 0)
//        
////        StorageManager.shared.save([newBook!])
//        tableView.insertRows(at: [indexPath], with: .fade)
//        
//    }
//    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
