//
//  ViewType.swift
//  Architecture
//
//  Created by Artem Kandaurov on 25/10/2020.
//

import Foundation

public protocol ViewType: Presentable {

    associatedtype ViewInput
    associatedtype ViewOutput

    var viewInputs: ViewInput { get }
    var viewOutputs: ViewOutput { get }
}
