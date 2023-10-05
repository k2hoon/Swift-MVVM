//
//  NetworkError.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/10/06.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case decode
    case other(message: String)
}
