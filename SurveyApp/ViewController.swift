//
//  ViewController.swift
//  SurveyApp
//
//  Created by Bailig Abhanar on 2017-04-30.
//  Copyright © 2017 Bailig Abhanar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentController: UIViewController?
    var pageIndex = 1
    var survey = Survey()
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBAction func nextTapped(_ sender: Any) {
        switch pageIndex {
        case 1:
            let nextController = storyboard?.instantiateViewController(withIdentifier: "SecondController")
            if let fromController = currentController, let toController = nextController as? SecondController {
                toController.survey = survey
                moveAndSizeChildControllers(fromController: fromController, toController: toController)
                pageIndex += 1
                setButtonAndProgressLabel()
            }
        case 2:
            let nextController = storyboard?.instantiateViewController(withIdentifier: "ThirdController")
            if let fromController = currentController, let toController = nextController as? ThirdController {
                toController.survey = survey
                moveAndSizeChildControllers(fromController: fromController, toController: toController)
                pageIndex += 1
                setButtonAndProgressLabel()
            }
        case 3:
            let nextController = storyboard?.instantiateViewController(withIdentifier: "FourthController")
            if let fromController = currentController, let toController = nextController as? FourthController {
                toController.survey = survey
                moveAndSizeChildControllers(fromController: fromController, toController: toController)
                pageIndex += 1
                setButtonAndProgressLabel()
            }
        default:
            break
        }
    }
    @IBAction func backTapped(_ sender: Any) {
        switch pageIndex {
        case 2:
            let nextController = storyboard?.instantiateViewController(withIdentifier: "FirstController")
            if let fromController = currentController, let toController = nextController as? FirstController {
                toController.survey = survey
                moveAndSizeChildControllers(fromController: fromController, toController: toController)
                pageIndex -= 1
                setButtonAndProgressLabel()
            }
        case 3:
            let nextController = storyboard?.instantiateViewController(withIdentifier: "SecondController")
            if let fromController = currentController, let toController = nextController as? SecondController {
                toController.survey = survey
                moveAndSizeChildControllers(fromController: fromController, toController: toController)
                pageIndex -= 1
                setButtonAndProgressLabel()
            }
        default:
            break
        }
    }
    
    @IBOutlet weak var backTapped: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        currentController = segue.destination
        if let firstController = currentController as? FirstController {
            firstController.survey = survey
        }
        setButtonAndProgressLabel()
    }

    func moveAndSizeChildControllers(fromController: UIViewController, toController: UIViewController) {
        fromController.willMove(toParentViewController: nil)
        
        toController.view.frame = containerView.bounds
        
        addChildViewController(toController)
        containerView.addSubview(toController.view)
        
        // animatin
        toController.view.alpha = 0
        UIView.animate(withDuration: 0.5, animations: { 
            toController.view.alpha = 1
            fromController.view.alpha = 0 
        }) { (completed) in
            fromController.view.removeFromSuperview()
            fromController.removeFromParentViewController()
            
            toController.didMove(toParentViewController: self)
            self.currentController = toController
        }
    }
    
    func setButtonAndProgressLabel() {
        switch pageIndex {
        case 1:
            backButton.alpha = 0
            nextButton.alpha = 1
            nextButton.setTitle("Next", for: .normal)
        case 2:
            backButton.alpha = 1
            nextButton.alpha = 1
            nextButton.setTitle("Next", for: .normal)
        case 3:
            backButton.alpha = 1
            nextButton.alpha = 1
            nextButton.setTitle("Submit", for: .normal)
        case 4:
            backButton.alpha = 0
            nextButton.alpha = 0
            progressLabel.isHidden = true
        default:
            break
        }
        
        progressLabel.text = "\(pageIndex) / 3"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

