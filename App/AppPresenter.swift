//
//  AppPresenter.swift
//  QuizApp
//
//  Created by Kamal Sharma R on 19/06/22.
//

// the glue that ties everything together
// needs protocol
// has a reference to - interactor, router, view

import Foundation

class AppPresenter: AppPresenterProtocol{
    var view: AppViewProtocol?
    
    var router: AppRouterProtocol?
    
    var interactor: AppInteractorProtocol?
    
    func navigateToQuizApp() {
        router?.navigateToQuizApp(view: view)
    }
}
