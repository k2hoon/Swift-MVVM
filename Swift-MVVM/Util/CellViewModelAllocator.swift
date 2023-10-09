//
//  CellViewModelAllocator.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/10/09.
//

import UIKit

protocol CellViewModelAllocator {
    associatedtype CellViewModel
    
    func getCellViewModel(indexPath: IndexPath) -> CellViewModel?
}
