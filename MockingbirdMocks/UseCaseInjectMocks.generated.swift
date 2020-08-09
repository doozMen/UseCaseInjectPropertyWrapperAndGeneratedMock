//
//  UseCaseInjectMocks.generated.swift
//  UseCaseInject
//
//  Generated by Mockingbird v0.14.1.
//  DO NOT EDIT
//

@testable import Mockingbird
@testable import UseCaseInject
import Foundation
import Resolver
import Swift

private var genericTypesStaticMocks = Mockingbird.Synchronized<[String: Mockingbird.StaticMock]>([:])

// MARK: - Mocked Bar

public final class BarMock: UseCaseInject.Bar, Mockingbird.Mock {
  static let staticMock = Mockingbird.StaticMock()
  public let mockingContext = Mockingbird.MockingContext()
  public let stubbingContext = Mockingbird.StubbingContext()
  public let mockMetadata = Mockingbird.MockMetadata(["generator_version": "0.14.1", "module_name": "UseCaseInject"])
  public var sourceLocation: Mockingbird.SourceLocation? {
    get { return self.stubbingContext.sourceLocation }
    set {
      self.stubbingContext.sourceLocation = newValue
      BarMock.staticMock.stubbingContext.sourceLocation = newValue
    }
  }

  public enum InitializerProxy {
    public static func initialize(__file: StaticString = #file, __line: UInt = #line) -> BarMock {
      let mock: BarMock = BarMock()
      mock.sourceLocation = SourceLocation(__file, __line)
      return mock
    }
  }

  // MARK: Mocked foo

