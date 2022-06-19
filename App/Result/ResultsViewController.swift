//
//  ResultsViewController.swift
//  QuizApp
//
//  Created by Kamal Sharma R on 18/06/22.
//

import Foundation
import UIKit

// Can be a viewcontroller
// must follow protocols
// have a reference to presenter


class ResultsViewController: UIViewController, ResultsViewProtocol {

    var presenter: ResultsPresenterProtocol?
    var result = 0

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var backToHomeButton: UIButton!

    func designBackToHomeButton() {
        backToHomeButton.halfCircleRoundCorner()
    }

    func updateResultLabelText(_ resultValue: Int) {
        resultLabel.text = "\(resultValue)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateResultLabelText(result)
    }

    @IBAction func didTapBackToHomeButton(_ sender: Any) {
    
    }
}
