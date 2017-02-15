//
//  ViewController.swift
//  HapticFeedback
//
//  Created by Enrique Ugalde on 15/02/17.
//  Copyright © 2017 Enrique Ugalde. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var i = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let btn = UIButton()
        btn.frame = CGRect(x: (view.bounds.width-100.0)/2, y: (view.bounds.height-100.0)/2, width: 100.0, height: 100.0)
        btn.setTitle("Try Haptic!", for: .normal)
        btn.backgroundColor = UIColor.red
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
        view.addSubview(btn)
    }
    
    func tapped()
    {
        i += 1
        //validate if the device supports the haptic
        let device : Int = UIDevice.current.value(forKey: "_feedbackSupportLevel") as! Int
        /*returns 2 for iPhone 7, 1 for iPhone 6 and 0 for earlier models*/
        switch device
        {
        case 2:
            print("feedback maybe available")
            print("Running \(i)")
                switch self.i
                {
                case 1:
                    let generator = UINotificationFeedbackGenerator()
                    generator.prepare() //If you don't do this, and there is a slight delay between the visual effect and the matching haptic, it might confuse users more than it helps.
                    generator.notificationOccurred(.error)
                    
                case 2:
                    let generator = UINotificationFeedbackGenerator()
                    generator.prepare()
                    generator.notificationOccurred(.success)
                    
                case 3:
                    let generator = UINotificationFeedbackGenerator()
                    generator.prepare()
                    generator.notificationOccurred(.warning)
                    
                case 4:
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.prepare()
                    generator.impactOccurred()
                    
                case 5:
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.prepare()
                    generator.impactOccurred()
                    
                case 6:
                    let generator = UIImpactFeedbackGenerator(style: .heavy)
                    generator.prepare()
                    generator.impactOccurred()
                    
                default:
                    let generator = UISelectionFeedbackGenerator()
                    generator.selectionChanged()
                    generator.prepare()
                    self.i = 0
                }
            break
        default:
            print("feedback not available")
            break
        }
    }
}
