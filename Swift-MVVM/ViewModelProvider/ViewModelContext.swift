//
//  ViewModelContext.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/09/30.
//

import UIKit

typealias ViewModel = AnyObject
typealias ViewModelContext = UIViewController

extension ViewModelContext {
    private struct AssociatedKeys {
        static var viewModelKey = "kAssociateViewModel"
    }
    
    var viewModelContainer: ViewModelContainer? {
        get { objc_getAssociatedObject(self, &AssociatedKeys.viewModelKey) as? ViewModelContainer }
        set { objc_setAssociatedObject(self, &AssociatedKeys.viewModelKey, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
}
