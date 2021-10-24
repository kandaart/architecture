//
//  PushCoordinatorResult.swift
//  Architecture
//
//  Created by Artem Kandaurov on 25/10/2020.
//

import Foundation

public enum PushCoordinatorResult<T> {
    case popped(withGesture: Bool)
    case finished(T)
}
