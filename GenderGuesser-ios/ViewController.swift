//
//  ViewController.swift
//  GenderGuesser-ios
//
//  Created by Darius Vilcinskis on 11/11/2017.
//  Copyright © 2017 Darius Vilcinskis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: properties
    var genderModel: GenderModel?
    
    //MARK: outlets
    @IBOutlet weak var nameTextField: UITextField!
    
    //MARK: actions
    @IBAction func calculatePressed(_ sender: UIButton) {
        let gc = GenderClient()
        gc.getGender(name: nameTextField.text!, response: ShowResults)
    }
    
    func ShowResults (genderModel: GenderModel) {
        self.genderModel = genderModel
        performSegue(withIdentifier: "mySegueID", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            super.prepare(for: segue, sender: sender)
        
        guard let storyboard = segue.destination as? ResultsViewController else {
            return
        }
        
        storyboard.genderModel = self.genderModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

