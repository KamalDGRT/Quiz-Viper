//
//  ResultsRouter.swift
//  QuizApp
//
//  Created by Kamal Sharma R on 18/06/22.
//

// Entry point for module
// does not usually have any reference

import Foundation
import UIKit

class ResultsRouter: ResultsRouterProtocol {

    static func createResultsView() -> UINavigationController {
        let router = ResultsRouter();
        let view = ResultsViewController()
        let presenter = ResultsPresenter()
        let interactor = ResultsInteractor()
//
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        let navigationController = UINavigationController(rootViewController: view)
        return navigationController
      
    }

    func navigateToHomeScreen(view: ResultsViewProtocol?) {
        if let view = view as? ResultsViewController {
            view.navigationController?.popToRootViewController(animated: true)
        }
    }
}