  override public var `foo`: UseCaseInject.Foo {
    get {
      let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "foo.get", arguments: [], returnType: Swift.ObjectIdentifier((UseCaseInject.Foo).self))
      return self.mockingContext.didInvoke(invocation) { () -> UseCaseInject.Foo in
        let implementation = self.stubbingContext.implementation(for: invocation)
        if let concreteImplementation = implementation as? () -> UseCaseInject.Foo {
          return concreteImplementation()
        } else if let defaultValue = self.stubbingContext.defaultValueProvider.provideValue(for: (UseCaseInject.Foo).self) {
          return defaultValue
        } else {
          fatalError(self.stubbingContext.failTest(for: invocation))
        }
      }
    }
    set {
      let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "foo.set", arguments: [ArgumentMatcher(newValue)], returnType: Swift.ObjectIdentifier(Void.self))
      self.mockingContext.didInvoke(invocation)
      let implementation = self.stubbingContext.implementation(for: invocation)
      if let concreteImplementation = implementation as? (UseCaseInject.Foo) -> Void {
        concreteImplementation(newValue)
      } else {
        (implementation as? () -> Void)?()
      }
    }
  }

  public func getFoo() -> Mockingbird.Mockable<Mockingbird.PropertyGetterDeclaration, () -> UseCaseInject.Foo, UseCaseInject.Foo> {
    let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "foo.get", arguments: [], returnType: Swift.ObjectIdentifier((UseCaseInject.Foo).self))
    return Mockingbird.Mockable<Mockingbird.PropertyGetterDeclaration, () -> UseCaseInject.Foo, UseCaseInject.Foo>(mock: self, invocation: invocation)
  }

  public func setFoo(_ newValue: @escaping @autoclosure () -> UseCaseInject.Foo) -> Mockingbird.Mockable<Mockingbird.PropertySetterDeclaration, (UseCaseInject.Foo) -> Void, Void> {
    let arguments: [Mockingbird.ArgumentMatcher] = [Mockingbird.resolve(newValue)]
    let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "foo.set", arguments: arguments, returnType: Swift.ObjectIdentifier(Void.self))
    return Mockingbird.Mockable<Mockingbird.PropertySetterDeclaration, (UseCaseInject.Foo) -> Void, Void>(mock: self, invocation: invocation)
  }

  // MARK: Mocked fooLazy

  override public var `fooLazy`: UseCaseInject.Foo {
    get {
      let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "fooLazy.get", arguments: [], returnType: Swift.ObjectIdentifier((UseCaseInject.Foo).self))
      return self.mockingContext.didInvoke(invocation) { () -> UseCaseInject.Foo in
        let implementation = self.stubbingContext.implementation(for: invocation)
        if let concreteImplementation = implementation as? () -> UseCaseInject.Foo {
          return concreteImplementation()
        } else if let defaultValue = self.stubbingContext.defaultValueProvider.provideValue(for: (UseCaseInject.Foo).self) {
          return defaultValue
        } else {
          fatalError(self.stubbingContext.failTest(for: invocation))
        }
      }
    }
    set {
      let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "fooLazy.set", arguments: [ArgumentMatcher(newValue)], returnType: Swift.ObjectIdentifier(Void.self))
      self.mockingContext.didInvoke(invocation)
      let implementation = self.stubbingContext.implementation(for: invocation)
      if let concreteImplementation = implementation as? (UseCaseInject.Foo) -> Void {
        concreteImplementation(newValue)
      } else {
        (implementation as? () -> Void)?()
      }
    }
  }

  public func getFooLazy() -> Mockingbird.Mockable<Mockingbird.PropertyGetterDeclaration, () -> UseCaseInject.Foo, UseCaseInject.Foo> {
    let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "fooLazy.get", arguments: [], returnType: Swift.ObjectIdentifier((UseCaseInject.Foo).self))
    return Mockingbird.Mockable<Mockingbird.PropertyGetterDeclaration, () -> UseCaseInject.Foo, UseCaseInject.Foo>(mock: self, invocation: invocation)
  }

  public func setFooLazy(_ newValue: @escaping @autoclosure () -> UseCaseInject.Foo) -> Mockingbird.Mockable<Mockingbird.PropertySetterDeclaration, (UseCaseInject.Foo) -> Void, Void> {
    let arguments: [Mockingbird.ArgumentMatcher] = [Mockingbird.resolve(newValue)]
    let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "fooLazy.set", arguments: arguments, returnType: Swift.ObjectIdentifier(Void.self))
    return Mockingbird.Mockable<Mockingbird.PropertySetterDeclaration, (UseCaseInject.Foo) -> Void, Void>(mock: self, invocation: invocation)
  }

  // MARK: Mocked fooOptional

  override public var `fooOptional`: UseCaseInject.Foo? {
    get {
      let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "fooOptional.get", arguments: [], returnType: Swift.ObjectIdentifier((UseCaseInject.Foo?).self))
      return self.mockingContext.didInvoke(invocation) { () -> UseCaseInject.Foo? in
        let implementation = self.stubbingContext.implementation(for: invocation)
        if let concreteImplementation = implementation as? () -> UseCaseInject.Foo? {
          return concreteImplementation()
        } else if let defaultValue = self.stubbingContext.defaultValueProvider.provideValue(for: (UseCaseInject.Foo?).self) {
          return defaultValue
        } else {
          fatalError(self.stubbingContext.failTest(for: invocation))
        }
      }
    }
    set {
      let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "fooOptional.set", arguments: [ArgumentMatcher(newValue)], returnType: Swift.ObjectIdentifier(Void.self))
      self.mockingContext.didInvoke(invocation)
      let implementation = self.stubbingContext.implementation(for: invocation)
      if let concreteImplementation = implementation as? (UseCaseInject.Foo?) -> Void {
        concreteImplementation(newValue)
      } else {
        (implementation as? () -> Void)?()
      }
    }
  }

  public func getFooOptional() -> Mockingbird.Mockable<Mockingbird.PropertyGetterDeclaration, () -> UseCaseInject.Foo?, UseCaseInject.Foo?> {
    let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "fooOptional.get", arguments: [], returnType: Swift.ObjectIdentifier((UseCaseInject.Foo?).self))
    return Mockingbird.Mockable<Mockingbird.PropertyGetterDeclaration, () -> UseCaseInject.Foo?, UseCaseInject.Foo?>(mock: self, invocation: invocation)
  }

  public func setFooOptional(_ newValue: @escaping @autoclosure () -> UseCaseInject.Foo?) -> Mockingbird.Mockable<Mockingbird.PropertySetterDeclaration, (UseCaseInject.Foo?) -> Void, Void> {
    let arguments: [Mockingbird.ArgumentMatcher] = [Mockingbird.resolve(newValue)]
    let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "fooOptional.set", arguments: arguments, returnType: Swift.ObjectIdentifier(Void.self))
    return Mockingbird.Mockable<Mockingbird.PropertySetterDeclaration, (UseCaseInject.Foo?) -> Void, Void>(mock: self, invocation: invocation)
  }

  // MARK: Mocked init()

  public required override init() {
    super.init()
    Mockingbird.checkVersion(for: self)
    let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "init() ", arguments: [], returnType: Swift.ObjectIdentifier((Void).self))
    self.mockingContext.didInvoke(invocation)
  }
}

