//
//  LogoViewController.swift
//  mom
//
//  Created by Gabriel Dezena on 15/10/16.
//  Copyright © 2016 Gabriel Dezena. All rights reserved.
//

import UIKit

class LogoViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        UIView.animate(withDuration: 2.5, delay: 0.0, options: [],  animations: {
           
            self.label.alpha = 0
            
            }, completion: { (finished: Bool) -> Void in
                
                let startApp = self.storyboard?.instantiateViewController(withIdentifier: "nav") as! NavViewController
                self.present(startApp, animated: false)
                
            })
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
