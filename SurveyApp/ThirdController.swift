//
//  ThirdController.swift
//  SurveyApp
//
//  Created by Bailig Abhanar on 2017-04-30.
//  Copyright © 2017 Bailig Abhanar. All rights reserved.
//

import UIKit

class ThirdController: UIViewController, UITextViewDelegate {

    var survey: Survey?

    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self

        textView.layer.cornerRadius = 5
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard let text = textView.text else { return }
        survey?.comment = text
    }
}
