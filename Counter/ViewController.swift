//
//  ViewController.swift
//  Counter
//
//  Created by Vladislav Kramskoy on 23.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var scoreLabel: UILabel!
    @IBOutlet weak private var incrementBigButton: UIButton!
    @IBOutlet weak private var incrementButton: UIButton!
    @IBOutlet weak private var decrementButton: UIButton!
    @IBOutlet weak private var resetButton: UIButton!
    @IBOutlet weak private var historyTextField: UITextView!
    
    private var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextField.text = "История изменений:\n"
    }

    private func showScore() {
        scoreLabel.text = "Значение счетчика: \(score)"
    }
    
    private func showDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        let dateString = dateFormatter.string(from: Date())
        return dateString
    }
    
    private func showMessagePlusOne() {
        historyTextField.insertText("[\(showDate())]: значение изменено на +1\n")
    }
    
    @IBAction private func bigButtonTapped(_ sender: Any) {
        score += 1
        showScore()
        showMessagePlusOne()
    }
    @IBAction private func plusButtonTapped(_ sender: Any) {
        score += 1
        showScore()
        showMessagePlusOne()
    }
    @IBAction private func minusButtonTapped(_ sender: Any) {
        if score > 0 {
            historyTextField.insertText("[\(showDate())]: значение изменено на -1\n")
        } else {
            historyTextField.insertText("[\(showDate())]: попытка уменьшить значение счётчика ниже 0\n")
        }
        score = max(score - 1, 0)
        showScore()
    }
    @IBAction private func resetScore(_ sender: Any) {
        score = 0
        showScore()
        historyTextField.insertText("[\(showDate())]: значение сброшено\n")
    }
}
