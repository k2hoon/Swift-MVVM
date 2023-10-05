//
//  NetworkHandler.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/10/06.
//

import Foundation

protocol NetworkHandler {
    func errorHandler(error: Error) -> NetworkError
    
    func reponseHandler<T: Decodable>(element: URLSession.DataTaskPublisher.Output) throws -> T
}

extension NetworkHandler{
    func errorHandler(error: Error) -> NetworkError {
        return NetworkError.other(message: error.localizedDescription)
    }
    
    func reponseHandler<T>(element: URLSession.DataTaskPublisher.Output) throws -> T where T : Decodable {
        guard let response = element.response as? HTTPURLResponse,
              (200..<300) ~=  response.statusCode else {
            throw NetworkError.other(message: "client error")
        }
        
        guard let data = try? JSONDecoder().decode(T.self, from: element.data) else {
            throw NetworkError.decode
        }
        
        return data
    }
}
