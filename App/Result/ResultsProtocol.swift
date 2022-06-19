//
//  ResultsProtocol.swift
//  QuizApp
//
//  Created by Kamal Sharma R on 19/06/22.
//

import Foundation
import UIKit


protocol ResultsViewProtocol: AnyObject {
    var presenter: ResultsPresenterProtocol? { get set }
    var result: Int {get set}

    func designBackToHomeButton()
    func updateResultLabelText(_ resultValue: Int)
}

protocol ResultsInteractorProtocol {
    var presenter: ResultsPresenterProtocol? { get set }
}

protocol ResultsPresenterProtocol: AnyObject {
    var view: ResultsViewProtocol? { get set }
    var router: ResultsRouterProtocol? { get set }
    var interactor: ResultsInteractorProtocol? { get set }

    func navigateToHomeScreen()
}

protocol ResultsRouterProtocol: AnyObject {
    func navigateToHomeScreen(view: ResultsViewProtocol?)
}
