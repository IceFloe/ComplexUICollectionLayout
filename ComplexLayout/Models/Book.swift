//
//  Book.swift
//  ComplexLayout
//
//  Created by Alex Gurin on 9/12/19.
//  Copyright © 2019 Alex Gurin. All rights reserved.
//

import UIKit

struct Book: Hashable {
    let id: String
    let name: String
    let year: Int
    let cover: UIImage?
    let amountPages: Int
    let description: String
    var isSelected: Bool = false

    static var fakeBooks: [Book] {
        var array: [Book] = []
        array.append(Book(id: UUID().uuidString, name: "Stolen Things", year: 2019, cover: UIImage(named: "stolen"), amountPages: 368,
                          description: "A sensational crime, a missing teen, and a mother and daughter with no one to trust but themselves come together in this shocking debut thriller by R. H. Herron. A sensational crime, a missing teen, and a mother and daughter with no one to trust but themselves come together in this shocking debut thriller by R. H. Herron."))
        array.append(Book(id: UUID().uuidString, name: "Here There Are Monsters", year: 2018, cover: UIImage(named: "monsters"), amountPages: 352,
                          description: "The Blair Witch Project meets Imaginary Girls in this story of codependent sisterhood, the struggle to claim one’s own space, and the power of secrets\nSixteen-year-old Skye is done playing the knight in shining armor for her insufferable younger sister, Deirdre. Moving across the country seems like the perfect chance to start over."))
        array.append(Book(id: UUID().uuidString, name: "All the Bad Apples", year: 2019, cover: UIImage(named: "apples"), amountPages: 320,
                          description: "When Deena's wild and mysterious sister Mandy disappears - presumed dead - her family are heartbroken. But Mandy has always been troubled. It's just another bad thing to happen to Deena's family. Only Deena refuses to believe it's true."))
        array.append(Book(id: UUID().uuidString, name: "All the Lovely Pieces", year: 2017, cover: UIImage(named: "pieces"), amountPages: 320,
                          description: "For nine years, Drew Baker has been running from her brutal husband and the dark deeds of the night she left him. Focused on protecting her ten-year-old son, Drew reluctantly settles into a small town, eager to find proof of her husband’s true nature so she can stop looking over her shoulder."))
        array.append(Book(id: UUID().uuidString, name: "Drowning With Others", year: 2015, cover: UIImage(named: "others"), amountPages: 379,
                          description: "Prep school sweethearts Ian and Andi Copeland are envied by everyone they know. They have successful businesses, a beautiful house in St. Louis, and their eldest daughter, Cassidy, is following in their footsteps by attending prestigious Glenlake Academy. Then, a submerged car is dredged from the bottom of a swimming hole near the campus. So are the remains of a former writer-in-residence who vanished twenty years ago—during Ian and Andi’s senior year."))
        array.append(Book(id: UUID().uuidString, name: "Winter Cottage", year: 2018, cover: UIImage(named: "winter"), amountPages: 348,
                          description: "Still grieving the loss of her wandering, free-spirited mother, Lucy Kincaid leaves Nashville for the faded town of Cape Hudson, Virginia. She goes to see the house she’s inherited—one she never knew existed, bequeathed to her by a woman she’s never even met. At the heart of this mystery is the hope that maybe—just maybe—this “Winter Cottage” will answer the endless questions about her mother’s past…including the identity of her birth father."))
        return array
    }
}
