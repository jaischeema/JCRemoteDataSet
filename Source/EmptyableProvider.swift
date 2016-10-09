//
//  EmptyableProvider.swift
//  JCRemoteDataSet
//
//  Created by Jais Cheema on 8/10/16.
//  Copyright © 2016 NeedleApps Pty Ltd. All rights reserved.
//

import Foundation

open class EmptyableProvider<T>: Provider<T> where T:Emptyable {
    open var emptyViewController: UIViewController {
        return EmptyViewController(nibName: "EmptyViewController",
                                   bundle: Bundle(for: EmptyViewController.self))
    }
    
    override var viewController: UIViewController {
        switch(data) {
        case .notAsked:
            return self.initializeViewController()
        case .loading:
            return self.loadingViewController()
        case .success(let value):
            return value.isEmpty ? emptyViewController : self.dataViewController(value: value)
        case .failure(let error):
            return self.errorViewController(error: error)
        }
    }
}
