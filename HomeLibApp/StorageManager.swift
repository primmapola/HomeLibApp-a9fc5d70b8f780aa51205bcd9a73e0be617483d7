//
//  StorageManager.swift
//  HomeLibApp
//
//  Created by Grigory Don on 21.11.2022.
//

import Foundation
import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    var realm = try! Realm()
   
    private init() {}
    
    func save(_ books: [Book]) {
        try! realm.write {
            realm.add(books)
        }
    }
    
    func delete(_ book: Book) {
        try! realm.write {
            realm.delete(book)
        }
    }
    
    func edit(_ book: Book, newValue: Bool) {
        try! realm.write {
            book.isFavourite = newValue
        }
    }

}
