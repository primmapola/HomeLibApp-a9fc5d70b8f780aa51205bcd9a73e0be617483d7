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
    
    func delete(_ book: Book) {
        write {
            realm.delete(book)
        }
    }
    
    func delete2(_ book: WRBook) {
        write {
            realm.delete(book)
        }
    }
    
    func edit(_ book: Book, newValue: Bool) {
        write {
            book.isFavourite = newValue
        }
    }
    
    func save(_ book: Book) {
         try! realm.write {
                realm.add(book)
            }
        }
    
    func save2(_ book: WRBook) {
        try! realm.write {
               realm.add(book)
        }
    }
    
    func edit( book: Book, newValueName: String, newValueAuthor: String, newValueGenre: String, newValuePubhouse: String, newValueTranslator: String, newValueStatus: String, newValueLocation: String, newValueImage: String) {
        try! realm.write {
            book.name = newValueName
            book.author = newValueAuthor
            book.genre = newValueGenre
            book.status = newValueStatus
            book.location = newValueLocation
            book.pubHouse = newValuePubhouse
            book.image = newValueImage
            book.translator = newValueTranslator
        }
    }
    
    private func write(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch {
            print(error)
        }
    }

}
