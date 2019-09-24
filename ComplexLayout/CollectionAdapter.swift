//
//  CollectionAdapter.swift
//  UICollectionViewDiffableDataSource
//
//  Created by Alex Gurin on 9/5/19.
//  Copyright © 2019 Alex Gurin. All rights reserved.
//

import UIKit

protocol CollectionAdapterDelegate: AnyObject {
    func sections() -> [Section]
    func itemsFor(section: Section) -> [AnyHashable]
}

class CollectionAdapter: NSObject {
    private weak var collection: UICollectionView?
    private lazy var datasource: UICollectionViewDiffableDataSource<Section, AnyHashable> = UICollectionViewDiffableDataSource(collectionView: self.collection!, cellProvider: cell)
    private weak var delegate: CollectionAdapterDelegate?

    init(collection: UICollectionView, delegate: CollectionAdapterDelegate) {
        self.collection = collection
        self.delegate = delegate
        super.init()
        collection.collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: sectionLayout)
        collection.delegate = self
        datasource.supplementaryViewProvider = supplementaryView
    }

    private func cell(in collection: UICollectionView, at indexPath: IndexPath, for item: AnyHashable) -> UICollectionViewCell? {
        guard let item = datasource.itemIdentifier(for: indexPath) else {
            return nil
        }
        let section = datasource.snapshot().sectionIdentifiers[indexPath.section]
        return section.cell(for: item, at: indexPath, in: collection)
    }

    private func supplementaryView(in collection: UICollectionView, kind: String, at indexPath: IndexPath) -> UICollectionReusableView? {
        let section = datasource.snapshot().sectionIdentifiers[indexPath.section]
        return section.supplementaryView(kind: kind, for: datasource.itemIdentifier(for: indexPath), at: indexPath, in: collection)
    }

    private func sectionLayout(for sectionIndex: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        let section = datasource.snapshot().sectionIdentifiers[sectionIndex]
        return section.layout(environment: environment)
    }

    func performUpdates(animated: Bool, completion: (() -> Void)? = nil) {
        guard let delegate = delegate, let collection = collection else {
            return
        }

        var snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
        for section in delegate.sections() {
            section.registerCells(in: collection)
            snapshot.appendSections([section])

            let items = delegate.itemsFor(section: section)
            section.isEmpty = items.count == 0
            snapshot.appendItems(items)
        }
        datasource.apply(snapshot, animatingDifferences: animated, completion: completion)
    }
}

extension CollectionAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = datasource.itemIdentifier(for: indexPath) else {
            return
        }
        let section = datasource.snapshot().sectionIdentifiers[indexPath.section]
        section.didSelect(item: item, at: indexPath.row)
    }
}
