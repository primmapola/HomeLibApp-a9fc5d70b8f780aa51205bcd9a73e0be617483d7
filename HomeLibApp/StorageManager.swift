//
//  StorageManager.swift
//  HomeLibApp
//
//  Created by Grigory Don on 21.11.2022.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
//    private let fileURL = URL.documentsDirectory.appending(path: "Contact").appendingPathExtension("plist")
    
    let bookKey = "bookKey"
    
    private init() {
//        print(fileURL)
    }
    
    func save(book: Book) {
        var books = fetchBooks()
        books.append(book)
        guard let data = try? JSONEncoder().encode(books) else { return }
        UserDefaults.standard.set(data, forKey: bookKey)
    }
    
    func fetchBooks() -> [Book] {
        guard let data = UserDefaults.standard.data(forKey: bookKey) else { return[] }
        guard let books = try? JSONDecoder().decode([Book].self, from: data) else { return [] }
        return books
    }
    
    func deleteContact(at index: Int) {
        var books = fetchBooks()
        books.remove(at: index)
        guard let data = try? JSONEncoder().encode(books) else { return }
        UserDefaults.standard.set(data, forKey: bookKey)
    }
}
