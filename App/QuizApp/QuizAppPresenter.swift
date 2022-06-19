//
//  QuizAppPresenter.swift
//  QuizApp
//
//  Created by Kamal Sharma R on 18/06/22.
//

// the glue that ties everything together
// needs protocol
// has a reference to - interactor, router, view

import Foundation

class QuizAppPresenter: QuizAppPresenterProtocol {
    var view: QuizAppViewProtocol?
    
    var router: QuizAppRouterProtocol?
    
    var interactor: QuizAppInteractorProtocol?
    
    func viewDidLoad() {
        
    }
    
    func signInButtonPressed(userName: String?, approvalValue: String?) {
        
    }
    
    func navigateToSomeScreen() {
    
    }
    
    
}
