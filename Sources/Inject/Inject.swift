public protocol Injectable {
    static var shared: Self { get }
}

@propertyWrapper
public class Inject<T> where T: Injectable {
    var value: T
    public init() {
        value = T.shared
    }
    
    public var wrappedValue: T {
        get { return value}
        set { value = newValue }
    }
}

