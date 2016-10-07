//
//  ErrorView.swift
//  JCRemoteDataSet
//
//  Created by Jais Cheema on 7/10/16.
//  Copyright © 2016 Jais Cheema. All rights reserved.
//

import UIKit

class ErrorView: NIBView {
    @IBOutlet weak var errorLabel: UILabel!
    var reloadHandler: ((Void) -> Void)?
    
    override func xibSetup() {
        super.xibSetup()
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(handleTap(gestureRecognizer:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func handleTap(gestureRecognizer: UITapGestureRecognizer) {
        self.reloadHandler?()
    }
}
