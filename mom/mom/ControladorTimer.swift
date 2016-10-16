//
//  ControladorTimer.swift
//  mom
//
//  Created by Gabriel Dezena on 16/10/16.
//  Copyright © 2016 Gabriel Dezena. All rights reserved.
//

import UIKit

class ControladorTimer: NSObject {
    
    
    var timer: Timer = Timer()
    
    var timerInterval: Double
    var fromViewController: InfoViewController
    
    init(timerInterval: Double, fromViewController: InfoViewController){
        self.timerInterval = timerInterval
        self.fromViewController = fromViewController
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: self.timerInterval, target: self, selector: (#selector(self.callDelegate)), userInfo: nil, repeats: true)
    }
    
    func callDelegate(){
        fromViewController.setNotification()
    }
    
    
}
