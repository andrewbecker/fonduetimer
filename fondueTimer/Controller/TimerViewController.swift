//
//  TimerViewController.swift
//  fondueTimer
//
//  Created by Andy Becker on 2/3/19.
//  Copyright © 2019 Andy Becker. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    var cookTime = 90
    var timeLeft = 90
    var isTimerRunning = false
    var timer = Timer()
    var specialColor: ForkColor?
    let startBtnColor = UIColor(hex: "#92d36e", alpha: 0.85)
    let pauseBtnColor = UIColor(hex: "#ff0000", alpha: 0.85)
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var decreaseTimeButton: UIButton!
    @IBOutlet weak var increaseTimeButton: UIButton!
    @IBOutlet weak var timeRemaining: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addBorderRadius(btn: startButton)
        addBorderRadius(btn: decreaseTimeButton)
        addBorderRadius(btn: increaseTimeButton)
        timeRemaining.text = formatCooktime(time: cookTime)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    @IBAction func touchDecreaseButton(_ sender: Any) {
        cookTime -= 5
        timeLeft -= 5
        updateUI(time: cookTime)
    }
    
    @IBAction func touchIncreaseButton(_ sender: Any) {
        cookTime += 5
        timeLeft += 5
        updateUI(time: cookTime)
    }
    
    @IBAction func touchStartButton(_ sender: Any) {
        if !isTimerRunning {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
            
            decreaseTimeButton.isEnabled = false
            increaseTimeButton.isEnabled = false
            
            increaseTimeButton.alpha = 0.5
            decreaseTimeButton.alpha = 0.5
            startButton.backgroundColor = pauseBtnColor
            startButton.setTitle("Reset", for: .normal)
        } else {
            stopTimer()
        }
    }
    
    @objc func runTimer() {
        timeLeft -= 1
        updateUI(time: timeLeft)
        if timeLeft == 0 {
            stopTimer()
            showSimpleAlert()
        }
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        timer.invalidate()
        timeLeft = cookTime
        isTimerRunning = false
        
        startButton.alpha = 1
        startButton.backgroundColor = startBtnColor
        startButton.setTitle("Start", for: .normal)
        decreaseTimeButton.isEnabled = true
        increaseTimeButton.isEnabled = true
        
        increaseTimeButton.alpha = 1
        decreaseTimeButton.alpha = 1
        
        
        updateUI(time: cookTime)
    }
    
    func updateUI(time: Int) {
        timeRemaining.text = formatCooktime(time: time)
        
        if !isTimerRunning {
            if (cookTime == 5) {
                decreaseTimeButton.isEnabled = false
                decreaseTimeButton.alpha = 0.5
            } else {
                decreaseTimeButton.isEnabled = true
                decreaseTimeButton.alpha = 1
            }
        }
    }
    
    func addBorderRadius(btn: UIButton) {
        btn.layer.cornerRadius = btn.bounds.size.width / 2
        btn.clipsToBounds = true
    }
    
    func getMinutes(time: Int) -> String {
        return String(time/60)
    }
    
    func getSeconds(time: Int) -> String {
        let seconds = time%60
        return String(format: "%02d", seconds)
    }
    
    func formatCooktime(time: Int) -> String {
        return "\(getMinutes(time: time)):\(getSeconds(time: time))"
    }
    
    /**
     Simple Alert
     - Show alert with title and alert message and basic two actions
     */
    func showSimpleAlert() {
        let alert = UIAlertController(title: "Steak is done", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
