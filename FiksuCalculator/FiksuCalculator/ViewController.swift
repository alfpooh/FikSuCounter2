//
//  ViewController.swift
//  FiksuCalculator
//
//  Created by donghoon bae on 2016. 7. 14..
//  Copyright © 2016년 Forethink. All rights reserved.
//

import UIKit
import AVFoundation

extension Double {
    var isInteger: Bool {return rint(self) == self}
}


class ViewController: UIViewController {
    
    var isBasicShowing = true
    let synth = AVSpeechSynthesizer()
    var buttonclickplayer: AVAudioPlayer!
    var resultplayer: AVAudioPlayer!
    var swipingplayer: AVAudioPlayer!
    var sayCount = AVSpeechUtterance(string: "")
    var taxrate = 0.24
    var tiprate = 0.14
    var dotornot = false
    var defaults = NSUserDefaults.standardUserDefaults()
    

    private var userIsInTheMiddleOfTyping = false
    

    
    private var displayValue: Double {
        
        get {
            return Double(display.text!)!
        }
        
        set {
            display.text = String(newValue)
            funcDigits.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBOutlet weak var BasicPad: UIView!

    @IBOutlet weak var FunctionPad: UIView!
    @IBOutlet weak var funcDigits: UILabel!

    @IBOutlet weak var setTip: FtkToolBtn!
    @IBOutlet weak var setTax: FtkToolBtn!
    
    @IBOutlet weak var XxX: FtkToolBtn!
    @IBAction func sayDisplay(sender:AnyObject) {
    SoundOut(0)
    }
    
    
    
    

    @IBAction func copytoClipboard(sender: AnyObject) {
        UIPasteboard.generalPasteboard().string = display.text
    }
    
    //displaying digits
    @IBOutlet weak var display: UILabel!
    
    
    var memory:[String:String] = ["M1":"", "M2":"", "M3":""]
    
    @IBAction func memoryDelete(sender: AnyObject) {
        let key = "M\(sender.tag+1)"
        sender.setTitle(key, forState: .Normal)
        memory[key] = ""
    }
    
    
    @IBAction func memoryButton(sender: UIButton) {

        let key = "M\(sender.tag+1)"
        
        if memory[key] == "" {
            let MR = display.text
            memory[key] = MR
            sender.setTitle(MR, forState: .Normal)
        }
        else {
            display.text = memory[key]
            userIsInTheMiddleOfTyping = true        }
    }
    
    
    //TAX features
    
    @IBAction func taxButton(sender: UIButton) {
        
        if sender.currentTitle == "Set Tax" {
            taxrate = Double(display.text!)!
            let taxtitle = "Tax:\(display.text!)"
            defaults.setDouble(displayValue, forKey: "TaxRate")
            defaults.synchronize()
            sender.setTitle(taxtitle, forState: .Normal)

        }
        else {
            displayValue = taxrate
            userIsInTheMiddleOfTyping = false
        }
    }
    
    @IBAction func taxClear(sender: AnyObject) {
        let key = "Set Tax"
        sender.setTitle(key, forState: .Normal)
        taxrate = 0.0
    }
    
    @IBAction func taxPlusButton(sender: UIButton) {
        
        if setTax.currentTitle == "Set Tax" {
        }
        else {
            let net = Double(display.text!)!
            displayValue = net+(net*taxrate)
            userIsInTheMiddleOfTyping = false
        }
    }
    
    @IBAction func taxMinusButton(sender: UIButton) {
        
        if setTax.currentTitle == "Set Tax" {
        }
        else {
            let net = Double(display.text!)!
            displayValue = net-(net*taxrate)
            userIsInTheMiddleOfTyping = false
        }
    }
    
    
    // TIP feature
    
    @IBAction func tipButton(sender: UIButton) {
        
        if sender.currentTitle == "Set Tip" {
            tiprate = Double(display.text!)!
            defaults.setDouble(displayValue, forKey: "TipRate")
            defaults.synchronize()
            let tiptitle = "Tip:\(display.text!)"
            sender.setTitle(tiptitle, forState: .Normal)

        }
        else {
            displayValue = tiprate
            userIsInTheMiddleOfTyping = false
        }
    }
    
    @IBAction func tipClear(sender: AnyObject) {
        let key = "Set Tip"
        sender.setTitle(key, forState: .Normal)
        tiprate = 0.0
    }
    
    @IBAction func tipPlusButton(sender: UIButton) {
        
        if sender.currentTitle == "Set Tip" {
        }
        else {
            let net = Double(display.text!)!
            displayValue = net+(net*tiprate)
            userIsInTheMiddleOfTyping = false
        }
    }
    
    @IBAction func tipMinusButton(sender: UIButton) {
        
        if sender.currentTitle == "Set Tip" {
        }
        else {
            let net = Double(display.text!)!
            displayValue = net-(net*tiprate)
            userIsInTheMiddleOfTyping = false
        }
    }
    
    
    @IBAction func clearCalc(sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            let textInTheCurrentDisplay = display.text!
            display.text = String(textInTheCurrentDisplay.characters.dropLast())
            if display.text == "" {
                display.text="0"
            userIsInTheMiddleOfTyping = false
            }
            
        } else {
        display.text = "0"
        userIsInTheMiddleOfTyping = false
        }
    }
    

    @IBAction private func touchDigit (sender: UIButton) {
        let digit = sender.currentTitle!
        let textInTheCurrentDisplay = display.text!
        if userIsInTheMiddleOfTyping {
            switch digit {
            case "0" :
                // check if "00" case
                if textInTheCurrentDisplay == "0" {display.text = "0"
                    userIsInTheMiddleOfTyping = true}
                else {
                    display.text = textInTheCurrentDisplay + digit
                    userIsInTheMiddleOfTyping = true
                }
            case "." :
                if displayValue.isInteger == false {
                    print ("it has dot already")
                } else {
                    //isDot = true
                    print ("Adding dot ")
                    display.text = textInTheCurrentDisplay + digit
                    break
                }
                
            default:
                if textInTheCurrentDisplay == "0" {
                    display.text = digit
                }
                else {display.text = textInTheCurrentDisplay + digit}
                userIsInTheMiddleOfTyping = true
            }//switchend
        }
        else
        {
            // userIsInTheMiddleOfTyping = false
            if digit == "." {
                display.text = "0."
            } else {
                display.text = digit
            }
            userIsInTheMiddleOfTyping = true
            
        }
    }//func end

    

    
    @IBAction private func performOperation (sender: UIButton) {
        
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xxx =  "x\u{B2}"
        XxX.setTitle(xxx, forState: .Normal)
        
                    if let taxRate = defaults.objectForKey("TaxRate") as? Double
                    {
                    taxrate = taxRate
                    setTax.setTitle(String ("Tax:\(taxrate)"), forState: .Normal)
                        print ("Tax: \(taxrate)")
                    }
                    if let tipRate = defaults.objectForKey("TipRate") as? Double
                    {
                    tiprate = tipRate
                    setTip.setTitle(String ("Tip:\(tiprate)"), forState: .Normal)
                        print ("Tip: \(tiprate)")
                    }
        
 //       do {
//            let resourcePath =  NSBundle.mainBundle().pathForResource("Timer", ofType: "wav")!
//            let url = NSURL(fileURLWithPath: resourcePath)
//            try timerEffectplayer = AVAudioPlayer(contentsOfURL: url)
//            try timerLoudRingplayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("TimerLoudRing", ofType: "wav")!))
//            try timerShortRingplayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("TimerShortRing", ofType: "wav")!))
//            try timerRewindplayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("TimerRewind", ofType: "wav")!))
//            
//            timerEffectplayer.numberOfLoops = -1
//            timerEffectplayer.prepareToPlay()
//            timerLoudRingplayer.prepareToPlay()
//            timerShortRingplayer.prepareToPlay()
//            timerRewindplayer.prepareToPlay()
            
            
            
//        } catch let err as NSError {
//            print (err.debugDescription)
 //       }


    }
    
    @IBAction func counterViewSwipe (gesture:UISwipeGestureRecognizer?) {
        if (isBasicShowing) {
            UIView.transitionFromView(BasicPad,
                                      toView:FunctionPad,
                                      duration: 1.0,
                                      options: [UIViewAnimationOptions.TransitionFlipFromLeft, UIViewAnimationOptions.ShowHideTransitionViews],
                                      completion:nil)
                                        funcDigits.text = display.text
            let taxRate = NSUserDefaults.standardUserDefaults().valueForKey("TaxRate")
            print ("recoded taxrate:\(taxRate)")

            
            
        } else {
            UIView.transitionFromView(FunctionPad,
                                      toView: BasicPad,
                                      duration: 1.0,
                                      options: [UIViewAnimationOptions.TransitionFlipFromLeft, UIViewAnimationOptions.ShowHideTransitionViews],
                                      completion: nil)
                                        display.text = funcDigits.text}
                isBasicShowing = !isBasicShowing
    }
    
    @IBAction func counterViewSwipeback (gesture:UISwipeGestureRecognizer?) {
        if (isBasicShowing) {
            UIView.transitionFromView(BasicPad,
                                      toView:FunctionPad,
                                      duration: 1.0,
                                      options: [UIViewAnimationOptions.TransitionFlipFromRight
                                        , UIViewAnimationOptions.ShowHideTransitionViews],
                                      completion:nil)
            funcDigits.text = display.text
        } else {
            UIView.transitionFromView(FunctionPad,
                                      toView: BasicPad,
                                      duration: 1.0,
                                      options: [UIViewAnimationOptions.TransitionFlipFromRight
                                        , UIViewAnimationOptions.ShowHideTransitionViews],
                                      completion: nil)
            display.text = funcDigits.text}
        isBasicShowing = !isBasicShowing
    }

    func SoundOut(index: Int){
        if index == 0 {
            print ("sound shoud be out!")
            sayCount = AVSpeechUtterance(string: display.text!)
            sayCount.rate = 0.5
            synth.speakUtterance(sayCount)}
        else if index == 1 {
            buttonclickplayer.play()}
        else if index == 2 {
            resultplayer.play()}
        else if index == 3 {
            swipingplayer.play()}
    }

    
}

