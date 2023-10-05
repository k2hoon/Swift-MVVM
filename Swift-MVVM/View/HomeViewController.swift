//
//  HomeViewController.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/10/06.
//

import UIKit

class HomeViewController: UITabBarController {
    lazy var mainView: UIViewController = {
        let viewModel = ViewModelProvider.of(self, AppViewModelFactory()).get(MainViewModel.self)
        let vc = UINavigationController(rootViewController: MainViewController(viewModel: viewModel))
        vc.tabBarItem = UITabBarItem(title: "Main", image: UIImage(systemName: "1.circle"), tag: 0)
        return vc
    }()
    
    lazy var listView: UIViewController = {
        let viewModel = ViewModelProvider.of(self, AppViewModelFactory()).get(ListViewModel.self)
        let vc = UINavigationController(rootViewController: ListViewController(viewModel: viewModel))
        vc.tabBarItem = UITabBarItem(title: "List", image: UIImage(systemName: "2.circle"), tag: 0)
        return vc
    }()
    
    lazy var settingView: UIViewController = {
        let viewModel = ViewModelProvider.of(self, AppViewModelFactory()).get(SettingViewModel.self)
        let vc = UINavigationController(rootViewController: SettingViewController(viewModel: viewModel))
        vc.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "3.circle"), tag: 0)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.prepareViewControllers()
    }
    
    func prepareViewControllers() {
        self.viewControllers = [mainView, listView, settingView]
    }
}
