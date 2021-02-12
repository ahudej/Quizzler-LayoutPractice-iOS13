//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var BtnAnswer1: UIButton!
    @IBOutlet weak var BtnAnswer2: UIButton!
    @IBOutlet weak var BtnAnswer3: UIButton!
    @IBOutlet weak var LblQuestion: UILabel!
    @IBOutlet weak var PgbProgress: UIProgressView!
    @IBOutlet weak var LblScore: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI()
    }

    @IBAction func BtnPressed(_ sender: UIButton) {

        let userAnswer = sender.currentTitle!
        
        if quizBrain.checkAnswer(userAnswer){
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }

        quizBrain.nextQuestion()

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(UpdateUI), userInfo: nil, repeats: false)
        
    }
    
    
    @objc func UpdateUI(){
        LblQuestion.text = quizBrain.getQuestionText()
        let answers = quizBrain.getAnswerText()
        BtnAnswer1.setTitle(answers[0], for: .normal)
        BtnAnswer2.setTitle(answers[1], for: .normal)
        BtnAnswer3.setTitle(answers[2], for: .normal)
        PgbProgress.progress = quizBrain.calculateProgress(cnt: quizBrain.QuestionCounter, cntMax: quizBrain.Questions.count)
        LblScore.text = "Score: \(quizBrain.getScore())"
        BtnAnswer1.backgroundColor = UIColor.clear
        BtnAnswer2.backgroundColor = UIColor.clear
        BtnAnswer3.backgroundColor = UIColor.clear

    }
    
   
}

