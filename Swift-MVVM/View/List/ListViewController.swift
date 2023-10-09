//
//  ListViewController.swift
//  Swift-MVVM
//
//  Created by k2hoon on 2023/10/06.
//

import UIKit
import Combine

class ListViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(ListTableCell.self, forCellReuseIdentifier: ListTableCell.identifier)
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    private var viewModel: ListViewModel? = nil
    private var cancellable = Set<AnyCancellable>()
    
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
        self.bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel?.updateList()
    }
    
    private func setNavigationBar() {
        if let navigation = self.navigationController {
            self.title = "ListView"
            navigation.navigationBar.prefersLargeTitles = true
        }
    }
    
    private func layoutView() {
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func bindViewModel() {
        viewModel?.$users
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellable)
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension ListViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.users.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableCell.identifier, for: indexPath)
                as? ListTableCell else {
            return UITableViewCell()
        }
        cell.viewModel = getCellViewModel(indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

// MARK: - CellViewModelAllocator
extension ListViewController: CellViewModelAllocator {
    typealias CellViewModel = ListTableCellViewModel
    

    func getCellViewModel(indexPath: IndexPath) -> ListTableCellViewModel? {
        if let user = self.viewModel?.users[indexPath.row] {
            return ListTableCellViewModel(user: user)
        }
        return nil
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ListViewController_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            ListViewController(viewModel: ListViewModel(apiService: UserService()))
        }
    }
}
#endif
