import XCTest
import UseCaseInject
import Resolver


protocol UniqueInjectedProtocol: class {
    
}

class ServiceUnique: UniqueInjectedProtocol {
    
}

class Controller {
    @Injected var serviceUnique: UniqueInjectedProtocol 
}

class Service: UniqueInjectedProtocol {
    
}

final class InjectTests: XCTestCase {
    
    let testInfo = "some test info"
    
    override func setUp() {
        
        Resolver.register(Foo.self) { [weak self] in
            do {
                return try JSONDecoder().decode(Foo.self, from: "{\"info\":\"\(self!.testInfo)\"}".data(using: .utf8)!)
            } catch {
                fatalError("\(error)")
            }
        }
        
        Resolver.register(Foo.self, name: "\(Foo.self)DataArgument") { (resolver, arguments) in
            
            do {
                return try JSONDecoder().decode(Foo.self, from: arguments())
            } catch {
                fatalError("\(error)")
            }
        }
        
        Resolver.register(Foo.self, name: "\(Foo.self)Arguments") { (resolver, arguments) in
            arguments()
        }
        
        super.setUp()
    }
    
    
    func testResolvedViaInjectedPropertyWrapper() {
        let bar = Bar()
        
        XCTAssertEqual(bar.foo.info, testInfo)
        XCTAssertEqual(bar.fooLazy.info, testInfo)
        XCTAssertEqual(bar.fooOptional?.info, testInfo)
        XCTAssertEqual(bar.fooData.info, "some data injected")
        XCTAssertEqual(bar.fooCustomInit.info, "custom init via extension")
    }
    
    func testUniqueInjectedProtocol() {
        
        Resolver.defaultScope = Resolver.application
        Resolver.main = Resolver()
        Resolver.root = Resolver.main
        
        Resolver.register { Service() }.implements(UniqueInjectedProtocol.self)
        
        let c1 = Controller()
        let c2 = Controller()
        
        XCTAssertTrue(c1.serviceUnique === c2.serviceUnique)
    }

    static var allTests = [
        ("testResolvedViaInjectedPropertyWrapper", testResolvedViaInjectedPropertyWrapper),
    ]
}

extension String: Swift.Error {
    
}