/// Returns an abstract mock which should be initialized using `mock(Bar.self).initialize(…)`.
public func mock(_ type: UseCaseInject.Bar.Type, file: StaticString = #file, line: UInt = #line) -> BarMock.InitializerProxy.Type {
  return BarMock.InitializerProxy.self
}

// MARK: - Mocked Controller

public final class ControllerMock: UseCaseInject.Controller, Mockingbird.Mock {
  static let staticMock = Mockingbird.StaticMock()
  public let mockingContext = Mockingbird.MockingContext()
  public let stubbingContext = Mockingbird.StubbingContext()
  public let mockMetadata = Mockingbird.MockMetadata(["generator_version": "0.14.1", "module_name": "UseCaseInject"])
  public var sourceLocation: Mockingbird.SourceLocation? {
    get { return self.stubbingContext.sourceLocation }
    set {
      self.stubbingContext.sourceLocation = newValue
      ControllerMock.staticMock.stubbingContext.sourceLocation = newValue
    }
  }

  // MARK: Mocked service

  override public var `service`: UseCaseInject.ServiceProtocol {
    get {
      let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "service.get", arguments: [], returnType: Swift.ObjectIdentifier((UseCaseInject.ServiceProtocol).self))
      return self.mockingContext.didInvoke(invocation) { () -> UseCaseInject.ServiceProtocol in
        let implementation = self.stubbingContext.implementation(for: invocation)
        if let concreteImplementation = implementation as? () -> UseCaseInject.ServiceProtocol {
          return concreteImplementation()
        } else if let defaultValue = self.stubbingContext.defaultValueProvider.provideValue(for: (UseCaseInject.ServiceProtocol).self) {
          return defaultValue
        } else {
          fatalError(self.stubbingContext.failTest(for: invocation))
        }
      }
    }
    set {
      let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "service.set", arguments: [ArgumentMatcher(newValue)], returnType: Swift.ObjectIdentifier(Void.self))
      self.mockingContext.didInvoke(invocation)
      let implementation = self.stubbingContext.implementation(for: invocation)
      if let concreteImplementation = implementation as? (UseCaseInject.ServiceProtocol) -> Void {
        concreteImplementation(newValue)
      } else {
        (implementation as? () -> Void)?()
      }
    }
  }

  public func getService() -> Mockingbird.Mockable<Mockingbird.PropertyGetterDeclaration, () -> UseCaseInject.ServiceProtocol, UseCaseInject.ServiceProtocol> {
    let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "service.get", arguments: [], returnType: Swift.ObjectIdentifier((UseCaseInject.ServiceProtocol).self))
    return Mockingbird.Mockable<Mockingbird.PropertyGetterDeclaration, () -> UseCaseInject.ServiceProtocol, UseCaseInject.ServiceProtocol>(mock: self, invocation: invocation)
  }

  public func setService(_ newValue: @escaping @autoclosure () -> UseCaseInject.ServiceProtocol) -> Mockingbird.Mockable<Mockingbird.PropertySetterDeclaration, (UseCaseInject.ServiceProtocol) -> Void, Void> {
    let arguments: [Mockingbird.ArgumentMatcher] = [Mockingbird.resolve(newValue)]
    let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "service.set", arguments: arguments, returnType: Swift.ObjectIdentifier(Void.self))
    return Mockingbird.Mockable<Mockingbird.PropertySetterDeclaration, (UseCaseInject.ServiceProtocol) -> Void, Void>(mock: self, invocation: invocation)
  }

  fileprivate init(sourceLocation: Mockingbird.SourceLocation) {
    super.init()
    Mockingbird.checkVersion(for: self)
    self.sourceLocation = sourceLocation
  }
}

/// Returns a concrete mock of `Controller`.
public func mock(_ type: UseCaseInject.Controller.Type, file: StaticString = #file, line: UInt = #line) -> ControllerMock {
  return ControllerMock(sourceLocation: Mockingbird.SourceLocation(file, line))
}

// MARK: - Mocked Foo

public final class FooMock: UseCaseInject.Foo, Mockingbird.Mock {
  static let staticMock = Mockingbird.StaticMock()
  public let mockingContext = Mockingbird.MockingContext()
  public let stubbingContext = Mockingbird.StubbingContext()
  public let mockMetadata = Mockingbird.MockMetadata(["generator_version": "0.14.1", "module_name": "UseCaseInject"])
  public var sourceLocation: Mockingbird.SourceLocation? {
    get { return self.stubbingContext.sourceLocation }
    set {
      self.stubbingContext.sourceLocation = newValue
      FooMock.staticMock.stubbingContext.sourceLocation = newValue
    }
  }

