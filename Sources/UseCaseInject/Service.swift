//
//  Service.swift
//  Inject
//
//  Created by Stijn Willems on 09/08/2020.
//

import Foundation
import Resolver

public protocol ServiceProtocol: class {
    
}

public class Controller {
    @Injected public var service: ServiceProtocol
    
    public init() {}
}

public class Service: ServiceProtocol {
    public init() {}
    
    public func fetch() {}
}
