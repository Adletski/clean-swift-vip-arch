//
//  ViewController.swift
//  clean swift vip
//
//  Created by Adlet Zhantassov on 09.04.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next VC", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func buttonPressed() {
        let articleVC = ArticlesViewController()
        
        navigationController?.pushViewController(articleVC, animated: true)
        
    }


}

