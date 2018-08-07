//
//  BaseTableViewCell.swift
//  TestDynamicTable
//
//  Created by Tanya Berezovsky on 06/08/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//

import UIKit
protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        // use the class's name as an identifier
        // so this makes a decent default value.
        return String(describing: self)
        //String(describing: type(of: obj))
    }
}

class BaseTableViewCell: UITableViewCell, Reusable {
    //Define containerView property, which will be a container for titleLabel as well as jobTitleDetailedLabel.
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
}
