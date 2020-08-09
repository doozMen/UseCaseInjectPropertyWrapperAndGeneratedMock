import Foundation
import Resolver

public class Foo: Codable {    
    public let info: String
    
    init(info: String) {
        self.info = info
    }
}

public class Bar {
    @Injected public var foo: Foo
    @LazyInjected public var fooLazy: Foo
    @OptionalInjected public var fooOptional: Foo?
    
    public init() {}
}
