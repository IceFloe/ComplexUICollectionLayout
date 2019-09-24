//
//  BookCell.swift
//  ComplexLayout
//
//  Created by Alex Gurin on 9/13/19.
//  Copyright © 2019 Alex Gurin. All rights reserved.
//

import UIKit

class BookCell: UICollectionViewCell, Cell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var coverImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var pagesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var checkmark: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        shadowView.layer.cornerRadius = 10
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.lightGray.cgColor
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowView.layer.shadowRadius = 6
    }

    func configure(with object: Book) {
        coverImg.image = object.cover
        nameLbl.text = object.name
        yearLbl.text = "\(object.year)"
        pagesLbl.text = "\(object.amountPages)"
        descriptionLbl.text = object.description
        checkmark.isHidden = !object.isSelected
    }
}
