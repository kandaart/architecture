//
//  ModelConvertible.swift
//  Architecture
//
//  Created by Artem Kandaurov on 25/10/2020.
//

import Foundation

protocol ModelConvertible {

    associatedtype Entity
    associatedtype Model

    func model(from entity: Entity) -> Model?
}
