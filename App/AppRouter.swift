//
//  AppRouter.swift
//  QuizApp
//
//  Created by Kamal Sharma R on 19/06/22.
//

// Entry point for module
// does not usually have any reference

import Foundation
import UIKit

class AppRouter: AppRouterProtocol {
    var entry: EntryPoint?

    static func start() -> AppRouterProtocol {
        let router = AppRouter();
        var view: AppViewProtocol = AppViewController()
        let presenter: AppPresenterProtocol = AppPresenter()
        var interactor: AppInteractorProtocol = AppInteractor()
//
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
    
        router.entry = view as? EntryPoint

        return router
    }
    
    func navigateToQuizApp(view: AppViewProtocol?) {
        let quizAppViewNavigationController = QuizAppRouter().createQuizAppView()
        
        if (view as? AppViewController) != nil {
            guard let quizAppController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuizAppViewController") as? QuizAppViewController else { return }
            
            quizAppViewNavigationController.pushViewController(quizAppController, animated: true)

        }

    }
}
