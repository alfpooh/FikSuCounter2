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
    
    private var isBasicShowing = true
    private let synth = AVSpeechSynthesizer()
    private var clicksound: AVAudioPlayer!
    private var clearsound: AVAudioPlayer!
    //private var swipingplayer: AVAudioPlayer!
    private var sayCount = AVSpeechUtterance(string: "")
    private var taxrate = 0.24
    private var tiprate = 0.14
    private var dotornot = false
    private var defaults = NSUserDefaults.standardUserDefaults()
    private var userIsInTheMiddleOfTyping = false
    private var brain = CalculatorBrain()
    private var memory:[String:String] = ["M1":"", "M2":"", "M3":""]
    
    
    var displayValue: Double {
        
        get {
            return Double(display.text!)!
        }
        
        set {
            display.text = String(newValue)
            funcDigits.text = String(newValue)
        }
    }
    

    
    @IBOutlet weak var clearall: FtkToolBtn!
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
    

    
    @IBAction func memoryDelete(sender: AnyObject) {
        let key = "M\(sender.tag+1)"
        SoundOut(2)
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
        defaults.setDouble(0, forKey: "TaxRate")
        defaults.synchronize()
        SoundOut(2)
        sender.setTitle(key, forState: .Normal)
        taxrate = 0.0
    }
    
    @IBAction func taxPlusButton(sender: UIButton) {
        
        if setTax.currentTitle == "Set Tax" {
        }
        else {
            let net = Double(display.text!)!
            displayValue = net+(net*taxrate)
            brain.result = displayValue
            userIsInTheMiddleOfTyping = false
        }
    }
    
    @IBAction func taxMinusButton(sender: UIButton) {
        
        if setTax.currentTitle == "Set Tax" {
        }
        else {
            let net = Double(display.text!)!
            displayValue = net-(net*taxrate)
            brain.result = displayValue
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
        defaults.setDouble(0, forKey: "TipRate")
        defaults.synchronize()
        SoundOut(2)
        sender.setTitle(key, forState: .Normal)
        tiprate = 0.0
    }
    
    @IBAction func tipPlusButton(sender: UIButton) {
        
        if sender.currentTitle == "Set Tip" {
        }
        else {
            let net = Double(display.text!)!
            displayValue = net+(net*tiprate)
            brain.result = displayValue
            userIsInTheMiddleOfTyping = false
        }
    }
    
    @IBAction func tipMinusButton(sender: UIButton) {
        
        if sender.currentTitle == "Set Tip" {
        }
        else {
            let net = Double(display.text!)!
            displayValue = net-(net*tiprate)
            brain.result = displayValue
            userIsInTheMiddleOfTyping = false
        }
    }
    
    
    @IBAction func clearCalc(sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            let textInTheCurrentDisplay = display.text!
            display.text = String(textInTheCurrentDisplay.characters.dropLast())
            if display.text == "" {
                display.text="0"
                SoundOut(2)
            userIsInTheMiddleOfTyping = false
            }
            
        } else {
        display.text = "0"
        brain.clear()
        brain.setOperand(displayValue)
        SoundOut(2)
        userIsInTheMiddleOfTyping = false
        }
    }
    

    @IBAction private func touchDigit (sender: UIButton) {
        SoundOut(1)
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
        SoundOut(1)
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        //strange case of -0.0
        if brain.result == -0.0 {brain.result = 0.0}
        displayValue = brain.result
        print ("\(brain.result)")
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sound setting
        // for sound

        
        do {
            let path = NSBundle.mainBundle().pathForResource("Click", ofType: "wav")
            let soundUrl = NSURL(fileURLWithPath: path!)
            try clicksound = AVAudioPlayer(contentsOfURL: soundUrl)
            let path1 = NSBundle.mainBundle().pathForResource("clear", ofType: "wav")
            let soundUrl1 = NSURL(fileURLWithPath: path1!)
            try clearsound = AVAudioPlayer(contentsOfURL: soundUrl1)
            clicksound.prepareToPlay()
            clearsound.prepareToPlay()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }

        
        // force to replace x superscript 2
        let xxx =  "x\u{B2}"
        XxX.setTitle(xxx, forState: .Normal)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.Tap))  //Tap function will call when user tap on button
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.Long)) //Long function will call when user long press on button.
        tapGesture.numberOfTapsRequired = 2
        clearall.addGestureRecognizer(tapGesture)
        clearall.addGestureRecognizer(longGesture)
        
        
        
        if let taxRate = defaults.objectForKey("TaxRate") as? Double
        {
            taxrate = taxRate
            if taxrate == 0 {
                setTax.setTitle(String ("Set Tax"), forState: .Normal)
            } else {
                setTax.setTitle(String ("Tax:\(taxrate)"), forState: .Normal)
                print ("Tax: \(taxrate)")}
        }
        if let tipRate = defaults.objectForKey("TipRate") as? Double
        {
            tiprate = tipRate
            if tiprate == 0 {
                setTip.setTitle(String ("Set Tip"), forState: .Normal)
            } else {
                setTip.setTitle(String ("Tip:\(tiprate)"), forState: .Normal)
                print ("Tip: \(tiprate)")
            }
            
        }
    }
    
    func Tap() {
        clearmemory()
        print("Double Tap happend")
    }
    
    func Long() {
        clearmemory()
        print("Long press")
    }
    
    private func clearmemory() {
        display.text = "0"
        displayValue = 0
        brain.clear()
        SoundOut(2)
        brain.setOperand(displayValue)
        funcDigits.text = display.text
        userIsInTheMiddleOfTyping = false
    
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

     private func SoundOut(index: Int){
        if index == 0 {
            sayCount = AVSpeechUtterance(string: display.text!)
            sayCount.rate = 0.5
            synth.speakUtterance(sayCount)}
        else if index == 1 {
            clicksound.volume = 0.1
            clicksound.play()}
        else if index == 2 {
            clearsound.volume = 0.1
            clearsound.play()}
    }
}


