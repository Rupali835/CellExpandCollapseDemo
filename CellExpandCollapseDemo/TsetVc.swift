//
//  TsetVc.swift
//  CellExpandCollapseDemo
//
//  Created by Rupali Patil on 12/07/19.
//  Copyright © 2019 Kanishka Consultancy. All rights reserved.
//

import UIKit

class TsetVc: UIViewController {

    @IBOutlet weak var tblTest: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblTest.delegate = self
        tblTest.dataSource = self
    }
  
}
extension TsetVc : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblTest.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as! TestCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
