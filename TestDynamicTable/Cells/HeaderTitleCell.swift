//
//  HeaderTitleCell.swift
//  TestDynamicTable
//
//  Created by Tanya Berezovsky on 07/08/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//

import UIKit

class HeaderTitleCell: BaseTableViewCell, HeaderTitlePresentable {

    var margin:CGFloat = 30
    var titleLabel: UILabel! {
        didSet {
            initTitleLabelDefaultUI()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initCell()
    }
    
    func initCell() {
        createViews()
        setAutoLayout()
    }
    
    func createViews() {
        titleLabel = UILabel()
        //add to sub views
        containerView.addSubview(titleLabel)
        self.contentView.addSubview(containerView)
    }
    
    func setAutoLayout() { //set auto layaouts
        containerView.fillSuperview()
        titleLabel.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo:self.contentView.centerXAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant:35).isActive = true
   }
}
