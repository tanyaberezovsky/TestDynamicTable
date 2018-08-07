//
//  NibView.swift
//  TestDynamicTable
//
//  Created by Tanya Berezovsky on 05/08/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//

import UIKit
class NibView: UIView {
    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Setup view from .xib file
        xibSetup()
    }
}
private extension NibView {
    
    func xibSetup() {
        if let view = loadNib() {
            self.view = view
            self.view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(self.view)
            self.view.frame = self.bounds
            self.view.fillSuperview()
        }
    }
}
