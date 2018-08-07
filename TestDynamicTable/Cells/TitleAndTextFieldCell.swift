//
//  AccountTableViewCell.swift
//  TestDynamicTable
//
//  Created by Tanya Berezovsky on 05/08/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//

import UIKit
typealias TitleAndTextFieldPresentable = TitlePresentable & TextFieldPresentable

class TitleAndTextFieldCell: BaseTableViewCell, TitleAndTextFieldPresentable {
    
    var margin:CGFloat = 30
    var titleLabel: UILabel! {
        didSet {
            initTitleLabelDefaultUI()
        }
    }
    
    var textField: UITextField! {
        didSet {            
            initTextFieldDefaultUI()
        }
    }
    
    func onTextFieldDidEndEditing(textField: UITextField) {}
    
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
        textField = UITextField()
        //add to sub views
        containerView.addSubview(titleLabel)
        containerView.addSubview(textField)
        self.contentView.addSubview(containerView)
    }
    
    func setAutoLayout() {
        //set auto layaout
        containerView.fillSuperview()
        titleLabel.topAnchor.constraint(equalTo:self.contentView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:margin).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-margin).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant:30).isActive = true
       
        textField.topAnchor.constraint(equalTo:titleLabel.bottomAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:margin).isActive = true
        textField.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-margin).isActive = true
        textField.heightAnchor.constraint(equalToConstant:30).isActive = true

    }

}
