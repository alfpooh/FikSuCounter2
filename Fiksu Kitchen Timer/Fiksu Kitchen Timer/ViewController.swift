//
//  ViewController.swift
//  Fiksu Kitchen Timer
//
//  Created by donghoon bae on 2016. 7. 1..
//  Copyright © 2016년 Forethink. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    
    let synth = AVSpeechSynthesizer()
    var timerEffectplayer: AVAudioPlayer!
    var timerLoudRingplayer: AVAudioPlayer!
    var timerShortRingplayer: AVAudioPlayer!
    var timerRewindplayer: AVAudioPlayer!
    var sayCount = AVSpeechUtterance(string: "")
    let targetTime = [5,12,15,10,4,14]
    var isPaused = false
    var isTimerOn = false
    var pausedTime: NSTimeInterval!
    var currentTargetmin:Double = 0
    var timer = NSTimer()
    var transferText: String! = "0"
    
    @IBOutlet weak var targetTimeLabel: UILabel!
    
    @IBOutlet weak var playorpauseLbl: UILabel!
    
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    
    let watch = Watch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let resourcePath =  NSBundle.mainBundle().pathForResource("Timer", ofType: "wav")!
            let url = NSURL(fileURLWithPath: resourcePath)
            try timerEffectplayer = AVAudioPlayer(contentsOfURL: url)
            try timerLoudRingplayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("TimerLoudRing", ofType: "wav")!))
            try timerShortRingplayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("TimerShortRing", ofType: "wav")!))
            try timerRewindplayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("TimerRewind", ofType: "wav")!))
            
            timerEffectplayer.numberOfLoops = -1
            timerEffectplayer.prepareToPlay()
            timerLoudRingplayer.prepareToPlay()
            timerShortRingplayer.prepareToPlay()
            timerRewindplayer.prepareToPlay()
            
            
            
        } catch let err as NSError {
            print (err.debugDescription)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //target time should be decided from selecting menu later!
        let timerindex = Int(transferText)!
        // set target.
        currentTargetmin = Double(targetTime[timerindex])
        if targetTime[timerindex] < 10 {
            targetTimeLabel.text = "0\(targetTime[timerindex]):00"
        } else {
            targetTimeLabel.text = "\(targetTime[timerindex]):00"}
        
    }
    
    @IBAction func PlusMinute(sender: AnyObject) {
        if isTimerOn == true {
            let timenowplusonemin = Double(watch.elapsedTime) + 60.0
            if timer.valid {
                print ("timenowplusone: \(timenowplusonemin), currentTargetmin: \(currentTargetmin) ")
                if timenowplusonemin <= (currentTargetmin*60) {
                    watch.addOneMinute()
                    VoiceOut(5)} else {VoiceOut(7)}
            }
        }
    }
    
    @IBAction func backtomenu(sender: AnyObject) {
        if timer.valid {
            timerEffectplayer.pause()
            watch.pause()
            timer.invalidate()
            dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    @IBAction func plusTargetTime (sender: UIButton) {

            currentTargetmin = currentTargetmin + 1
            VoiceOut(6)
            if currentTargetmin < 10 {
                targetTimeLabel.text = "0\(Int(currentTargetmin)):00"
            } else {
                targetTimeLabel.text = "\(Int(currentTargetmin)):00"}
    }
    
    @IBAction func minusTargetTime (sender: UIButton) {

    currentTargetmin = currentTargetmin - 1
        if currentTargetmin <= 0 {
        currentTargetmin = 1
        VoiceOut(7)
        }
        if isTimerOn == true {
            if currentTargetmin <= elapsedTimeMin {
            currentTargetmin = currentTargetmin + 1
                VoiceOut(7)
            }
        }
    VoiceOut(6)
    if currentTargetmin < 10 {
    targetTimeLabel.text = "0\(Int(currentTargetmin)):00"
    } else {
    targetTimeLabel.text = "\(Int(currentTargetmin)):00"}

}
    private var elapsedTimeMin: Double {
    
        get {
            let eTimeMin: String = String(elapsedTimeLabel.text!.characters.prefix(2))
            return Double(eTimeMin)!
        }
        set {
            if let eTime:String = String(elapsedTimeMin) {
                elapsedTimeLabel.text = "\(eTime):00"
            }
        }
    
    }

    //    @IBAction func MinusMinute(sender: AnyObject) {
    //        let timenow = watch.elapsedTime
    //        if timer.valid {
    //            if  timenow > 60 {
    //                watch.minusOneMinute()
    //                VoiceOut(6)} else {VoiceOut(7)} }
    //    }
    
    
    @IBAction func startButtonTapped(sender: UIButton) {
        if isTimerOn == false {
            VoiceOut(0)
            watch.start()
            if !timer.valid {timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self,
                                                                            selector: #selector(ViewController.updateElapsedTimeLabel(_:)), userInfo: nil, repeats: true)
                 timerEffectplayer.play()
                
                
                playorpauseLbl.text = "❙❙"
            } else {
                print ("play button is pressed while timer counting")
            }
            
        } else {
            timerEffectplayer.pause()
            watch.pause()
            playorpauseLbl.text = "►"
            VoiceOut(3)
            timer.invalidate()
            self.pausedTime = 0.0
        }
        isTimerOn = !isTimerOn
        
    }
    
    @IBAction func stopButtonTapped(sender: UIButton) {
        watch.stop()
    }
    
    func resumeTimer(lastTime: NSTimeInterval) {
        
        
        VoiceOut(4)
        if !timer.valid {NSTimer.scheduledTimerWithTimeInterval(0.1, target: self,
                                                                selector: #selector(ViewController.updateElapsedTimeLabel(_:)), userInfo: nil, repeats: true)
        }
        
        
        watch.start()
    }
    
    func VoiceOut(index: Int){
        if index == 0 {
            sayCount = AVSpeechUtterance(string: "Timer Starts")
            sayCount.rate = 0.5
            synth.speakUtterance(sayCount)}
        else if index == 1 {
            timerLoudRingplayer.volume = 1
            timerLoudRingplayer.play()
            sayCount = AVSpeechUtterance(string: "Time out!")
            sayCount.rate = 0.5
            synth.speakUtterance(sayCount)}
        else if index == 2 {
            sayCount = AVSpeechUtterance(string: "One minute left")
            sayCount.rate = 0.5
            synth.speakUtterance(sayCount)}
        else if index == 3 {
            sayCount = AVSpeechUtterance(string: "Timer paused")
            sayCount.rate = 0.5
            synth.speakUtterance(sayCount)}
        else if index == 4 {
            sayCount = AVSpeechUtterance(string: "Timer continues")
            sayCount.rate = 0.5
            synth.speakUtterance(sayCount)}
        else if index == 5 {
            timerRewindplayer.play()}
        else if index == 6 {
            timerRewindplayer.play()}
        else if index == 7 {
            timerShortRingplayer.play()}
    }
    
    
    
    func updateElapsedTimeLabel(timer: NSTimer) {
        
        
        if isTimerOn == false {
            watch.start()
            isTimerOn = !isTimerOn
            return
        } else {
            
            
            // normally timer is running now
            if watch.isRunning {
                
                // if it is target time stop and alert
                if targetTimeLabel.text == elapsedTimeLabel.text {
                    //stop watch
                    timerEffectplayer.pause()
                    timer.invalidate()
                    watch.stop()
                    VoiceOut(1)
                    
                    //initialize
                    self.pausedTime = 0.0
                    elapsedTimeLabel.text = "00:00"
                    playorpauseLbl.text = "►"
                    isTimerOn = !isTimerOn
                    
                    
                }
                // normally update label with new elapsed time
                elapsedTimeLabel.text = watch.elapsedTimeAsString
            } else {
                // if watch is not running, off timer.
                timer.invalidate()
            }
            
        }
    }
    
    
}

