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
    var entry: ResultsEntryPoint?

    static func start() -> ResultsRouterProtocol {
        let router = ResultsRouter();
        let view: ResultsViewProtocol = ResultsViewController()
        let presenter: ResultsPresenterProtocol = ResultsPresenter()
        var interactor: ResultsInteractorProtocol = ResultsInteractor()
//
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        router.entry = view as? ResultsEntryPoint
        return router
    }

    func navigateToHomeScreen(view: ResultsViewProtocol?) {
        if let view = view as? ResultsViewController {
            view.navigationController?.popToRootViewController(animated: true)
        }
    }
}
