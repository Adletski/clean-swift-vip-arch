//
//  ArticlesInteractor.swift
//  clean swift vip
//
//  Created by Adlet Zhantassov on 09.04.2023.
//

import Foundation

protocol ArticlesBusinessLogic {
    func fetchArticles()
}

class ArticlesInteractor: ArticlesBusinessLogic {
    
    var presenter: ArticlesPresentationLogic?
    
    
    func fetchArticles() {
        var backendResponse = [ArticleBackendModel]()
        let model = ArticleBackendModel(articleId: 0, name: "iosssss", text: "ios engineer", rating: 100, symbolCount: 2)
        
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        
        presenter?.presentData(data: backendResponse)
    }
}


