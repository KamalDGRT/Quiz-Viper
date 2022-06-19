//
//  QuizAppProtocols.swift
//  QuizApp
//
//  Created by Kamal Sharma R on 18/06/22.
//

import Foundation

protocol QuizAppViewProtocol: AnyObject {
    var presenter: QuizAppPresenterProtocol? { get set }
}

protocol QuizAppPresenterProtocol: AnyObject {
    var view: QuizAppViewProtocol? { get set }
    var router: QuizAppRouterProtocol? { get set }
    var interactor: QuizAppInteractorInputProtocol? { get set }
    
    func viewDidLoad()
    func signInButtonPressed(userName: String?, approvalValue: String?)
    func navigateToSomeScreen()
}

protocol QuizAppRouterProtocol: AnyObject {
    func createQuizAppView()
    func navigateToSomeScreen(view: QuizAppViewProtocol?)
}

protocol QuizAppInteractorInputProtocol: AnyObject{
    var presenter: QuizAppInteractorOutputProtocol? { get set }
 
}

protocol QuizAppRemoteDataManagerInputProtocol: AnyObject {
    var remoteRequestHandler: QuizAppRemoteDataManagerOutputProtocol? { get set }
}

protocol QuizAppRemoteDataManagerOutputProtocol: AnyObject {

}

protocol QuizAppInteractorOutputProtocol: AnyObject{
    func onSuccessReceived(response: Any)
}
