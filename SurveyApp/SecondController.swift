//
//  SecondController.swift
//  SurveyApp
//
//  Created by Bailig Abhanar on 2017-04-30.
//  Copyright © 2017 Bailig Abhanar. All rights reserved.
//

import UIKit

class SecondController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let locations = ["Toronto", "Ottawa", "Richmond Hill", "Kingston"]
    var survey: Survey?
    
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var locationPickerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var locationPickerView: UIPickerView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overallStepper: UIStepper!
    
    @IBOutlet weak var decorLabel: UILabel!
    @IBOutlet weak var decorSlider: UISlider!
    
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var serviceSlider: UISlider!
    
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var foodSlider: UISlider!
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        survey?.rating = stepperValue
        ratingLabel.text = "Ratting: \(stepperValue)"
    }
    
    @IBAction func locationButtonTapped(_ sender: Any) {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.25, animations: {
            self.locationPickerHeightConstraint.constant = 216
            self.view.layoutIfNeeded()
        }) { (completed: Bool) in
            
            UIView.animate(withDuration: 0.25, animations: {
                self.locationPickerView.alpha = 1
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let sliderValue = Int(sender.value)
        
        sender.value = Float(sliderValue)
        
        switch sender {
        case decorSlider:
            survey?.decor = sliderValue
            decorLabel.text = "Rating: \(sliderValue)"
        case serviceSlider:
            survey?.service = sliderValue
            serviceLabel.text = "Rating: \(sliderValue)"
        case foodSlider:
            survey?.food = sliderValue
            foodLabel.text = "Rating: \(sliderValue)"
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationPickerView.delegate = self
        locationPickerView.dataSource = self
        
        if let survey = survey {
            if let locationIndex = locations.index(of: survey.location) {
                locationPickerView.selectRow(locationIndex, inComponent: 0, animated: false)
                locationButton.setTitle(survey.location, for: .normal)
            }
            overallStepper.value = Double(survey.rating)
            ratingLabel.text = "Ratting: \(survey.rating)"
            decorSlider.value = Float(survey.decor)
            serviceSlider.value = Float(survey.service)
            foodSlider.value = Float(survey.food)
        }
    }
    
    // MARK: - pick location
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locations.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locations[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let location = locations[row]
        
        survey?.location = location
        locationButton.setTitle(location, for: .normal)
        
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.25, animations: {
            self.locationPickerView.alpha = 0
            self.view.layoutIfNeeded()
        }) { (completed: Bool) in
            
            UIView.animate(withDuration: 0.25, animations: {
                self.locationPickerHeightConstraint.constant = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
}
