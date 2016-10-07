//
//  EmptyableProvider.swift
//  JCRemoteDataSet
//
//  Created by Jais Cheema on 8/10/16.
//  Copyright © 2016 NeedleApps Pty Ltd. All rights reserved.
//

import Foundation

open class EmptyableProvider<T>: Provider<T> where T:Emptyable {
    open var emptyView: UIView {
        return EmptyView()
    }
    
    override var view: UIView {
        switch(data) {
        case .notAsked:
            return self.initializeView()
        case .loading:
            return self.loadingView()
        case .success(let value):
            return value.isEmpty ? emptyView : self.dataView(value: value)
        case .failure(let error):
            return self.errorView(error: error)
        }
    }
}
