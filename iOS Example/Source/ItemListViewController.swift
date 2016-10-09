//
//  ViewController.swift
//  iOS Example
//
//  Created by Jais Cheema on Oct 08, 2016.
//  Copyright © 2016 NeedleApps Pty Ltd. All rights reserved.
//

import UIKit
import JCRemoteDataSet

class ItemListViewController: UITableViewController {
    var items: ItemList = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "ItemCell")
        }
        cell?.textLabel?.text = items[indexPath.row].title
        return cell!
    }
}
