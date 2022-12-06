//
//  AddNewBookViewController.swift
//  HomeLibApp
//
//  Created by Ma Millerr on 27.10.2022.
//

import UIKit

class AddNewBookViewController: UIViewController {
    
    var book: Book!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var authorTF: UITextField!
    @IBOutlet weak var genreTF: UITextField!
    @IBOutlet weak var translatorTF: UITextField!
    @IBOutlet weak var statusTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var pubHouseTF: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButtonState()

        
    }
    
    private func saveButtonState() {
        let nameTF = nameTF.text ?? ""
        let authorTF = authorTF.text ?? ""
        
        saveButton.isEnabled = !nameTF.isEmpty && !authorTF.isEmpty


    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        saveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveSegue" else { return }
        book = Book(value: [nameTF.text, authorTF.text, genreTF.text,  translatorTF.text, statusTF.text, pubHouseTF.text, locationTF.text, "Заглушка",  false])
        
    }

}
