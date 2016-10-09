//
//  Provider.swift
//  JCRemoteDataSet
//
//  Created by Jais Cheema on 8/10/16.
//  Copyright © 2016 NeedleApps Pty Ltd. All rights reserved.
//

import Foundation

public protocol ProviderDelegate {
    func providerDataDidChange()
    func providerDataDidUpdate()
}

open class Provider<T>: NSObject {
    var delegate: ProviderDelegate?
    
    public var data: RemoteData<T> = .notAsked {
        didSet {
            if oldValue.isSuccess && data.isSuccess {
                self.delegate?.providerDataDidUpdate()
            } else {
                self.delegate?.providerDataDidChange()
            }
        }
    }
    
    public override init() {
        super.init()
    }
    
    var viewController: UIViewController {
        switch(data) {
        case .notAsked:
            return self.initializeViewController()
        case .loading:
            return self.loadingViewController()
        case .success(let value):
            return self.dataViewController(value: value)
        case .failure(let error):
            return self.errorViewController(error: error)
        }
    }
    
    open var title: String { return "" }
    
    open func errorViewController(error: Error) -> UIViewController {
        let viewController = ErrorViewController(nibName: "ErrorViewController",
                                                 bundle: Bundle(for: ErrorViewController.self))
        viewController.errorMessage = error.localizedDescription
        viewController.reloadHandler = { [unowned self] _ in
            self.loadData()
        }
        return viewController
    }
    
    open func dataViewController(value: T) -> UIViewController {
        return UIViewController()
    }
    
    open func initializeViewController() -> UIViewController {
        return UIViewController()
    }
    
    open func loadingViewController() -> UIViewController {
        return LoadingViewController(nibName: "LoadingViewController",
                                     bundle: Bundle(for: LoadingViewController.self))
    }
    
    open func loadData(skipCache: Bool = false) {}
}
