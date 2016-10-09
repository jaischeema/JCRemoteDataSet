//
//  RemoteData.swift
//  JCRemoteDataSet
//
//  Created by Jais Cheema on 8/10/16.
//  Copyright © 2016 NeedleApps Pty Ltd. All rights reserved.
//

import Foundation

public enum RemoteData<T> {
    case notAsked
    case loading
    case failure(Error)
    case success(T)
    
    public var value: T? {
        switch self {
        case .success(let value):
            return value
        default:
            return nil
        }
    }
    
    public var isSuccess: Bool {
        switch self {
        case .success(let value):
            return true
        default:
            return false
        }
    }
}
