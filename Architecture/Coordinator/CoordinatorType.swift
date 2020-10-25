//
//  Coordinable.swift
//  Architecture
//
//  Created by Artem Kandaurov on 25/10/2020.
//

import ReactiveKit

protocol CoordinatorType: class {

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

    func coordinate<T: CoordinatorType, U>(
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

class CoordinatorNavigator {

    fileprivate var _childCoordinators = [AnyObject]()
    var childCoordinators: [AnyObject] {
        _childCoordinators
    }

    init() {}
}
