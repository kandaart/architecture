//
//  ViewModelBindable.swift
//  Architecture
//
//  Created by Artem Kandaurov on 25/10/2020.
//

import UIKit

protocol ViewModelBindable: class, Presentable {

    associatedtype ViewModel: ViewModelType

    var viewModelInputs: ViewModel.Input { get }
    var viewModel: ViewModel! { get set } // swiftlint:disable:this implicitly_unwrapped_optional

    func bindViewModel(assembler: ViewModelAssembler<ViewModel>) -> ViewModel
    func setupOutputBindings()
    static func create() -> Self
}

extension ViewModelBindable where Self: UIViewController {

    @discardableResult
    func bindViewModel(assembler: ViewModelAssembler<ViewModel>) -> ViewModel {
        viewModel = assembler.resolve(binding: viewModelInputs)
        loadViewIfNeeded()
        setupUI()
        setupOutputBindings()
        return viewModel
    }

    static func create() -> Self {
        return self.init()
    }
}
