//
//  ResultsPresenter.swift
//  QuizApp
//
//  Created by Kamal Sharma R on 18/06/22.
//

// the glue that ties everything together
// needs protocol
// has a reference to - interactor, router, view


import Foundation

class ResultsPresenter: ResultsPresenterProtocol {
    var view: ResultsViewProtocol?
    var router: ResultsRouterProtocol?
    var interactor: ResultsInteractorProtocol?

    func navigateToHomeScreen() {
        router?.navigateToHomeScreen(view: view)
    }
}
