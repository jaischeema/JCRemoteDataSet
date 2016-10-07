//
//  Emptyable.swift
//  JCRemoteDataSet
//
//  Created by Jais Cheema on 8/10/16.
//  Copyright © 2016 NeedleApps Pty Ltd. All rights reserved.
//

import Foundation

public protocol Emptyable {
    var isEmpty: Bool { get }
}

extension Array: Emptyable {
    public var isEmpty: Bool { return self.count == 0 }
}

extension String: Emptyable {
    public var isEmpty: Bool { return self.characters.count == 0 }
}
