//
//  ResultsViewController.swift
//  GenderGuesser-ios
//
//  Created by Darius Vilcinskis on 13/11/2017.
//  Copyright © 2017 Darius Vilcinskis. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //MARK: properties
    var genderModel: GenderModel? = nil

    //MARK: actions
    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var percentage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard genderModel != nil else {
            setFailingValues()
            return
        }
        
        guard genderModel?.gender != nil else {
            setFailingValues()
            return
        }
        
        switch (genderModel?.gender)! {
        case "male":
            genderImage.image = UIImage(named: "male")
            percentage.text = "\(((genderModel?.probability)! * 100).description)%"
        case "female":
            genderImage.image = UIImage(named: "female")
            percentage.text = "\(((genderModel?.probability)! * 100).description)%"
        default:
            genderImage.image = UIImage(named: "question_mark")
            percentage.text = ":("
        }
    }
    
    private func setFailingValues() {
        percentage.text = ":("
        genderImage.image = UIImage(named: "question_mark")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
