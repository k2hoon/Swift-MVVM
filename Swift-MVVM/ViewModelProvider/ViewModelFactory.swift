//
//  ViewModelFactory.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/09/30.
//

import Foundation

protocol ViewModelFactory {
    func create<VM: ViewModel>() -> VM?
}
