//
//  AppProtocols.swift
//  QuizApp
//
//  Created by Kamal Sharma R on 19/06/22.
//

import Foundation
import UIKit

typealias EntryPoint = AppViewProtocol & UIViewController

protocol AppViewProtocol {
    var presenter: AppPresenterProtocol? { get set }
    func designPlayButton()
    
    

}

protocol AppInteractorProtocol {
    var presenter: AppPresenterProtocol? { get set }
}

protocol AppPresenterProtocol: AnyObject {
    var view: AppViewProtocol? { get set }
    var router: AppRouterProtocol? { get set }
    var interactor: AppInteractorProtocol? { get set }
    
    func navigateToQuizApp()
}

protocol AppRouterProtocol {
    var entry: EntryPoint? { get }
    static func start() -> AppRouterProtocol
    
    func navigateToQuizApp(view: AppViewProtocol?)
}
