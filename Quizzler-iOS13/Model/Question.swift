//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Angelo Hudej on 12.02.21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    let Text: String
    let PossibleAnswers: [String]
    let RightAnswer: String
    
    init(q:String, a:[String], correctAnswer:String) {
        self.Text = q
        self.PossibleAnswers = a
        self.RightAnswer = correctAnswer
    }
}
