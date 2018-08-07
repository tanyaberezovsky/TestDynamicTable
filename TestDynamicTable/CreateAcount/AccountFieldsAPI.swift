//
//  AccountFieldAPI.swift
//  TestDynamicTable
//
//  Created by Tanya Berezovsky on 06/08/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//
//
//  AccountFieldAPI.swift
//  TestDynamicTable
//
//  Created by Tanya Berezovsky on 06/08/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//

import Foundation
enum AccountFieldNames: String {
    case createAcount
    case firstName
    case lastName
    case email
    case password
    case retypePassword
    var title: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
enum AcountCellTypes: String {
    case headerTitle
    case titleAndTextField
    // case button
}
struct AccountField {
    let fieldName: String
    var isValid: Bool = false
    var cellType: AcountCellTypes = .titleAndTextField
    init(fieldName: String, cellType: AcountCellTypes = .titleAndTextField, isValid: Bool = false) {
        self.fieldName = fieldName
        self.cellType = cellType
        self.isValid = isValid
    }
}
struct AccountFieldsAPI {
    static func getAccountFields() -> [AccountField] {
        let accountFields = [
            AccountField(fieldName: AccountFieldNames.createAcount.title, cellType: .headerTitle, isValid: true),
            AccountField(fieldName: AccountFieldNames.firstName.title),
            AccountField(fieldName: AccountFieldNames.lastName.title),
            AccountField(fieldName: AccountFieldNames.email.title),
            AccountField(fieldName: AccountFieldNames.password.title),
            AccountField(fieldName: AccountFieldNames.retypePassword.title)
        ]
        return accountFields
    }
}
