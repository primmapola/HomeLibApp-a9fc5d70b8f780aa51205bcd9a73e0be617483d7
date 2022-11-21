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
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
