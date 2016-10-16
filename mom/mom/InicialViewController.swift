//
//  ViewController.swift
//  mom
//
//  Created by Gabriel Dezena on 15/10/16.
//  Copyright © 2016 Gabriel Dezena. All rights reserved.
//

import UIKit

class InicialViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usuario: UITextField!
    @IBOutlet weak var senha: UITextField!
    
    var values:NSArray = []
    
    var user = ""
    var pass = ""
    var logado = false
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        usuario.text = ""
        senha.text = ""

    }
    
    @IBAction func logar(_ sender: AnyObject) {
        
        self.user = usuario.text!
        self.pass = senha.text!
        
        print(self.user)
        print(self.pass)

        let urlRequest = URL(string: "http://freteconsciente.com.br/login-motorista.php?email="+self.user+"&"+"senha="+pass)
        let dataFace = try? Data(contentsOf: urlRequest!)
        
        do{
            //Caso tenha
            values = try JSONSerialization.jsonObject(with: dataFace!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
            
            let mainData = values.object(at: 0) as! NSDictionary
            let nome = mainData["NOME"] as! String
            let condigo = mainData["COD_MOTORISTA"] as! String
            let status = mainData["STATUS"] as! String

            
        _=Singleton.currentUser(nome, codigo: condigo, status: status, logado: true)
            
        let startApp = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
            self.show(startApp, sender: self)
            
        }catch {
            
            //Caso não exista
            let alert = UIAlertController(title: "Error", message: "Usuario ou senha invalido", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       _ = Singleton.currentUser("", codigo: "", status: "", logado: false)

        self.usuario.delegate = self
        self.senha.delegate = self

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let infos = Singleton.currentUser()

        
        if infos.logado == true{
           // let vc = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
            
            //self.present(vc, animated: false, completion: nil)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }


}

