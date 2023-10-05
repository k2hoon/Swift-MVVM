//
//  SettingViewController.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/10/06.
//

import UIKit

class SettingViewController: UIViewController {
    var viewModel: SettingViewModel? = nil
    
    init(viewModel: SettingViewModel? = nil) {
        print("SettingViewController::init")
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("SettingViewController::deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.setNavigationBar()
        self.layoutView()
    }
    
    private func setNavigationBar() {
        if let navigation = self.navigationController {
            self.title = "Setting"
            navigation.navigationBar.prefersLargeTitles = true
        }
    }
    
    /// Used to temporarily display a view controller class
    private func layoutView() {
        let label = UILabel()
        label.text = "SettingViewController"
        label.sizeToFit()
        label.center = self.view.center
        
        self.view.addSubview(label)
    }
}
