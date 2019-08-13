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
    
    @IBOutlet var questions: UIView!
    
    
    @IBOutlet weak var answerbutton: UIStackView!
    
    var countQuestion: Int = 0
    
    var answerCheck: [Bool] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

