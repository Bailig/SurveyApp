//
//  FirstController.swift
//  SurveyApp
//
//  Created by Bailig Abhanar on 2017-04-30.
//  Copyright © 2017 Bailig Abhanar. All rights reserved.
//

import UIKit

class FirstController: UIViewController, UITextFieldDelegate {

    var survey: Survey?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var contactSwitch: UISwitch!
    @IBAction func switchChanged(_ sender: UISwitch) {
        survey?.contact = sender.isOn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        emailTextField.delegate = self
        
        if let survey = survey{
            contactSwitch.isOn = survey.contact
            nameTextField.text = survey.name
            emailTextField.text = survey.email
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        switch textField {
        case nameTextField:
            survey?.name = text
        case emailTextField:
            survey?.email = text
        default:
            break
        }
    }

}
