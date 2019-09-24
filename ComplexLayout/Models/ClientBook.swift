//
//  ClientBook.swift
//  ComplexLayout
//
//  Created by Alex Gurin on 9/12/19.
//  Copyright © 2019 Alex Gurin. All rights reserved.
//

import UIKit

struct ClientBook: Hashable {
    let id: String
    let name: String
    let year: Int
    let amountPages: Int
    let cover: UIImage?

    init(book: Book) {
        self.id = book.id
        self.name = book.name
        self.year = book.year
        self.amountPages = book.amountPages
        self.cover = book.cover
    }
}
