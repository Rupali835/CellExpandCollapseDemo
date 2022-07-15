//
//  ExpandCollapseCell.swift
//  CellExpandCollapseDemo
//
//  Created by Rupali Patil on 12/07/19.
//  Copyright © 2019 Kanishka Consultancy. All rights reserved.
//

import UIKit

protocol TableViewCelldelegate: class {
    func expand(cell: ExpandCollapseCell)
}


class ExpandCollapseCell: UITableViewCell {

    @IBOutlet weak var lblCodeInCell: UILabel!
    @IBOutlet weak var btnApply: UIButton!
    @IBOutlet weak var btnExpandCollapse: UIButton!
    
    @IBOutlet var lblList: UILabel!{
        didSet{
           lblList.numberOfLines = 0
        }
    }
    
    weak var delegate : TableViewCelldelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnExpandCollapse.setTitle("Show Details", for: .normal)
        self.selectionStyle = .none
     }

    @IBAction func btnExpandCollapse_onClick(_ sender: Any)
    {
        delegate?.expand(cell: self)
    }
}