  public enum InitializerProxy {
    public static func initialize(`from` `decoder`: Decoder, __file: StaticString = #file, __line: UInt = #line) throws -> FooMock {
      let mock: FooMock = try FooMock(from: `decoder`)
      mock.sourceLocation = SourceLocation(__file, __line)
      return mock
    }

    public static func initialize(`info`: String, __file: StaticString = #file, __line: UInt = #line) -> FooMock {
      let mock: FooMock = FooMock(info: `info`)
      mock.sourceLocation = SourceLocation(__file, __line)
      return mock
    }
  }

  // MARK: Mocked init(`from` `decoder`: Decoder)

  public required init(`from` `decoder`: Decoder) throws {
    try super.init(from: `decoder`)
    Mockingbird.checkVersion(for: self)
    let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "init(`from` `decoder`: Decoder) throws ", arguments: [Mockingbird.ArgumentMatcher(`decoder`)], returnType: Swift.ObjectIdentifier((Void).self))
    self.mockingContext.didInvoke(invocation)
  }

  // MARK: Mocked init(`info`: String)

  public required override init(`info`: String) {
    super.init(info: `info`)
    Mockingbird.checkVersion(for: self)
    let invocation: Mockingbird.Invocation = Mockingbird.Invocation(selectorName: "init(`info`: String) ", arguments: [Mockingbird.ArgumentMatcher(`info`)], returnType: Swift.ObjectIdentifier((Void).self))
    self.mockingContext.didInvoke(invocation)
  }
}

/// Returns an abstract mock which should be initialized using `mock(Foo.self).initialize(…)`.
public func mock(_ type: UseCaseInject.Foo.Type, file: StaticString = #file, line: UInt = #line) -> FooMock.InitializerProxy.Type {
  return FooMock.InitializerProxy.self
}

// MARK: - Mocked ServiceProtocol

public final class ServiceProtocolMock: UseCaseInject.ServiceProtocol, Mockingbird.Mock {
  static let staticMock = Mockingbird.StaticMock()
  public let mockingContext = Mockingbird.MockingContext()
  public let stubbingContext = Mockingbird.StubbingContext()
  public let mockMetadata = Mockingbird.MockMetadata(["generator_version": "0.14.1", "module_name": "UseCaseInject"])
  public var sourceLocation: Mockingbird.SourceLocation? {
    get { return self.stubbingContext.sourceLocation }
    set {
      self.stubbingContext.sourceLocation = newValue
      ServiceProtocolMock.staticMock.stubbingContext.sourceLocation = newValue
    }
  }

  fileprivate init(sourceLocation: Mockingbird.SourceLocation) {
    Mockingbird.checkVersion(for: self)
    self.sourceLocation = sourceLocation
  }
}

/// Returns a concrete mock of `ServiceProtocol`.
public func mock(_ type: UseCaseInject.ServiceProtocol.Protocol, file: StaticString = #file, line: UInt = #line) -> ServiceProtocolMock {
  return ServiceProtocolMock(sourceLocation: Mockingbird.SourceLocation(file, line))
}

// MARK: - Mocked Service

public final class ServiceMock: UseCaseInject.Service, Mockingbird.Mock {
  static let staticMock = Mockingbird.StaticMock()
  public let mockingContext = Mockingbird.MockingContext()
  public let stubbingContext = Mockingbird.StubbingContext()
  public let mockMetadata = Mockingbird.MockMetadata(["generator_version": "0.14.1", "module_name": "UseCaseInject"])
  public var sourceLocation: Mockingbird.SourceLocation? {
    get { return self.stubbingContext.sourceLocation }
    set {
      self.stubbingContext.sourceLocation = newValue
      ServiceMock.staticMock.stubbingContext.sourceLocation = newValue
    }
  }

  fileprivate init(sourceLocation: Mockingbird.SourceLocation) {
    super.init()
    Mockingbird.checkVersion(for: self)
    self.sourceLocation = sourceLocation
  }
}

/// Returns a concrete mock of `Service`.
public func mock(_ type: UseCaseInject.Service.Type, file: StaticString = #file, line: UInt = #line) -> ServiceMock {
  return ServiceMock(sourceLocation: Mockingbird.SourceLocation(file, line))
}
