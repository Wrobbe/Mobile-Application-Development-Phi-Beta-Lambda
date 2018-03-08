//  ViewController.swift
//  Weston Robbe
//  Phi Beta Lambda
//  Eastern Kentucky University

import UIKit

class ViewController: UIViewController {
    //outlets connecting GUI to code:
    @IBOutlet weak var nameBox: UITextField! //User-entered name
    @IBOutlet weak var output: UILabel! //output label which shows user their name and their bodyfat percentage based on their weight and waist.  Calculation based on the YMCA calculation which is:
    //Men's percentage of fat = (-98.42 + 4.15 * waist - .082 * weight) / weight
    //Women's percentage of fat = (-76.76 + 4.15 * waist - .082 * weight) / weight.
    
    @IBOutlet weak var heightSeg: UISegmentedControl! //User-input of inches or centimeters for waist measurement
    
    @IBOutlet weak var weightSeg: UISegmentedControl! //user-input of pounds or kilos for weight measurement
    
    @IBOutlet weak var weightText: UITextField!  //user-input of weight measurement
    
    @IBOutlet weak var heightText: UITextField!  //user-input of waist measurement
    
    @IBOutlet weak var gender: UISegmentedControl!  //user-input of male/female
    
    @IBAction func getReport(_ sender: Any) {
        var waist = Double(heightText.text!)!
        var weight = Double(weightText.text!)!
        //"get report" button which generates bodyfat percentage calculation based on user-input of fields listed above
        //translate from kilos to lbs if necessary
        if(weightSeg.selectedSegmentIndex == 1)
        {
            weight = weight * 2.20462
        }
        //translate from centimeters to inches
        if(heightSeg.selectedSegmentIndex == 1)
        {
            waist = waist * 0.393701
            
        }
        var total = 0.00 //keeps track of total weight
        if(gender.selectedSegmentIndex == 0) //if male
        {
            total = (-98.42 + 4.15 * waist - 0.082 * weight)/weight //calculate male total
        }
        else  //if female
        {
            total = (-76.76 + 4.15 * waist - 0.082 * weight)/weight  //calculate female total
        }
        //change to a percentage
        total = total * 10000
        total.round()
        total = total/100
        //change original text "name" and "percentage" to user inputted values
        output.text =
             output.text?.replacingOccurrences(of: "<percentage>", with: String(total))
        output.text = output.text!.replacingOccurrences(of: "<name>", with: nameBox.text!)
        output.isHidden = false //reveal text for user
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameBox.delegate = self as? UITextFieldDelegate
        weightText.delegate = self as? UITextFieldDelegate
        heightText.delegate = self as? UITextFieldDelegate
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //allows the keyboard to disappear after user is finished entering in information
    func keyboardTextFieldDismissal(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
    
}

