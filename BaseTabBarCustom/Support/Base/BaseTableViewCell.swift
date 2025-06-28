//
//  BaseTableViewCell.swift
//  Sazalem
//
//  Created by DucDV on 14/10/2022.
//

import UIKit

class BaseTableViewCell: UITableViewCell, Reusable {
    //MARK: Properties
    var indexPath = IndexPath()
    weak var delegate: AnyObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    //MARK: Support methods
    func config(_ indexPath: IndexPath, delegate: AnyObject?) {
        self.indexPath = indexPath
        self.delegate = delegate
    }
    
}
