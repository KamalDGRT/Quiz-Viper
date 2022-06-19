//
//  QuizAppProtocols.swift
//  QuizApp
//
//  Created by Kamal Sharma R on 18/06/22.
//

import Foundation
import UIKit

protocol QuizAppViewProtocol: AnyObject {
    var presenter: QuizAppPresenterProtocol? { get set }
    func designNavButtons()
}

protocol QuizAppPresenterProtocol: AnyObject {
    var view: QuizAppViewProtocol? { get set }
    var router: QuizAppRouterProtocol? { get set }
    var interactor: QuizAppInteractorProtocol? { get set }
    
    func viewDidLoad()
    func signInButtonPressed(userName: String?, approvalValue: String?)
    func navigateToSomeScreen()
}

protocol QuizAppRouterProtocol: AnyObject {
    func navigateToSomeScreen(view: QuizAppViewProtocol?)
    func createQuizAppView() -> UINavigationController
}

protocol QuizAppInteractorProtocol: AnyObject{
    var presenter: QuizAppPresenterProtocol? { get set }
}
