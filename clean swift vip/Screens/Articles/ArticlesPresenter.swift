//
//  ArticlesPresenter.swift
//  clean swift vip
//
//  Created by Adlet Zhantassov on 09.04.2023.
//

import Foundation

protocol ArticlesPresentationLogic {
    func presentData(data: [ArticleBackendModel])
}

class ArticlesPresenter: ArticlesPresentationLogic {
    
    weak var viewController: ArticlesDisplayLogic?
    
    
    
    func presentData(data: [ArticleBackendModel]) {
        let viewModel = data.map { model -> ArticleCellModel in
            let cellModel = ArticleCellModel(articleId: model.articleId, titleText: model.name, bodyText: model.text)
            
            return cellModel
        }
        
        viewController?.displayData(data: viewModel)
    }
}



