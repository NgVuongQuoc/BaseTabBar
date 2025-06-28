//
//  ReusableProtocol.swift
//  Sazalem
//
//  Created by DucDV on 27/03/2023.
//

import Foundation
import UIKit

// MARK: - 1: combine indentifier and nibName in one protocol
/**
 A protocol support reuse in UITableView / UICollectionView
 Supply / return the indentifier and nib name of class
 */
protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
    static var xibName: String { get }
}

extension Reusable {
    static var reuseIdentifier: String { return String(describing: self) }
    static var xibName: String { return NSStringFromClass(self).components(separatedBy: ".").last ?? "" }
}

// MARK: - 2: divide to 2 protocol
protocol ReuseIdentifier {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifier {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

protocol NibLoadable {
    static var nibName: String { get }
}

extension NibLoadable {
    
    static var nibName: String {
        String(describing: self)
    }
}

extension NibLoadable where Self: UIView {
    static func loadFromNib() -> Self {
        let bundler = Bundle(for: Self.self)
        return bundler.loadNibNamed(Self.nibName, owner: self, options: nil)!.first as! Self
    }
}

extension NibLoadable where Self: UIViewController {
    static func loadFromNib() -> Self {
        let bundler = Bundle(for: Self.self)
        return bundler.loadNibNamed(Self.nibName, owner: self, options: nil)!.first as! Self
    }
}

protocol NibOwnerLoadable: AnyObject {
  static var nib: UINib { get }
}

extension NibOwnerLoadable {
  static var nib: UINib {
    return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
  }
}

extension NibOwnerLoadable where Self: UIView {
  func loadNibContent() {
    let layoutAttributes: [NSLayoutConstraint.Attribute] = [.top, .leading, .bottom, .trailing]
    for case let view as UIView in type(of: self).nib.instantiate(withOwner: self, options: nil) {
      view.translatesAutoresizingMaskIntoConstraints = false
      self.addSubview(view)
      NSLayoutConstraint.activate(layoutAttributes.map { attribute in
        NSLayoutConstraint(
          item: view, attribute: attribute,
          relatedBy: .equal,
          toItem: self, attribute: attribute,
          multiplier: 1, constant: 0.0
        )
      })
    }
  }
}
