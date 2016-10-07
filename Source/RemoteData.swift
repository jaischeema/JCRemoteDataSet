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
}
