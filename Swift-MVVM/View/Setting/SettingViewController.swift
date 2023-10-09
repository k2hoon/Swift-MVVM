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
        
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.title = "Open"
        button.configuration = config
        button.addTarget(self, action: #selector(openViewController), for: .touchUpInside)
        
        self.view.addSubview(label)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: label.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16)
        ])
    }
    
    @objc private func openViewController() {
        let viewController = PresentViewController()
        self.present(viewController, animated: true)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct SettingViewController_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            SettingViewController(viewModel: SettingViewModel())
        }
    }
}
#endif
