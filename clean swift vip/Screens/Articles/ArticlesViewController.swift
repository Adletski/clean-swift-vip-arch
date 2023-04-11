//
//  ArticlesViewController.swift
//  clean swift vip
//
//  Created by Adlet Zhantassov on 09.04.2023.
//

import UIKit

protocol ArticlesDisplayLogic: AnyObject {
    func displayData(data: [ArticleCellModel])
}

class ArticlesViewController: UIViewController, ArticlesDisplayLogic {
    
    var interactor: ArticlesBusinessLogic?
    var dataToDisplay: [ArticleCellModel] = []
    
    private let tableView: UITableView = {
       let tableView = UITableView()
       tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setup()
    }
    
    func setup() {
        let viewController = self
        let presenter = ArticlesPresenter()
        let interactor = ArticlesInteractor()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        interactor?.fetchArticles()
    }
    
    func displayData(data: [ArticleCellModel]) {
        self.dataToDisplay = data
        tableView.reloadData()
    }
    
    
}

extension ArticlesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataToDisplay[indexPath.row].titleText
        cell.detailTextLabel?.text = dataToDisplay[indexPath.row].bodyText
        return cell
    }
}

