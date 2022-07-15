//
//  ViewController.swift
//  CellExpandCollapseDemo
//
//  Created by Rupali Patil on 12/07/19.
//  Copyright © 2019 Kanishka Consultancy. All rights reserved.
//

import UIKit


enum CellState {
    case expanded
    case collapsed
}

class ViewController: UIViewController {

    @IBOutlet weak var tblList: UITableView!
    
    @IBOutlet weak var lblPromoCode: UILabel!
   
    var cellstate: [CellState]?
    
    var ListArr = ["Use Above code for avail this offer.....  Apply promocode... Use Gomart app gor shopping etc....Use Above code for avail this offer.Use Above code for avail this offer.....  Apply promocode... Use....  Apply Use Above code for avail this offer.....  Apply promocode... Usepromocode... Use.Use Above code for avail this offer.....  Apply promocode... Use.", "Use Above code for avail this offer.....  Apply promocode... Use Above code for avail this offer.....  Apply promocode... UseUse Gomart Use Above code for avail this offer.....  Apply promocode... Useapp gor shopping etc......", "Use Above code for avail this offer.....  ApplyUse Above code for avail this offer.....  Apply Use Above code for avail this offer.....  Apply promocode... Usepromocode... Use promocode... Use Gomart app gor shopping etc......", "Use AboveUse Above code for avail this offer.....  Apply promocode... Use code for avail this offer.....  Use Above code for avail this offer.....  Apply promocode... UseApply promocode... UseUse Above code for avail this offer.....  ApplyUse Above code for avail this offer.....  Apply promocode... Use promocode... Use Gomart app gor shopping etc......", "Use Above Use Above code for avail this offer.....  Apply promocode... Usecode for avail this offer.....  Apply promocode... Use Gomart app gor shopping etc......"]
    
    var codeArr = ["GOMART31", "GOMART32", "GOMART33", "GOMART34", "GOMART35"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tblList.delegate = self
        tblList.dataSource = self
        
        cellstate = [CellState].init(repeating: .collapsed, count: ListArr.count)
        self.tblList.reloadData()
      
        self.tblList.tableFooterView = UIView(frame: .zero)

    }


}
extension ViewController : UITableViewDelegate, UITableViewDataSource, TableViewCelldelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tblList.dequeueReusableCell(withIdentifier: "ExpandCollapseCell", for: indexPath) as! ExpandCollapseCell
        
        
        cell.btnApply.tag = indexPath.row
        cell.btnApply.addTarget(self, action: #selector(btnApply_onClick(sender:)), for: .touchUpInside)
        
        cell.lblCodeInCell.text = codeArr[indexPath.row]
        cell.lblList.text = ListArr[indexPath.row]
       
        cell.btnExpandCollapse.tag = indexPath.row
        cell.delegate = self
        
        if let cellstates = cellstate{
            cell.lblList.numberOfLines = (cellstates[indexPath.row] == .expanded) ? 0 : 1
        }
         return cell
    }
    
    @objc func btnApply_onClick(sender: UIButton)
    {
        let ind = IndexPath(row: sender.tag, section: 0)
        tblList.reloadRows(at: [ind], with: .automatic)
        let aCell = tblList.cellForRow(at: ind) as! ExpandCollapseCell
        self.lblPromoCode.text = aCell.lblCodeInCell.text
    }
    
    
    func expand(cell: ExpandCollapseCell) {
        if let indexpath = tblList.indexPath(for: cell){
            tblList.beginUpdates()
            cell.lblList.numberOfLines = (cell.lblList.numberOfLines == 0) ? 1 : 0
            self.cellstate?[indexpath.row] = (cell.lblList.numberOfLines == 0) ? .expanded : .collapsed
            if (cell.lblList.numberOfLines == 0){
                cell.btnExpandCollapse.setTitle("Hide Detail", for: .normal)
            } else {
                cell.btnExpandCollapse.setTitle("Show Detail", for: .normal)
            }
            tblList.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
}
