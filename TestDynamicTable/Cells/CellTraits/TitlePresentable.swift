//
//  TitleCell
//  TestDynamicTable
//
//  Created by Tanya Berezovsky on 02/08/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//

import UIKit

protocol TitlePresentable {
    var titleLabel: UILabel! { get set }
    var titleFont: UIFont { get }
    var titleTextColor: UIColor { get }
}

extension TitlePresentable {
    var titleFont: UIFont { return .systemFont(ofSize: 17) }
    var titleTextColor: UIColor { return .darkGray }
    
    func initTitleLabelDefaultUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = self.titleFont
        titleLabel.textColor = self.titleTextColor
    }
}

protocol HeaderTitlePresentable: TitlePresentable {
}

extension HeaderTitlePresentable {
    var titleFont: UIFont { return .systemFont(ofSize: 30) }
}
