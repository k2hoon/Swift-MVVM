//
//  AppViewModelFactory.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/10/06.
//

import Foundation

final class AppViewModelFactory: ViewModelFactory {
    func create<VM>() -> VM? {
        switch VM.self {
        case is MainViewModel.Type: return MainViewModel() as? VM
        case is ListViewModel.Type: return ListViewModel() as? VM
        case is SettingViewModel.Type: return SettingViewModel() as? VM
        default:
            return nil
        }
    }
}
