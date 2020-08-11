import XCTest
import UseCaseInject
import Resolver
import Mockingbird
@testable import MockingbirdMocks

final class InjectTests: XCTestCase {
    
    let testInfo = "some test info"
    
    override func setUp() {
        super.setUp()
        // Have to use the resolver that is cached so we can reset it in every test
        Resolver.defaultScope = Resolver.cached
        // Set the static main resolver again. That is the resolver that will be used on injection
        Resolver.main = Resolver()
    }
    
    override func tearDown() {
        // reset is needed otherwise lingering registers might make tests depended
        // For example
        // 1. comment out reset line
        // 2. run only test testInjectedProtocol_mocked => it should succeed
        // 2.1 run all tests => testInjectedProtocol_mocked failes
        // 3. add this line again and all will work
        Resolver.cached.reset()
        super.tearDown()
    }
    
    func testResolvedViaInjectedPropertyWrapper() {
        Resolver.registerServices = {
            Resolver.register(Foo.self, name: "FooDataArgument") {
                do {
                    return try JSONDecoder().decode(Foo.self, from: "{\"info\":\"\(self.testInfo)\"}".data(using: .utf8)!)
                } catch {
                    fatalError("\(error)")
                }
            }
            
            Resolver.register(Foo.self, name: "FooArguments") { _, foo in
                return foo()
            }
            
            Resolver.register(Foo.self) {
                return Foo(info: "Foo from a type, without arguments")
            }
        }
        let bar = Bar()
        
        XCTAssertEqual(bar.foo.info, "Foo from a type, without arguments")
        XCTAssertEqual(bar.fooLazy.info, "Foo from a type, without arguments")
        XCTAssertEqual(bar.fooOptional?.info, "Foo from a type, without arguments")
        XCTAssertEqual(bar.fooData.info, testInfo)
        XCTAssertEqual(bar.fooCustomInit.info, "custom init via extension")
    }
    
    func testInjectedProtocol() {
        Resolver.registerServices = {
            Resolver.register { NetworkService() }.implements(NetworkServicable.self)
        }
        
        let c1 = Controller()
        let c2 = Controller()
        
        XCTAssertTrue(c1.service === c2.service)
    }
    
    func testInjectedProtocol_mocked() {
        let mockService: NetworkServicableMock = mock(NetworkServicable.self)
        
        Resolver.registerServices = {
            Resolver.register { mockService }.implements(NetworkServicable.self)
        }
        
        let c1 = Controller()
        
        XCTAssertTrue(c1.service === mockService)
        given(mockService.fetch()).willReturn()
        
        c1.loadData()
        
        verify(mockService.fetch()).wasCalled()
    }

    static var allTests = [
        ("testResolvedViaInjectedPropertyWrapper", testResolvedViaInjectedPropertyWrapper,
         "testInjectedProtocol_mocked", testInjectedProtocol_mocked),
    ]
}

extension String: Swift.Error {
    
}
