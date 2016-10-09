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
    
    override func loadData() {
        self.data = .loading
        Timer.scheduledTimer(timeInterval: 4.0,
                             target: self,
                             selector: #selector(handleTimedEvent),
                             userInfo: nil,
                             repeats: false)
    }
    
    func handleTimedEvent() {
        self.tries += 1
        if self.tries > 2 {
            self.data = .success([Item(title: "Hello"),
                                  Item(title: "World")])
        } else {
            self.data = .failure(AppError())
        }
    }
    
    override func dataViewController(value: ItemList) -> UIViewController {
        return ItemListViewController()
    }
}
