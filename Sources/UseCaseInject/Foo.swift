import Foundation
import Resolver

public class Foo: Codable {    
    public let info: String
    
    public init(info: String) {
        self.info = info
    }
}

public class Bar {
    @Injected public var foo: Foo
    @Injected(data: "{\"info\":\"some data injected\"}".data(using: .utf8)!) public var fooData: Foo
    @LazyInjected public var fooLazy: Foo
    @OptionalInjected public var fooOptional: Foo?
    @Injected(foo: .init(info: "custom init via extension")) public var fooCustomInit: Foo
    
    public init() {}
}

extension Injected {
    init(foo: Foo) {
        self.init(arguments: foo)
    }
}
