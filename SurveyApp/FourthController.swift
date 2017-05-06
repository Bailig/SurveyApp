//
//  FourthController.swift
//  SurveyApp
//
//  Created by Bailig Abhanar on 2017-04-30.
//  Copyright © 2017 Bailig Abhanar. All rights reserved.
//

import UIKit
import Firebase

class FourthController: UIViewController {

    var survey: Survey?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let survey = survey {
            let dic: [String: Any] = [
                "name": survey.name,
                "email": survey.email,
                "contact": survey.contact,
                "location": survey.location,
                "rating": survey.rating,
                "decor": survey.decor,
                "service": survey.service,
                "food": survey.food,
                "comment": survey.comment
            ]
            
            FIRDatabase.database().reference().child("surveys").childByAutoId().setValue(dic)
        }
    }

}
