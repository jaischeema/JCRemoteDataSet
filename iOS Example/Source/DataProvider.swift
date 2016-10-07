//
//  DataProvider.swift
//  iOS Example
//
//  Created by Jais Cheema on 8/10/16.
//  Copyright © 2016 NeedleApps Pty Ltd. All rights reserved.
//

import UIKit
import JCRemoteDataSet

typealias ItemList = [Item]
class AppError: Error {}

struct Item {
    let title: String
}

class ItemListProvider: EmptyableProvider<ItemList> {
    var tries = 0
    var tableViewSource: ItemListDataSource?
    
    override func loadData() {
        self.data = .loading
        Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false) { _ in
            self.tries += 1
            if self.tries > 2 {
                self.data = .success([Item(title: "Hello"),
                                      Item(title: "World")])
            } else {
                self.data = .failure(AppError())
            }
        }
    }
    
    override func dataView(value: ItemList) -> UIView {
        let tView = UITableView()
        tView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        self.tableViewSource = ItemListDataSource(items: value)
        tView.delegate = self.tableViewSource
        tView.dataSource = self.tableViewSource
        return tView
    }
}

class ItemListDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    let items: ItemList
    
    init(items: ItemList) {
        self.items = items
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "ItemCell")
        }
        cell!.textLabel?.text = self.items[indexPath.row].title
        return cell!
    }
}
