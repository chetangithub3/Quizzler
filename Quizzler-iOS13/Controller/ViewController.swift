//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreBoard: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    var questionNumber = 1
    
   
    
    var answers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.progress = 0
        updateQuestion()
        updateProgressBar()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        let flag: Bool = quizBrain.checkAnswer(userAnswer: sender.currentTitle!)
        if flag{
            print("Correct")
            sender.backgroundColor = UIColor.green
        }
        else{
            print("Incorrect")
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.updateQuestionNumber()
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateProgressBar), userInfo: nil, repeats: false)
    }
    
    @objc func updateProgressBar(){
        progressBar.progress = quizBrain.getProgress()
//        progressBar.progress += 1.0/(Float)(quiz.count)
    }
    
   
    @objc func updateQuestion(){
        
        
        questionLabel.text = quizBrain.getQuestionText()
        scoreBoard.text = "Score: \(quizBrain.score)"
        progressBar.progress = quizBrain.getProgress()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}

