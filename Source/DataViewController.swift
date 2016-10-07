//
//  DataViewController.swift
//  JCRemoteDataSet
//
//  Created by Jais Cheema on 8/10/16.
//  Copyright © 2016 NeedleApps Pty Ltd. All rights reserved.
//

import UIKit

open class DataViewController<T>: UIViewController, ProviderDelegate {
    internal var providerView: UIView?
    
    open func providerDataDidChange() {
        self.providerView?.removeFromSuperview()
        if let pView = self.provider?.view {
            pView.frame = self.view.bounds
            pView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.providerView = pView
            self.view.addSubview(pView)
        }
    }
    
    open var provider: Provider<T>? {
        didSet {
            self.provider?.delegate = self
        }
    }
    
    open func initializeProvider() {}
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.initializeProvider()
        self.provider?.loadData()
    }
}
