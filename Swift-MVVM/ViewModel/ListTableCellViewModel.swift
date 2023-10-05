//
//  ListTableCellViewModel.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/10/06.
//

import Foundation

final class ListTableCellViewModel {
    var name: String = ""
    
    private let user: User
    
    init(user: User) {
        self.user = user
        self.name = user.name
    }
}
