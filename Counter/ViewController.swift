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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private var score = 0
    
    @IBAction func pushButton(_ sender: Any) {
        score += 1
        labelScore.text = "Значение счетчика: \(score)"
        print(score)
    }
}
