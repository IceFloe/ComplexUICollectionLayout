//
//  ClientBooksSection.swift
//  ComplexLayout
//
//  Created by Alex Gurin on 9/12/19.
//  Copyright © 2019 Alex Gurin. All rights reserved.
//

import UIKit

final class ClientBooksSection: CollectionSection<ClientBook, ClientBookCell> {

    static private let emptyViewKind = "EmptyClientBookSectionView"

    private var emptyView: EmptyClientBookSectionView?
    override var isEmpty: Bool {
        didSet {
            emptyView?.contentView.isHidden = !isEmpty
        }
    }

    override func registerCells(in collection: UICollectionView) {
        super.registerCells(in: collection)
        collection.register(UINib(nibName: ClientBooksSection.emptyViewKind, bundle: nil),
                            forSupplementaryViewOfKind: ClientBooksSection.emptyViewKind,
                            withReuseIdentifier: ClientBooksSection.emptyViewKind)
    }

    override func layout(environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(200))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6),
                                               heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])

        let emptyViewSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .absolute(150.0))

        let left = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: emptyViewSize,
                                                               elementKind: ClientBooksSection.emptyViewKind,
                                                               alignment: .leading)

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [left]
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        return section
    }

    override func supplementaryView(kind: String, for item: AnyHashable?, at indexPath: IndexPath, in collection: UICollectionView) -> UICollectionReusableView? {
        guard let emptyView = collection.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: ClientBooksSection.emptyViewKind,
            for: indexPath) as? EmptyClientBookSectionView else {
                return nil
        }
        self.emptyView = emptyView
        emptyView.contentView.isHidden = !isEmpty

        return emptyView
    }
}
