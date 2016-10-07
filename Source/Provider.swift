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
}

open class Provider<T>: NSObject {
    var delegate: ProviderDelegate?
    
    public var data: RemoteData<T> = .notAsked {
        didSet {
            self.delegate?.providerDataDidChange()
        }
    }
    
    public override init() {
        super.init()
    }
    
    var view: UIView {
        switch(data) {
        case .notAsked:
            return self.initializeView()
        case .loading:
            return self.loadingView()
        case .success(let value):
            return self.dataView(value: value)
        case .failure(let error):
            return self.errorView(error: error)
        }
    }
    
    open func errorView(error: Error) -> UIView {
        let view = ErrorView()
        view.errorLabel.text = error.localizedDescription
        view.reloadHandler = { [unowned self] _ in
            self.loadData()
        }
        return view
    }
    
    open func dataView(value: T) -> UIView {
        return UIView()
    }
    
    open func initializeView() -> UIView {
        return UIView()
    }
    
    open func loadingView() -> UIView {
        return LoadingView()
    }
    
    open func loadData() {}
}
