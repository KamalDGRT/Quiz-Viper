//
//  ResultsProtocol.swift
//  QuizApp
//
//  Created by Kamal Sharma R on 19/06/22.
//

import Foundation

protocol ResultsViewProtocol: AnyObject {
    var presenter: ResultsPresenterProtocol? { get set }
    var result: Int {get set}

    func designBackToHomeButton()
    func updateResultLabelText(_ resultValue: Int)
}

protocol ResultsPresenterProtocol: AnyObject {
    var view: ResultsViewProtocol? { get set }
    var router: ResultsRouterProtocol? { get set }
    var interactor: ResultsInteractorInputProtocol? { get set }

    func navigateToHomeScreen()
}

protocol ResultsRouterProtocol: AnyObject {
    func navigateToHomeScreen(view: ResultsViewProtocol?)
}

protocol ResultsInteractorInputProtocol: AnyObject {

}

protocol ResultsInteractorOutputProtocol: AnyObject {

}
