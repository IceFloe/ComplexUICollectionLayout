//
//  Cell.swift
//  UICollectionViewDiffableDataSource
//
//  Created by Alex Gurin on 9/5/19.
//  Copyright © 2019 Alex Gurin. All rights reserved.
//

import Foundation

protocol Cell {
    associatedtype Object

    func configure(with object: Object)
}
