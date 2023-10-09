//
//  PresentViewController.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/10/09.
//

import UIKit

class PresentViewController: UIViewController {
    var viewModel: PresentViewModel? = nil
    
    init() {
        print("PresentViewController::init")
        super.init(nibName: nil, bundle: nil)
        self.viewModel = ViewModelProvider.of(self, AppViewModelFactory()).get(PresentViewModel.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("PresentViewController::deinit")
        self.viewModelContainer?.remove(for: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.layoutView()
        
    }
    
    private func layoutView() {
        let label = UILabel()
        label.text = "PresentViewController"
        label.sizeToFit()
        label.center = self.view.center
        self.view.addSubview(label)
    }
}
