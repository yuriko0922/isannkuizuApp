//
//  TableViewController.swift
//  isannkuizuApp
//
//  Created by 津國　由莉子 on 2019/08/15.
//  Copyright © 2019 yurityann. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // 遷移元からもらう情報
    // 正解不正解
    var receiveResults: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 問題の数のセル表示
        return receiveResults.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "risuluts", for: indexPath)
        //
        if receiveResults[indexPath.row] {
            cell.textLabel?.text = "問題\(indexPath.row + 1)⭕️"
        } else {
            cell.textLabel?.text = "問題\(indexPath.row + 1)❌"
        }
        return cell
    }
    
}





