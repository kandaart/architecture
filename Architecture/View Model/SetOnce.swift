//
//  SetOnce.swift
//  Architecture
//
//  Created by Artem Kandaurov on 25/10/2020.
//

import Foundation

@propertyWrapper
public class setOnce<Value> { // swiftlint:disable:this type_name

    public var wrappedValue: Value? {
        didSet {
            assert(oldValue == nil, "Not allowed to re-assign value when using @SetOnce!")
        }
    }

    public init() {}
}
