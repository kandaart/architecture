//
//  ModalCoordinatorResult.swift
//  Architecture
//
//  Created by Artem Kandaurov on 25/10/2020.
//

import Foundation

enum ModalCoordinatorResult<T> {
    case dismissed(withGesture: Bool)
    case finished(T)
}
