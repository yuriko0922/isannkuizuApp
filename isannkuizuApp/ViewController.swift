//
//  ViewController.swift
//  isannkuizuApp
//
//  Created by 津國　由莉子 on 2019/08/13.
//  Copyright © 2019 yurityann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 何問目かの表示をするところ
    @IBOutlet weak var questionNum: UINavigationItem!
    // 問題表示されるところ(textview)
    @IBOutlet weak var questions: UITextView!
    // 回答ボタン
    @IBOutlet weak var answerbutton: UIStackView!
    
    // 問題の数
    var countQuestion: Int = 1
    // 正解か不正解かの精査
    var answerCheck: [Bool] = []
    // 問題の正解
    let questionAnswer: [Int] = [1, 3, 2]
    // 現在の問題番号
    var nowQuestion: Int = 1
    
    // 問題文
    let monndai: [String] = [
        "問１日本の世界遺産『富士山－信仰の対象と芸術の源泉』は、2013年に（ ）として世界遺産登録されました。\n1. 文化遺産\n2. 自然遺産\n3. 山岳遺産\n4. 伝統遺産",
        "問2イタリア共和国の世界遺産『フィレンツェの歴史地区』のあるフィレンツェを中心に、17世紀に栄えた芸術運動は何でしょうか。\n1. シュルレアリスム\n2. アバンギャルド\n3. ルネサンス",
        "問3 2016年のオリンピック開催地であるリオ・デ・ジャネイロで、ブラジル独立100周年を記念して作られたキリスト像が立つ場所として、正しいものはどれか。\n1. コパカバーナの山\n2. コルコバードの丘"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions.text = monndai[nowQuestion - 1]
    }
    
    // 画面遷移した瞬間の処理
    override func viewWillDisappear(_ animated: Bool) {
        // タイトルを問題と表示させる処理
        questionNum.title = "問題"
    }
    
    // 結果の画面から問題の画面に戻ってきたときの処理
    override func viewWillAppear(_ animated: Bool) {
        questions.text = monndai[0]
        // タイトルを何問目に直す
        questionNum.title = "\(countQuestion)問目"
    }
    
    // 回答の精査してアラートを表示させるよ
    func checkAnswer(putAnswer: Int) {
        // 回答あってるかの精査
        if putAnswer == questionAnswer[nowQuestion - 1] {
            if nowQuestion < monndai.count {
                // アラートの表示（正解）
                showAlertOk(title: "正解！", message: "次に問題に進むよ")
            } else {
                // 最後の問題の時
                // アラート
                showAlertOk(title: "正解！", message: "結果が見れるよ")
            }
        } else {
            // 不正解の時
            // アラート
            showAlertBad(title: "残念！", message: "もう一回挑戦する？")
        }
        
    }
    
    // アラート（不正解！）
    func showAlertBad(title: String?, message: String?) {
        // アラート作る！！！
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // アラートのアクション！！！
        // もう１回やる？
        let go = UIAlertAction(title: "はい", style: .default, handler: nil)
        let no = UIAlertAction(title: "いいえ", style: .default, handler: {(action: UIAlertAction!) in
            // 不正解を配列にIN
            self.answerCheck.append(false)
            // 次の問題に行くよ
            self.nextQut()
        })
        // アラートにアクションボタンを追加します
        alert.addAction(go)
        alert.addAction(no)
        // アラートの表示
        present(alert, animated: true, completion: nil)
    }
    
    // アラート（正解！）
    func showAlertOk(title: String?, message: String) {
        // アラート作る！！！
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // アラートのアクション！！！
        let close = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction) in
            // 正解を配列にIN
            self.answerCheck.append(true)
            // 次の問題に行くよ
            self.nextQut()
        })
        // アラートにアクションボタンを追加します
        alert.addAction(close)
        // アラートの表示
        present(alert, animated: true, completion: nil)
    }
    // ボタン減らす
    func bottunCat() {
        // ボタンの合計数から問題番号をいいてボタンを減らす
        let bottunCatNum: Int = answerbutton.arrangedSubviews.count - nowQuestion
        //
        answerbutton.arrangedSubviews[bottunCatNum].isHidden = true
    }
    
    // 問題を１進める
    func nextQut() {
        // ボタン減らす
        bottunCat()
        
        // 現在の問題番号が問題数を超えないようにする
        if nowQuestion >= monndai.count {
            // 結果画面に遷移させる
            performSegue(withIdentifier: "toResult", sender: nil)
            reset()
        } else {
            questions.text = monndai[nowQuestion]
            // タイトルの変更
            questionNum.title = "\(nowQuestion)問目"
        }
        
        // 問題番号１進める
        nowQuestion += 1
        
    }
    
    // 遷移先に情報を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
        if segue.identifier == "toResult" {
            // 次の画面代入
            let nextVC = segue.destination as! TableViewController
            // 値の受け渡し
            nextVC.receiveResults = answerCheck
            
        }
    }
    
    // 問題をリセット
    func reset() {
        // 問題を最初に戻す
        questions.text = monndai[0]
        // ボタン現る
        for bottun in answerbutton.arrangedSubviews {
            bottun.isHidden = false
        }
        // 問題番号リセット
        nowQuestion = 0
        // 正解不正解リセット
        answerCheck = []
    }
    //ボタン紐ずけ
    
    @IBAction func answerButton(_ sender: UIButton) {
        // 回答を確認します
        checkAnswer(putAnswer: sender.tag)
    }
}

