//
//  ClientInfo.swift
//  UICollectionViewDiffableDataSource
//
//  Created by Alex Gurin on 9/5/19.
//  Copyright © 2019 Alex Gurin. All rights reserved.
//

import Foundation

struct ClientInfo: Hashable {
    let id: String
    let clientName: String
    let maxBooksAmount: Int
    var booksAmount: Int
}
