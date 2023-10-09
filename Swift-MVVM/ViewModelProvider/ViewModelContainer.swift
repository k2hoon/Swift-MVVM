//
//  ViewModelContainer.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/09/30.
//

import Foundation

final class ViewModelContainer {
    private var container = [String: ViewModel]()
    
    subscript(key: String) -> ViewModel? {
        get { self.container[key] }
        set { self.container[key] = newValue }
    }
    
    func clearAll() {
        container.removeAll()
    }
    
    func remove(for value: ViewModel?) {
        if let key = container.first(where: { $1 === value })?.key {
            container[key] = nil
        }
    }
}

extension ViewModelContainer {
    static func generate(for context: ViewModelContext) -> ViewModelContainer {
        if let containter = context.viewModelContainer {
            return containter
        } else {
            let container = ViewModelContainer()
            context.viewModelContainer = container
            return container
        }
    }
}
