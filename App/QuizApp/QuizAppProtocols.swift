//
//  QuizAppProtocols.swift
//  QuizApp
//
//  Created by Kamal Sharma R on 18/06/22.
//

import Foundation
import UIKit

typealias QuizAppEntryPoint = QuizAppViewProtocol & UIViewController

protocol QuizAppViewProtocol: AnyObject {
    var presenter: QuizAppPresenterProtocol? { get set }
    func designNavButtons()
}

protocol QuizAppPresenterProtocol: AnyObject {
    var view: QuizAppViewProtocol? { get set }
    var router: QuizAppRouterProtocol? { get set }
    var interactor: QuizAppInteractorProtocol? { get set }

    func navigateToResultsScreen()
}

protocol QuizAppRouterProtocol: AnyObject {
    var entry: QuizAppEntryPoint? { get }
    static func start() -> QuizAppRouterProtocol

    func navigateToResultsScreen(view: QuizAppViewProtocol?)
    func createQuizAppView() -> UINavigationController
}

protocol QuizAppInteractorProtocol: AnyObject{
    var presenter: QuizAppPresenterProtocol? { get set }
}
