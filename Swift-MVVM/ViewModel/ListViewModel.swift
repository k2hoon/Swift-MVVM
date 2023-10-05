//
//  ListViewModel.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/10/06.
//

import Foundation
import Combine

class ListViewModel {
    @Published private(set) var users = [User]()
    
    private var apiService: UserService? = nil
    private var cancellable = Set<AnyCancellable>()
    
    init(apiService: UserService) {
        self.apiService = apiService
        viewModelDidLoad()
    }
    
    func updateList() {
        self.loadUsers()
    }
    
    func viewModelDidLoad() {
        print("ListViewModel::viewModelDidLoad")
    }
}

extension ListViewModel {
    private func loadUsers() {
        let completionHandler: (Subscribers.Completion<Error>) -> Void = { completion in
            print(completion)
        }
        
        let valueHandler: ([User]) -> Void = { [weak self] value in
            self?.users = value
        }
        
        self.apiService?.fetchUsers()
            .sink(receiveCompletion: completionHandler, receiveValue: valueHandler)
            .store(in: &cancellable)
    }
}
