//
//  ViewController.swift
//  General Knowledge
//
//  Created by Omar Faruqe on 2016-02-11.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var currentSummary: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let url = NSURL(string: "https://api.forecast.io/forecast/6a8e44a2f24bb89a7edd5e833d9ce996/45.5602804,-73.8516133?units=si") {
            if let data = NSData(contentsOfURL: url){
                do {
                    let parsed = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                    
                    let newDict = parsed as? NSDictionary
                    print(newDict!["currently"])
                    
                    if let counter = (newDict!["currently"]!["time"])!!.doubleValue {
                        // do something
                        let date = NSDate(timeIntervalSince1970: counter)
                        print(date)
                    }
                    
                    self.currentTemp.text = "\(newDict!["currently"]!["temperature"]!!) ℃,"
                    self.currentSummary.text = "\(newDict!["currently"]!["summary"]!!)"
                    
                }
                catch let error as NSError {
                    print("A JSON parsithng error occurred, here are the details:\n \(error)")
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func answer1Selected(sender: UIButton) {
        showAlert("Wrong!", title: "Bummer, you got it wrong!")
    }

    @IBAction func answer2Selected(sender: UIButton) {
        showAlert("Correct!", title: "Whoo! That is the correct response")
    }
    
    @IBAction func answer3Selected(sender: UIButton) {
        showAlert("Wrong!", title: "Bummer, you got it wrong!")
    }
    
    @IBAction func answer4Selected(sender: UIButton) {
        showAlert("Wrong!", title: "Bummer, you got it wrong!")
    }
    
    func showAlert(status: String, title:String) { // 1
        let alertController = UIAlertController(title: status, message: title, preferredStyle: .Alert) // 2
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in //3
        }
        alertController.addAction(cancelAction)
        
        let ok = UIAlertAction(title: "OK", style: .Default) { (action) in
        } // 4
        alertController.addAction(ok)
        
        self.presentViewController(alertController, animated: true) { // 5
        }
    }
    
    
}

