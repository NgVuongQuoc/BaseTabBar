//
//  UITableView+Extension.swift
//  ePlatform
//
//  Created by DucDV on 14/10/2022.
//

import Foundation
import UIKit

extension UITableView {
    //MARK: - Way 1 : Combine identifier and nibName in Reusable protocol
    //Register the Cell from XIB with identifier
    func register<T: UITableViewCell>(cell: T.Type) where T: Reusable {
        let indentifier = T.reuseIdentifier
        let nibName = T.xibName
        
        let bundle = Bundle(for: cell)
        register(UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: indentifier)
    }
    
    //DequeueReusableCell with identifier
    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type) -> T where T: Reusable {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    //DequeueReusable with identifier at indexPath
    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type, indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    // DequeueReusableHeaderFooterViewCell with identifier
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ type: T.Type) -> T where T: Reusable {
        guard let cell = self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    //MARK: - Way2 : divide to 2 protocol and implement in base table view cell
}

final class ContentSizedTableView: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}

extension UITableView {
    func removeHeaderPadding() {
        if #available(iOS 15.0, *) {
            self.sectionHeaderTopPadding = 0.0
        }
    }
}

extension UITableView {

    func scrollToBottom(isAnimated: Bool = true) {

        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: self.numberOfRows(inSection:  self.numberOfSections-1) - 1,
                section: self.numberOfSections - 1)
            if self.hasRowAtIndexPath(indexPath: indexPath) {
                self.scrollToRow(at: indexPath, at: .bottom, animated: isAnimated)
            }
        }
    }

    func scrollToTop(isAnimated:Bool = true) {

        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            if self.hasRowAtIndexPath(indexPath: indexPath) {
                self.scrollToRow(at: indexPath, at: .top, animated: isAnimated)
           }
        }
    }

    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
}
