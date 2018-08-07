//
//  CreateAcountController
//  TestDynamicTable
//
//  Created by Tanya Berezovsky on 05/08/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//

import UIKit

class CreateAcountController: UIViewController {
    private var contentView: CreateAcountView!
    var heightForRow:CGFloat = 80
    var items = AccountFieldsAPI.getAccountFields()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView = CreateAcountView()
        contentView.frame = self.view.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        guard let contentView = self.contentView else { return }
        guard let tableView = contentView.tableView else { return }
        
        view.addSubview(contentView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HeaderTitleCell.self)
        tableView.register(TitleAndTextFieldCell.self)
    }
}

extension CreateAcountController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = items[indexPath.row].cellType
        switch cellType {
        case .headerTitle:
            let cell = tableView.dequeueReusableCell(indexPath: indexPath as NSIndexPath) as HeaderTitleCell
            cell.titleLabel!.text = items[indexPath.row].fieldName
            return cell
        case .titleAndTextField:
            let cell = tableView.dequeueReusableCell(indexPath: indexPath as NSIndexPath) as TitleAndTextFieldCell
            cell.titleLabel!.text = items[indexPath.row].fieldName
            return cell
        }
    }
}

extension CreateAcountController: UITableViewDelegate {
}
