import XCTest
import Inject
import UseCaseInject

final class InjectTests: XCTestCase {
    
    @Inject var foo: Foo
    
    class Bar {
        @Inject var foo: Foo
    }
    
    func testOnlyOneFoo() {
        XCTAssertTrue(self.foo === Bar().foo)
    }
    
    func testSwiftSettingTEST() {
        XCTAssertEqual(self.foo.info, "module defines TEST")
    }

    static var allTests = [
        ("testOnlyOneFoo", testOnlyOneFoo),
    ]
}
