//
//  QuizAppViewController.swift
//  QuizApp
//
//  Created by Kamal Sharma R on 18/06/22.
//

// Can be a viewcontroller
// must follow protocols
// have a reference to presenter


import Foundation
import UIKit

class QuizAppViewController: UIViewController, QuizAppViewProtocol {
    var presenter: QuizAppPresenterProtocol?

    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var exitButton: UIButton!
    
    func designNavButtons() {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        designNavButtons()
    }
}
