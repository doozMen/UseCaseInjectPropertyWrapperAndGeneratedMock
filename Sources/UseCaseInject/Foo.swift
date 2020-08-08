//
//  File.swift
//  
//
//  Created by Stijn Willems on 07/08/2020.
//

import Foundation
import Inject

public final class Foo: Injectable {
    public static var shared = Foo()
    
    public let info = "this is the RELEASE version, should not be used"
}
