//
//  CreateAcountView
//  TestDynamicTable
//
//  Created by Tanya Berezovsky on 05/08/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//

import UIKit


class CreateAcountView: NibView {
    @IBOutlet private var contentView: UIView!
    
    @IBOutlet var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         initTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initTableView()
       
    }
    public func initTableView() {
        tableView.allowsSelection = false
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
    }
}
