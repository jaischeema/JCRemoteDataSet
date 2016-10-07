//
//  ViewController.swift
//  iOS Example
//
//  Created by Jais Cheema on Oct 08, 2016.
//  Copyright © 2016 NeedleApps Pty Ltd. All rights reserved.
//

import UIKit
import JCRemoteDataSet

class ItemListViewController: DataViewController<ItemList> {
    override func initializeProvider() {
        self.title = "Item List"
        self.provider = ItemListProvider()
    }
}
