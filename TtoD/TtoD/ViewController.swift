//
//  ViewController.swift
//  TtoD
//
//  Created by Admin on 07.04.16.
//  Copyright © 2016 Slimikus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Objem.delegate = self
        Skoroct.delegate = self
        
    }
    
    @IBOutlet weak var Objem: UITextField!
    @IBOutlet weak var Skoroct: UITextField!
    @IBOutlet weak var Result: UILabel!
    @IBAction func Raschet(sender: UIButton) {
        
        let a = Int(Objem.text!)!
        let b = Int(Skoroct.text!)!
        let sum = a + b
        let printLabel = "\(sum)"
        Result.text = printLabel
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first! as UITouch! {
            view.endEditing(true)
        }
        super.touchesBegan(touches, withEvent: event)
    }

}

