//
//  RemoteDataViewController.swift
//  JCRemoteDataSet
//
//  Created by Jais Cheema on 9/10/16.
//  Copyright © 2016 NeedleApps Pty Ltd. All rights reserved.
//

import UIKit

extension UIViewController {
    open func remoteDataDidUpdate() {}
}

open class RemoteDataViewController<T>: UIViewController, ProviderDelegate {
    internal var currentChildViewController: UIViewController?
    
    open func providerDataDidChange() {
        if let viewController = currentChildViewController {
            self.removeViewControllerAsChildViewController(viewController: viewController)
        }
        
        if let viewController = self.provider?.viewController {
            self.addViewControllerAsChildViewController(viewController: viewController)
            self.title = self.provider?.title
        }
    }
    
    public func providerDataDidUpdate() {
        self.currentChildViewController?.remoteDataDidUpdate()
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
    
    func addViewControllerAsChildViewController(viewController: UIViewController) {
        addChildViewController(viewController)
        self.currentChildViewController = viewController
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParentViewController: self)
    }
    
    func removeViewControllerAsChildViewController(viewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }
}
