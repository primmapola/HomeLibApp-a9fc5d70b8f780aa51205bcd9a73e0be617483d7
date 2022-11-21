//
//  Books.swift
//  HomeLibApp
//
//  Created by Ma Millerr on 24.10.2022.
//

import Foundation

struct Book {
    var name: String
    var author: String
    let genre: String
    let language: String
    let pubHouse: String
    let translator: String
    let status: String
    let location: String
    let image: String
    
    var description: String {
        """
        \(name)
        \(author)
        \(genre)
        \(language)
        \(pubHouse)
        \(translator)
        \(status)
        \(location)

        """
    }
    
    static func getBook() -> [Book] {
        [
            Book(name: "Анна Каренина", author: "Лев Николаевич Толстой", genre: "Classics", language: "Русский", pubHouse: "The Planet", translator: "none", status: "В процессе чтения", location: "3-я полка сверху", image: "Анна Каренина"),
            Book(name: "Доктор Живаго", author: "Борис Леонидочив Пастернак", genre: "Political fiction", language: "Русский", pubHouse: "ОЛМА Медиа Групп", translator: "none", status: "Прочитано", location: "7-я полка снизу", image: "Доктор Живаго"),
            Book(name: "Война и мир", author: "Лев Николаевич Толстой", genre: "Napolionic Wars", language: "Русский", pubHouse: "Tip. T. Ris", translator: "Е.К. Пугачев", status: "Не прочитано", location: "5-я полка в левом шкафу", image: "Война и мир")
        ]
        
    }
}
