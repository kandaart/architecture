# Architecture

Welcome to the framework describing a skeleton for MVVM-C architecture.

## Install

### Swift Package Manager

Add following code to the `Package.swift` file and update dependencies.
```swift
dependencies: [
    .package(name: "Architecture", url: "https://github.com/kandaart/architecture.git", from: "2.0.0"),
    ...
],
targets: [
    .target(
        name: "MyProject",
        dependencies: [..., "Architecture"]
    ),
    ...
]
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) support is deprecated in version 2.0.0. To use previous versions: add following line to the `Cartfile`, update dependencies and link the Architecture framework.
```bash
github "kandaart/architecture" == 1.0.0
```

## Git flow

Please, follow the Git branching model described [here](https://nvie.com/posts/a-successful-git-branching-model/).
