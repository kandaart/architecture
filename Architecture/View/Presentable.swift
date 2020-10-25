//
//  Presentable.swift
//  Architecture
//
//  Created by Artem Kandaurov on 25/10/2020.
//

import Foundation

public protocol Presentable {

    func setupContent()
    func arrangeSubviews()
    func layout()
}

public extension Presentable {

    func setupUI() {
        setupContent()
        arrangeSubviews()
        layout()
    }
}
