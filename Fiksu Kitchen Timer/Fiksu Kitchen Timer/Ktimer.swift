//
//  Ktimer.swift
//  Fiksu Kitchen Timer
//
//  Created by donghoon bae on 2016. 7. 1..
//  Copyright © 2016년 Forethink. All rights reserved.
//

import Foundation
import UIKit

class Ktimer : NSObject {
    
    var timer = NSTimer()
    
    func timerAction() {
        NSLog("timer action")
    }
    
    func pauseTimer(any: AnyObject) {
        timer.invalidate()
    }
    
}