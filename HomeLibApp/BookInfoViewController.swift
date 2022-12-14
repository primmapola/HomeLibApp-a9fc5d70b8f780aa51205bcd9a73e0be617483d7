//
//  BookInfoViewController.swift
//  HomeLibApp
//
//  Created by Ma Millerr on 24.10.2022.
//

import UIKit

class BookInfoViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var pubHouseLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var book: Book!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorLabel.text = book.author
        pubHouseLabel.text = book.pubHouse
        genreLabel.text = book.genre
        statusLabel.text = book.status
        
        if let bookImage = UIImage(named: book.name) {
            image.image = bookImage
        } else {
            image.image = UIImage(named: "Заглушка")
        }
        
        titleLabel.text = book.name
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonTapped))
    }
    
    @objc func editButtonTapped() {
        let contactOption = EditTableViewController()
        navigationController?.pushViewController(contactOption, animated: true)
        
        contactOption.bookModel = book
    }
    
}
