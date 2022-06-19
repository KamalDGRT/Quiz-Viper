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
    @IBOutlet weak var collectionView: UICollectionView!

    var viewModel = QuizAppResponseModel()
    var questions:[Questions]?
    
    var answerSelected = false
    var isCorrectAnswer = false
    
    var points = 0
    var index = 0
    
    func designNavButtons() {
        nextButton?.halfCircleRoundCorner()
        exitButton?.halfCircleRoundCorner()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        designNavButtons()
        
        viewModel.apiToGetQuestionData { [weak self] in
            self?.questions = self?.viewModel.questionData?.data?.questions
            DispatchQueue.main.async {
                self?.collectionView.delegate = self
                self?.collectionView.dataSource = self
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func showAlertPopup() {
        let alert = UIAlertController(title: "Select One Option", message: "Please select one option before moving to the next question.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func onClickExit(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func onClickNext(_ sender: Any) {
        if !answerSelected {
            showAlertPopup()
            return
        }
        
//        Making it false here so that when we tap on next
//        and we have not selected anything, it will prompt an alert
        answerSelected = false
        if isCorrectAnswer {
            points += 1
        }
        
        print(index)
        if index<(self.questions?.count ?? 0) - 1 {
            index += 1
            collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)

        } else {
            // Move the user on the result controller
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as? ResultsViewController else {return}
            vc.result = points
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


extension QuizAppViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizAppCollectionViewCell", for: indexPath) as? QuizAppCollectionViewCell else {return QuizAppCollectionViewCell()}
        cell.optionA.layer.cornerRadius = 27
        cell.optionB.layer.cornerRadius = 27
        cell.optionC.layer.cornerRadius = 27
        cell.optionD.layer.cornerRadius = 27
        cell.setValues = questions?[indexPath.row]
        
//        Making it as weak self so that it wont hold references
        cell.selectedOption = { [weak self] isCorrect in
            self?.answerSelected = true
            self?.isCorrectAnswer = isCorrect
        }
        return cell
    }

//    For controlling the collection view cell size.
//    We do that so that we see only 1 question on the screen
//    Before doing all these, click on the collection view cell in
//    storyboard. Make the estimated size property to none in the scaling tab.
//    Also make these additional changes in the attribute inspector:
//    * Scroll direction to Horizontal
//    * Disable bounce on scroll and bounce on zoom
//    * Enable pagin
//    * Disable `Show Horizontal Indicator`
//    * Disable `Show Vertical Indicator`

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

//    for setting zero spacing between the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
