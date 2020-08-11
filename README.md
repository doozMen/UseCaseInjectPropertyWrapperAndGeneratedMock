# @Injected and testing example 

This is an example project setup managing dependencies with property wrappers code while allowing fast writing of unit tests.

1. uses @Injected from [Resolver](https://github.com/hmlongco/Resolver) by @hmlongco
2. generates mocks using [Mockingbird](https://github.com/birdrides/mockingbird)

You could argue that the beauty of Swift is related to the compiler taking care of so many things. But this also causes problems, like boilerplate code.

* long init's  [medium blog `Swift5.1 Takes Dependency Injection to the Next Level`](https://link.medium.com/VLg9OZejM8 )
* writing a mock for a class or protocol  while upscaling the team can be challenging

So in this repo I experiment and explain what I struggled with when trying to use injection frameworks and writing independent tests. My struggles are:

1. Injection in Swift is not supported by the language. [Swinject](https://github.com/Swinject/Swinject) tries to give an alternative but it is very bulky and can cause in my opinion over complicated code
2. Injection relies on a `Resolver` singleton that is shared in the test, causing tests cases to depend on each other.

With this repo I want to explore if [Resolver](https://github.com/hmlongco/Resolver) and [Mockingbird](https://github.com/birdrides/mockingbird) might help me overcome this problem.

I start by explaining how to generate mocks and then explain the tests.

In the discussion a test is written with a `Controller` that has a private service property. As we do not want to do a network call in a test case in the test the service should not actually perform the request, in other words we would like to mock it out.

> If you like you could read [this nice article](https://medium.com/meetu-engineering/testing-mock-vs-stub-e3f948f6d211) explaining difference between Mocks and Stubs.

## Generate mocks with mockingbird

The nice guys @Bird helped me out quickly with a workaround to build without xcode. [detailed explanation here](https://github.com/birdrides/mockingbird/issues/164#issuecomment-671545345)

0. To install the generator, you’ll want to [download the prebuilt binary](https://github.com/birdrides/mockingbird/releases/tag/0.14.1) and either check that into your project, or make it a build step in your CI (see the [Makefile](https://github.com/birdrides/mockingbird/blob/master/Makefile#L306) for an example).
1. run bash script that generates xcode project and removes when done `./Scripts/workaroundMockingbird.sh`

## Discussion

I asume you know about property wrappers that where introduced in swift 5.1. If not head over to [an article from NSHipster](https://nshipster.com/propertywrapper/) explaining what it is and how it came to be.

In the test target I added some cases to showcase:

* what is @Injected and how does it use a Resolver?
* when generating mocks how to mock a protocol and do some tests on the mocked objects?

### @Injected use of Resolver

@Injected is a property wrapper that when compiled sets the value of the property to whatever is registered in the Resolver for the type of the property.

Unfortunately this means your tests depend on the state of `Resolver.main`. And just like it is no good to have your tests depend on a database or network state this dependency on `Resolver.main` is bad. One test could register something for a type and another test could overwrite that easily. But there is a way to overcome this problem by using a cached resolver.

> A [cached resolver](https://github.com/hmlongco/Resolver/blob/master/Documentation/Scopes.md#scope-cached) uses the factories of a type only once until you reset it.

```swift

func testResolvedViaInjectedPropertyWrapper() {
    // Have to use the resolver that is cached so we can reset it in every test
    Resolver.defaultScope = Resolver.cached
    // Set the static main resolver again. That is the resolver that will be used on injection
    Resolver.main = Resolver()

    // register some classes
}
```

So far we setup test with a `Resolver` to be able to pass our mocks when `@Injected` is compiled. But what does that mean?

Say we have a `Controller` that has a property that sets the `service` via `@Injected`. As an extra difficulty the `NetworkService` complies to protocol  `NetworkServiceable`. The way this would work was not obvious to me at first.

In our tests we can instantiate a mock according to [Mockingbird](https://github.com/birdrides/mockingbird) like so

```swift
let service: NetworkServiceableMock = mock(NetworkServiceable.self)

Resolver.register { service }.implementing(NetworkServiceable.self)
```

`Resolver.register { service }` registers a factory `{...}` to the resolver to be used by @Injected to instantiate the service on the property of our Controller object. The `.implementing(NetworkServiceable.self)` part makes it also work for a protocol and not only properties with type `NetworkService`.

Let's have a look at the controller

```swift
final class Controller {
    @Injected private var service: NetworkServiceable

    func loadData() { service.fetch() }
}
```

The `Controller` has a `private` property that will handle the service request. In the test we are going to write we would like to test:

> Is the `fetch` function called on the service when we call `loadData` on the `Controller`?

The mock that was registered for the service can be stubbed thanks to the generated code of mockingbird. Go a head and run the test and have a look at the full test.
