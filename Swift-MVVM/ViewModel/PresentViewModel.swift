//
//  PresentViewModel.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/10/09.
//

import Foundation

class PresentViewModel {
    init() {
        viewModelDidLoad()
    }
    
    deinit {
        print("PresentViewModel::deinit")
    }
    
    func viewModelDidLoad() {
        print("PresentViewModel::viewModelDidLoad")
    }
}
