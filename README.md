# @Injected and testing example 

This is an example project setup managing dependencies in production code while allowing fast writing of unit tests.

1. use @Injected from [Resolver](https://github.com/hmlongco/Resolver) by @hmlongco
2. mock using [Mockingbird](https://github.com/birdrides/mockingbird)

The beauty of swift is related to te compiler taking care of so many things. The problem is that this sometimes causes us having us to write a lot of boilerplate code. This is so for `init` and when you try to write mocks. The `init` problem is described well by @hmlognco in [medium blog `Swift5.1 Takes Dependency Injection to the Next Level`](https://link.medium.com/VLg9OZejM8 ).
For mocks there is the manual option. But as described and solved by  [Mockingbird](https://github.com/birdrides/mockingbird) this does not scale well as you add team members and code changes, then maintaining the manual mocks becomes a hassle.

In this repo there is no new code. Just a 
