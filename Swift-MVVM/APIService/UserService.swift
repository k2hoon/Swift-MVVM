//
//  UserService.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/10/06.
//

import Foundation
import Combine

protocol UserAPI {
    func fetchUsers() -> AnyPublisher<[User], Error>
}

final class UserService: UserAPI, NetworkHandler {
    func fetchUsers() -> AnyPublisher<[User], Error> {
        guard let url = URL(string: APIEndPoint.user) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global())
            .tryMap(reponseHandler(element:))
            .mapError(errorHandler(error:))
            .eraseToAnyPublisher()
    }
}
