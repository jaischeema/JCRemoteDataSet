//
//  ErrorViewController.swift
//  JCRemoteDataSet
//
//  Created by Jais Cheema on 9/10/16.
//  Copyright © 2016 NeedleApps Pty Ltd. All rights reserved.
//

import UIKit

public class ErrorViewController: UIViewController {
    @IBOutlet weak public var errorLabel: UILabel!
    @IBOutlet weak public var reloadLabel: UILabel!
    
    var reloadHandler: ((Void) -> Void)?
    public var errorMessage: String = "Something went wrong"
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.text = errorMessage
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(handleTap(gestureRecognizer:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func handleTap(gestureRecognizer: UITapGestureRecognizer) {
        self.reloadHandler?()
    }
}
