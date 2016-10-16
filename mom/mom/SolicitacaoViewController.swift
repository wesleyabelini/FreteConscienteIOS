//
//  SolicitacaoViewController.swift
//  mom
//
//  Created by Gabriel Dezena on 16/10/16.
//  Copyright © 2016 Gabriel Dezena. All rights reserved.
//

import UIKit

class SolicitacaoViewController: UIViewController {

    @IBAction func aceitar(_ sender: AnyObject) {
    }
    
    @IBAction func recusar(_ sender: AnyObject) {
        
        //Caso sim chamar a tela de lista com o filtro selecionado
        
        let startApp = self.storyboard?.instantiateViewController(withIdentifier: "nav") as! NavViewController
        self.show(startApp, sender: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
