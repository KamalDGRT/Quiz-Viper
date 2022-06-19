//
//  AppViewController.swift
//  QuizApp
//
//  Created by Kamal Sharma R on 19/06/22.
//

import Foundation
import UIKit

// Can be a viewcontroller
// must follow protocols
// have a reference to presenter

class AppViewController: UIViewController, AppViewProtocol {

    var presenter: AppPresenterProtocol?
    
    
    @IBOutlet weak var playButton: UIButton!
    
    func designPlayButton() {
        playButton?.halfCircleRoundCorner()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designPlayButton()
    }
    
    
    @IBAction func didTapPlayButton(_ sender: Any) {
        
    }
}
