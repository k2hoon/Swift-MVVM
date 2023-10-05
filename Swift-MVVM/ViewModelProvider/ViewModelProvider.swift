//
//  ViewModelProvider.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/09/30.
//

import UIKit

final class ViewModelProvider {
    private let factory: ViewModelFactory
    private var container: ViewModelContainer
    
    init(factory: ViewModelFactory, container: ViewModelContainer) {
        self.factory = factory
        self.container = container
    }
    
    func get<VM: ViewModel>(_ type: VM.Type) -> VM? {
        let key = String(describing: type.self)
        if let viewModel = container[key] as? VM {
            return viewModel
        }
        
        guard let viewModel: VM = factory.create() else {
            return nil
        }
        container[key] = viewModel
        return viewModel
    }
}

extension ViewModelProvider {
    static func of(_ context: ViewModelContext, _ factory: ViewModelFactory) -> ViewModelProvider {
        return ViewModelProvider(factory: factory, container: ViewModelContainer.generate(for: context))
    }
}
