//
//  CollectionSection.swift
//  UICollectionViewDiffableDataSource
//
//  Created by Alex Gurin on 9/5/19.
//  Copyright © 2019 Alex Gurin. All rights reserved.
//

import UIKit

class Section: Hashable {
    let id: String
    var isEmpty: Bool = true

    init(id: String) {
        self.id = id
    }

    open func registerCells(in collection: UICollectionView) {

    }

    open func cell(for item: AnyHashable, at indexPath: IndexPath, in collection: UICollectionView) -> UICollectionViewCell? {
        return nil
    }

    open func didSelect(item: AnyHashable, at index: Int) {
        
    }

    open func supplementaryView(kind: String, for item: AnyHashable?, at indexPath: IndexPath, in collection: UICollectionView) -> UICollectionReusableView? {
        return nil
    }

    open func layout(environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        return nil
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Section, rhs: Section) -> Bool {
        return lhs.id == rhs.id
    }
}
