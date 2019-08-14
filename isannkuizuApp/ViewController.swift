//
//  ViewController.swift
//  isannkuizuApp
//
//  Created by 津國　由莉子 on 2019/08/13.
//  Copyright © 2019 yurityann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionNum: UINavigationItem!
    
    @IBOutlet var questions: [UIView]!
    
    
    @IBOutlet weak var answerbutton: UIStackView!
    //問題の数
    var countQuestion: Int = 0
    //正解か不正解かの精査
    var answerCheck: [Bool] = []
    //問題の正解
    let questionAnswer: [Int] = [1, 3, 2]
    //現在の問題番号
    var nowQuestion: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //問題数
        countQuestion = questions.count
        //今何問目か表示させる
        questionNum.title = "\(nowQuestion)問目"
    }

   //回答を確認していきます
    func answer(hisAnswer: Int) {
        //
    }
    
    
}

