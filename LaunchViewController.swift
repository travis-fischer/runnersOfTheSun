//
//  LaunchViewController.swift
//  RunnersOfTheSun
//
//  Created by Amelia Merrill on 5/26/19.
//  Copyright © 2019 CandySomething inc. All rights reserved.
//

import UIKit

class SwipeFromLeftSegue: UIStoryboardSegue {
    override func perform() {
        let src = self.source
        let dst = self.destination
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: -src.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseOut, animations: {
            dst.view.transform = CGAffineTransform(translationX: -src.view.frame.size.width, y: 0)},
                       completion: { finished in
                        src.present(dst, animated: false, completion: nil)
        })
    }
}
class LaunchViewController: UIViewController {
    
    @IBOutlet weak var runnersLabel: UILabel!
    @IBOutlet weak var oracleDeckLabel: UILabel!
    @IBOutlet weak var arrow: UILabel!
    
    let toView = ViewController.self

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        runnersLabel.center.y += view.bounds.height
        oracleDeckLabel.center.y += view.bounds.height
        arrow.center.x += view.bounds.width
        
        UIView.animate(withDuration: 2.8, delay: 0, options: [.curveEaseOut], animations: {
            self.runnersLabel.center.y -= self.view.bounds.height
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 2.6, delay: 0.9, options: [.curveEaseOut], animations: {
            self.oracleDeckLabel.center.y -= self.view.bounds.height
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 2.8, delay: 4.1, options: [.curveEaseOut], animations: {
            self.arrow.center.x -= self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
