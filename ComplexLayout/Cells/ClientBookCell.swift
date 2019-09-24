//
//  ClientBookCell.swift
//  ComplexLayout
//
//  Created by Alex Gurin on 9/12/19.
//  Copyright © 2019 Alex Gurin. All rights reserved.
//

import UIKit

protocol ClientBookCellDelegate: AnyObject {
    func didTapReturn(book: ClientBook)
}

class ClientBookCell: UICollectionViewCell, Cell {

    @IBOutlet weak var bookNameLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var pagesLbl: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var coverImg: UIImageView!

    private var book: ClientBook?
    weak var delegate: ClientBookCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        shadowView.layer.cornerRadius = 10
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.lightGray.cgColor
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowView.layer.shadowRadius = 6
    }

    @IBAction func returnBook(_ sender: Any) {
        guard let book = book else {
            return
        }
        delegate?.didTapReturn(book: book)
    }

    func configure(with object: ClientBook) {
        self.book = object
        
        bookNameLbl.text = object.name
        yearLbl.text = "\(object.year)"
        pagesLbl.text = "\(object.amountPages)"
        coverImg.image = object.cover
    }
}
