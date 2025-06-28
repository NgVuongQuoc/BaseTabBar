//
//  UICollectionView+Extension.swift
//  ePlatform
//
//  Created by DucDV on 14/10/2022.
//

import UIKit

extension UICollectionView {
    //MARK: - Way 1 : Combine identifier and nibName in Reusable protocol
    //Register the Cell from XIB with identifier
    func register<T: UICollectionViewCell>(cell: T.Type) where T: Reusable {
        let indentifier = T.reuseIdentifier
        let nibName = T.xibName
        
        let bundle = Bundle(for: cell)
        register(UINib(nibName: nibName, bundle: bundle), forCellWithReuseIdentifier: indentifier)
    }
    
    //DequeueReusable with identifier at indexPath
    func dequeueReusableCell<T: UICollectionViewCell>(_ type: T.Type, indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
