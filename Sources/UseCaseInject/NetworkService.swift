//
//  Service.swift
//  Inject
//
//  Created by Stijn Willems on 09/08/2020.
//

import Foundation
import Resolver

public protocol NetworkServicable: class {
    func fetch()
}

public final class Controller {
    @Injected public var service: NetworkServicable
    
    public init() {}
    
    public func loadData() {
        service.fetch()
    }
}

public class NetworkService: NetworkServicable {
    public init() {}
    
    public func fetch() {}
}
