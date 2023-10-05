//
//  ListViewController.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/10/06.
//

import Foundation

class ListViewController: UIViewController {
    var viewModel: ListViewModel? = nil
    
    init(viewModel: ListViewModel? = nil) {
        print("ListViewController::init")
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("ListViewController::deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.setNavigationBar()
        self.layoutView()
    }
    
    private func setNavigationBar() {
        if let navigation = self.navigationController {
            self.title = "ListView"
            navigation.navigationBar.prefersLargeTitles = true
        }
    }
    
    /// Used to temporarily display a view controller class
    private func layoutView() {
        let label = UILabel()
        label.text = "ListViewController"
        label.sizeToFit()
        label.center = self.view.center
        
        self.view.addSubview(label)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ListViewController_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            ListViewController()
            
        }
    }
}
#endif
