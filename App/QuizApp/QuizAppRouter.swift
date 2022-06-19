//
//  QuizAppRouter.swift
//  QuizApp
//
//  Created by Kamal Sharma R on 18/06/22.
//

// Entry point for module
// does not usually have any reference

import Foundation
import UIKit

class QuizAppRouter: QuizAppRouterProtocol {
    func navigateToSomeScreen(view: QuizAppViewProtocol?) {
     
    }

    
    func createQuizAppView() -> UINavigationController {
        let view = QuizAppViewController()
        let presenter = QuizAppPresenter()
        let router = QuizAppRouter()
        let interactor = QuizAppInteractor()
        
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
    
        let navigationController = UINavigationController(rootViewController: view)

        return navigationController
    }
}
