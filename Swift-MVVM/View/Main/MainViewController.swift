//
//  MainViewController.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/09/30.
//

import UIKit

class MainViewController: UIViewController {
    var viewModel: MainViewModel? = nil
    
    init(viewModel: MainViewModel? = nil) {
        print("MainViewController::init")
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("MainViewController::deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.setNavigationBar()
        self.layoutView()
    }
    
    private func setNavigationBar() {
        if let navigation = self.navigationController {
            self.title = "MainView"
            navigation.navigationBar.prefersLargeTitles = true
        }
    }
    
    /// Used to temporarily display a view controller class
    private func layoutView() {
        let label = UILabel()
        label.text = "MainViewController"
        label.sizeToFit()
        label.center = self.view.center
        
        self.view.addSubview(label)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MainViewController_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            MainViewController()
        }
    }
}
#endif
