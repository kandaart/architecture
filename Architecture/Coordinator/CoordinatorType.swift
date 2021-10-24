//
//  Coordinable.swift
//  Architecture
//
//  Created by Artem Kandaurov on 25/10/2020.
//

import ReactiveKit

public protocol CoordinatorType: AnyObject {

    associatedtype CoordinatorInput
    associatedtype CoordinatorResult

    var navigator: CoordinatorNavigator { get }

    func start(with input: CoordinatorInput) -> SafeSignal<CoordinatorResult>
}

extension CoordinatorType {

    private func store<T: CoordinatorType>(coordinator: T) {
        navigator._childCoordinators.append(coordinator)
    }

    private func free<T: CoordinatorType>(coordinator: T) {
        navigator._childCoordinators = navigator._childCoordinators.filter { $0 !== (coordinator as AnyObject) }
    }

    public func coordinate<T: CoordinatorType, U>(
        to coordinator: T,
        input: T.CoordinatorInput
    ) -> SafeSignal<U> where U == T.CoordinatorResult {
        store(coordinator: coordinator)

        return coordinator.start(with: input)
            .handleEvents(receiveCompletion: { [weak self] _ in
                self?.free(coordinator: coordinator)
            })
    }
}

public class CoordinatorNavigator {

    fileprivate var _childCoordinators = [AnyObject]()
    var childCoordinators: [AnyObject] {
        _childCoordinators
    }

    public init() {}
}
