import XCTest
import UseCaseInject
import Resolver
import Mockingbird

final class InjectTests: XCTestCase {
    
    let testInfo = "some test info"
    
    override func setUp() {
        
        Resolver.registerServices = {
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
        }
        
        super.setUp()
    }
    
    
    func testResolvedViaInjectedPropertyWrapper() {
        let bar = Bar()
        
        XCTAssertEqual(bar.foo.info, testInfo)
        XCTAssertEqual(bar.fooLazy.info, testInfo)
        XCTAssertEqual(bar.fooOptional?.info, testInfo)
    }
    
    func testUniqueInjectedProtocol() {
        
        Resolver.defaultScope = Resolver.application
        Resolver.main = Resolver()
        
        Resolver.registerServices = {
            Resolver.register { Service() }.implements(ServiceProtocol.self)
        }
        
        let c1 = Controller()
        let c2 = Controller()
        
        XCTAssertTrue(c1.service === c2.service)
    }
    
    func testUniqueInjectedProtocol_mocked() {
        
        Resolver.defaultScope = Resolver.application
        Resolver.main = Resolver()
        
        let mockService: ServiceProtocolMock = mock(ServiceProtocol.self)
        
        Resolver.registerServices = {
            Resolver.register { mockService }.implements(ServiceProtocol.self)
        }
        
        let c1 = Controller()
        let c2 = Controller()
        
        XCTAssertTrue(c1.service === c2.service)
    }

    static var allTests = [
        ("testResolvedViaInjectedPropertyWrapper", testResolvedViaInjectedPropertyWrapper),
    ]
}

extension String: Swift.Error {
    
}
