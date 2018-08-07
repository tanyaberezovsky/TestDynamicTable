//
//  TextFieldPresentable.swift
//  TestDynamicTable
//
//  Created by Tanya Berezovsky on 06/08/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//

import UIKit

protocol TextFieldPresentable {
    var textField: UITextField! { get set }
    var textFieldFont: UIFont { get }
    var textColor: UIColor { get }

    func onTextFieldDidEndEditing(textField: UITextField)
}

extension TextFieldPresentable {
    var textFieldFont: UIFont { return .systemFont(ofSize: 20) }
    var textColor: UIColor { return .black }
    func initTextFieldDefaultUI() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.font = self.textFieldFont
        textField.textColor = self.textColor
    }
}
