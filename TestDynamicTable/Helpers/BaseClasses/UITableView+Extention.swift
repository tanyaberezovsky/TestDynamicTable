//
//  UITableView+Extention.swift
//  Surikatta
//
//  Created by Tanya Berezovsky on 07/08/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//

import UIKit
//base on articles
//http://bizz84.github.io/2016/06/18/Protocol-Oriented-UITableViewCells.html
//http://alisoftware.github.io/swift/generics/2016/01/06/generic-tableviewcells/
//http://softauthor.com/ios-uitableview-programmatically-in-swift/
extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: Reusable {
        self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: NSIndexPath) -> T where T: Reusable {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T
            else {
                fatalError("\(T.reuseIdentifier) initialisation failed")
        }
        return cell
    }
    
    func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable {
        self.register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? where T: Reusable {
        guard let header = self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T
            else {
                print("\(T.reuseIdentifier) header initialisation failed")
                return nil
        }
        return header
    }
}

