//
//  ViewController.swift
//  Counter
//
//  Created by Vladislav Kramskoy on 23.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var bigRedButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var historyOfChanges: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyOfChanges.text = "История изменений:\n"
        // Do any additional setup after loading the view.
    }
    
    private var score = 0

    private func showScore() {
        labelScore.text = "Значение счетчика: \(score)"
    }
    
    private func showDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        let dateString = dateFormatter.string(from: Date())
        return dateString
    }
    
    private func showMessagePlusOne() {
        historyOfChanges.insertText("[\(showDate())]: значение изменено на +1\n")
    }
    
    @IBAction func pushButton(_ sender: Any) {
        score += 1
        showScore()
        showMessagePlusOne()
    }
    @IBAction func plusScore(_ sender: Any) {
        score += 1
        showScore()
        showMessagePlusOne()
    }
    @IBAction func minusButton(_ sender: Any) {
        if score > 0 {
            historyOfChanges.insertText("[\(showDate())]: значение изменено на -1\n")
        } else {
            historyOfChanges.insertText("[\(showDate())]: попытка уменьшить значение счётчика ниже 0\n")
        }
        score = max(score - 1, 0)
        showScore()
    }
    @IBAction func resetScore(_ sender: Any) {
        score = 0
        showScore()
        historyOfChanges.insertText("[\(showDate())]: значение сброшено\n")
    }
}
