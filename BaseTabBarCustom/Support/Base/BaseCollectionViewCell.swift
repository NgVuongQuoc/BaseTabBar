//
//  BaseCollectionViewCell.swift
//  Sazalem
//
//  Created by DucDV on 23/10/2022.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell, Reusable {
    //MARK: Properties
    var indexPath: IndexPath?
    weak var delegate: AnyObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Do stuff here
    }

    //MARK: Support methods
    func config(_ indexPath: IndexPath?, delegate: AnyObject?) {
        self.indexPath = indexPath
        self.delegate = delegate
    }
}
