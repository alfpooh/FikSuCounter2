//
//  ViewController.swift
//  Smart Tally Counter
//
//  Created by donghoon bae on 2016. 5. 25..
//  Copyright © 2016년 Forethink. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var isGraphViewShowing = false
    let synth = AVSpeechSynthesizer()
    var sayCount = AVSpeechUtterance(string: "")
    var soundMute = false
    var countLog = [Int]()
    var countperminLog = [Float]()
    var countsecLog = [Float]()
    var wholeLog = ""
    var CountedNumber: Int = 0
    var lengthCountedNumber: Int = 0
    var countingSound: AVAudioPlayer!
    var startTime = ""
    var startTimestamp = NSDate()
    var logtext = ""
    var logtextMid = ""
    var logtextRight = ""
    var numberofLog = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for sound
        let path = NSBundle.mainBundle().pathForResource("counterclick", ofType: "m4a")
        let soundUrl = NSURL (fileURLWithPath: path!)
        
        do {
            try countingSound = AVAudioPlayer(contentsOfURL: soundUrl)
            countingSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        
    }
    //

    

    
    @IBOutlet weak var countdata62: UILabel!
//
    @IBOutlet weak var countdataMid: UILabel!
    
    @IBOutlet weak var countdatarRight: UILabel!
    @IBOutlet weak var CurrentCount: UILabel!
    @IBOutlet weak var graphView: UIView!
    @IBOutlet weak var LenseView: UIView!
    @IBOutlet weak var Abouttext: UILabel!
    
    @IBAction func AddCount(sender: UIButton) {
        CountedNumber = CountedNumber + 1
            // start time stamp
            if CountedNumber == 1 {
                startTimestamp = NSDate()
                print (startTimestamp)
            }
        SetCount (CountedNumber)
        playSound ()
    }
    
    @IBAction func ResetCount(sender: UIButton) {
        let CountisNaN = Float(CountedNumber)
        if CountisNaN.isNaN { CountedNumber = 0
            print ("count was Nan.")
            return
        } else {
        countlogging (CountedNumber)
            CountedNumber = 0
            SetCount (CountedNumber)}
                    print ("count was logged and reset.")
        return
    }
    
    @IBAction func MinusCount(sender: UIButton) {
        CountedNumber = CountedNumber - 1
            //number cannot be minus.
            if CountedNumber < 0 {
                CountedNumber = 0
            }
        SetCount (CountedNumber)
        playSound ()
    }
    func setStartTime () -> String{
        let tformat = NSDateFormatter()
        tformat.dateFormat = "HH:mm:ss.SSS"
        let startTime = tformat.stringFromDate(NSDate())
        return startTime
    }


    // keep count logs up to 6
    
    func countlogging (countforlog: Int) {
        let CountlogperMin = countperMin(countforlog)
        let countlogSec = countSec()
        
        func appendnewLog() {
            countLog.append(countforlog)
            countsecLog.append(countlogSec)
            countperminLog.append(CountlogperMin)}
        
        if countLog.count == 6 {
            // delete oldest log
            countLog.removeAtIndex(0)
            countsecLog.removeAtIndex(0)
            countperminLog.removeAtIndex(0)
            
            // add new log at end
            appendnewLog()
            
            }
        else
            {
            // otherwise just add new log
                appendnewLog()
            }


    }
    


    
    func timenow() -> String {
        let format = NSDateFormatter()
        format.dateFormat = "HH:mm:ss.SSS"
        let now = format.stringFromDate(NSDate())
        print(now)
        return now
    }

    func countSec() -> Float {
        //createendTime
        let elapsedTime = round((NSDate().timeIntervalSinceDate(startTimestamp))*10)/10
        //test code by print
        print ("starttime:\(startTimestamp), elapsedTime: \(elapsedTime)")
        return Float(elapsedTime)
}
    
        
    func SetCount (countnumb: Int) {
        if countnumb < 10 {
        CurrentCount.text = "000" + String(countnumb)
        } else if countnumb < 100 && countnumb >= 10 {
        CurrentCount.text = "00" + String(countnumb)
        } else if countnumb < 1000 && countnumb >= 100 {
            CurrentCount.text = "0" + String(countnumb)
        } else if countnumb < 10000 && countnumb >= 1000 {
            CurrentCount.text = String(countnumb)
        } else if countnumb >= 10000 {
            CurrentCount.text = "00000"
        }
    }
    

    
    func playSound () {
        if !soundMute {
        if countingSound.playing {
            countingSound.stop()
        } else {
            countingSound.play()
        }
        }
    }
    
    
    
    
    @IBAction func VoiceOut(sender: AnyObject) {
        sayCount = AVSpeechUtterance(string: String(CountedNumber))
        sayCount.rate = 0.5
        synth.speakUtterance(sayCount)
        
    }
    //Swife left
    
    @IBAction func counterViewSwipe (gesture:UISwipeGestureRecognizer?) {
        if (isGraphViewShowing) {
            UIView.transitionFromView(graphView,
                                      toView: LenseView,
                                      duration: 1.0,
                                      options: [UIViewAnimationOptions.TransitionFlipFromLeft, UIViewAnimationOptions.ShowHideTransitionViews],
                                      completion:nil)
            
            
        } else {
            UIView.transitionFromView(LenseView,
                                      toView: graphView,
                                      duration: 1.0,
                                      options: [UIViewAnimationOptions.TransitionFlipFromLeft, UIViewAnimationOptions.ShowHideTransitionViews],
                                      completion: nil)

        //Show Graph view content
            logtext = ""
            logtextMid = ""
            logtextRight = ""
            // if there is no log. Never reset.
            if countLog.count == 0 {
                numberofLog = countLog.count
                logtext = "    NO COUNT LOG"
                var seconds = 0
                Abouttext.text = logtext
                print (logtext)
                } else {
                    // for range count minus one
                    numberofLog = countLog.count - 1
                    for countindex in 0...numberofLog {
                    var seconds = String(countsecLog[countindex])
                    var counter = String(countLog[countindex])
                    var countperminutes = String(countperminLog[countindex])
                        // if count is 0 all others will be displayed as 0
                        if counter == "0" {
                            seconds = "0"
                            counter = "0"
                            countperminutes = "0"
                            }
                    Abouttext.text = ""
                        logtext =   logtext + ("\(counter)\n")
                        logtextMid = logtextMid + "\(seconds)\n"
                        logtextRight = logtextRight + "\(countperminutes)\n"
                        
                     countdata62.text = logtext
                    countdataMid.text = logtextMid
                    countdatarRight.text = logtextRight
                        
                     print (logtext)
                    }
                }

        }
        isGraphViewShowing = !isGraphViewShowing
    }
    
    
    //Swiferight
    @IBAction func counterViewSwipeleft (gesture:UISwipeGestureRecognizer?) {
        if (isGraphViewShowing) {
            
            //hide Graph
            UIView.transitionFromView(graphView,
                                      toView: LenseView,
                                      duration: 1.0,
                                      options: [UIViewAnimationOptions.TransitionFlipFromRight, UIViewAnimationOptions.ShowHideTransitionViews],
                                      completion:nil)
        } else {
            
            //show Graph
            
            // set hide for now setupGraphDisplay()
            
            UIView.transitionFromView(LenseView,
                                      toView: graphView,
                                      duration: 1.0,
                                      options: [UIViewAnimationOptions.TransitionFlipFromRight, UIViewAnimationOptions.ShowHideTransitionViews],
                                      completion: nil)
            // Abouttext.text = "All app design including graphic, font, background, sound, and coding \n by Dr. Alf.\n\r All Right Reserved. Forethink. 2016\r support@forethink.nu "
        }
        isGraphViewShowing = !isGraphViewShowing
    }
    func countperMin (countedpara: Int) -> Float{
        let seconds = countSec()
        let perMin = round(Float(countedpara)/(seconds/60)*10)/10
        print ("duration: \(seconds),counting per minutes: \(perMin)")
        return perMin
    }
    
    func copytoclipboard() {

            if CountedNumber == 0 {
                UIPasteboard.generalPasteboard().string = "No count."
            } else {
                let seconds = countSec()
                let CountlogperMin = countperMin(CountedNumber)
                let resulttocopy = "Counted: " + String(CountedNumber) + " times " + " for \(seconds) seconds , \(CountlogperMin) per a minute."
                UIPasteboard.generalPasteboard().string = resulttocopy
                print (resulttocopy)
            
        }
    
    }
    
    func exportCSV() -> String {
        var wholeLog = ""
        numberofLog = countLog.count - 1
        for countindex in 0...numberofLog {
        wholeLog = wholeLog + "\(countLog[countindex]),\(countperminLog[countindex]),\(countsecLog[countindex])\n"
        }
        let headerCSV = "counted number,count per a minute,counting seconds\n"
        let wholeLogstring = headerCSV + "\(wholeLog)"
        print (wholeLogstring)
    return wholeLogstring
    }

    @IBAction func showAlertTapped(sender: AnyObject) {
        //Create the AlertController
        
        if isGraphViewShowing == false {
        let countResult = "Counted: " + String(CountedNumber) + " times "
        let myAlertController: UIAlertController = UIAlertController(title: "Copying to Clipboard", message: countResult, preferredStyle: .Alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
            }
        myAlertController.addAction(cancelAction)
            
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "Copy", style: .Default) { action -> Void in
            self.copytoclipboard()
                    }
        myAlertController.addAction(nextAction)
        
        
        //Present the AlertController
            self.presentViewController(myAlertController, animated: true, completion: nil)
        }
        // if graphview is displayed copying popup is shown like this
        else {
        print("copy testing here")
            let logResult = "This will copy whole log to clipboard."
            let logAlertController: UIAlertController = UIAlertController(title: "Copying log to Clipboard", message: logResult, preferredStyle: .Alert)
            //Create and add the Cancel action
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
                //Do some stuff
            }
            logAlertController.addAction(cancelAction)
            
            //Create and an option action

            let nextAction: UIAlertAction = UIAlertAction(title: "Copy", style: .Default) { action -> Void in
                //copyinglogwillbehere
                //
                let exporttext = self.exportCSV()
                UIPasteboard.generalPasteboard().string = exporttext

            }
            logAlertController.addAction(nextAction)
            
            
            //Present the AlertController
            self.presentViewController(logAlertController, animated: true, completion: nil)
        
        }
    }

}