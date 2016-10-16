//
//  CadastroViewController.swift
//  mom
//
//  Created by Gabriel Dezena on 15/10/16.
//  Copyright © 2016 Gabriel Dezena. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var cep: UITextField!
    @IBOutlet weak var numero: UITextField!
    @IBOutlet weak var nascimento: UITextField!
    @IBOutlet weak var cpf: UITextField!
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var carteira: UITextField!
    @IBOutlet weak var cadastrar: UIButton!
    
    var cod:String = ""
    
    let modelName = UIDevice.current.modelName
    var activeTextField = UITextField()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.nome.delegate = self
        self.email.delegate = self
        self.senha.delegate = self
        self.cep.delegate = self
        self.numero.delegate = self
        self.nascimento.delegate = self
        self.cpf.delegate = self
        self.telefone.delegate = self
        self.carteira.delegate = self
        
        
        
//        NotificationCenter.default.addObserver(self, selector: (#selector(CadastroViewController.keyboardWillShow(_:))), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
//        NotificationCenter.default.addObserver(self, selector: (#selector(CadastroViewController.keyboardWillHide(_:))), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
        
    //let margins = view.layoutMarginsGuide
    //cadastrar.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -80).isActive = true


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func keyboardWillHide(_ sender: Notification) {
//        self.view.frame.origin.y = 0
//        print("-----------------------------")
//
//    }
//
//    func keyboardWillShow(_ sender: Notification) {
//        if(modelName == "iPhone 5" || modelName == "iPhone 5c"
//            || modelName == "iPhone 5s" || modelName == "iPhone SE"){
//            
//            if(activeTextField == nome){
//                self.view.frame.origin.y = 0
//            }
//            else if(activeTextField == nascimento){
//                self.view.frame.origin.y = 0
//            }
//            else if(activeTextField == rg){
//                self.view.frame.origin.y = 0
//            }
//            else if(activeTextField == cpf){
//                self.view.frame.origin.y = 0
//            }
//            else if(activeTextField == sangue){
//                self.view.frame.origin.y = 120
//            }
//            else if(activeTextField == telefone){
//                self.view.frame.origin.y = 120
//            }
//            else if(activeTextField == categoria){
//                self.view.frame.origin.y = 120
//            }
//            else if(activeTextField == carteira){
//                self.view.frame.origin.y = 120
//            }
//            
//        }
//    }
    
    

    @IBAction func cadastrar(_ sender: AnyObject) {
        
        if((nome.text == "")||(email.text == "")||(senha.text == "")||(cep.text == "")||(numero.text == "")||(nascimento.text == "")||(cpf.text == "")||(telefone.text == "")||(carteira.text == "")){
            
            
            let alert = UIAlertController(title: "Erro", message: "Campo obrigatorio não preenchido!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            
            //Caso esteja tudo certo, inserir o usuario
        
            
//            _ = Singleton.currentUser("12", nome: self.nome.text!, rg: self.rg.text!, cpf: self.cpf.text!, sangue: self.sangue.text!, telefone: self.telefone.text!, categoria: self.categoria.text!, carteira: self.carteira.text!, logado: true)
            
            let nomeAux = nome.text
            let nascAux = nascimento.text
            let cepAux = cep.text
            let firstChar = nomeAux![(nomeAux!.startIndex)]
            let lastChar = nomeAux![(nomeAux!.index(before: (nomeAux!.endIndex)))]
            let firstChar2 = nascAux![(nascAux!.startIndex)]
            let lastChar2 = nascAux![(nascAux!.index(before: (nascAux!.endIndex)))]
            let firstChar3 = cepAux![(cepAux!.startIndex)]
            let lastChar3 = cepAux![(cepAux!.index(before: (cepAux!.endIndex)))]
            cod = "\(firstChar)p\(lastChar)\(firstChar2)Q\(lastChar2)8\(firstChar3)z\(lastChar3)X"
            print(cod)
            
            let request = NSMutableURLRequest(url: URL(string: "http://freteconsciente.com.br/insertMotorista.php")!)
            request.httpMethod = "POST"
            let postString = "nome=\(nome.text!)&email=\(email.text!)&senha=\(senha.text!)&telefone=\(telefone.text!)&numero=\(numero.text!)&cep=\(cep.text!)&cnh=\(carteira.text!)&status=\("disponivel")&cm=\(cod)&dn=\(nascimento.text!)&cpf=\(cpf.text!)"
            
            
            request.httpBody = postString.data(using: String.Encoding.utf8)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
                data, response, error in
                
                if error != nil {
                    print("error=\(error)")
                    return
                }
                
                print("response = \(response)")
                
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("responseString = \(responseString)")
            })
            task.resume()

            
            
            
            let alertController = UIAlertController(title: "Sucesso", message: "Cadastro feito com sucesso.", preferredStyle: .alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                UIAlertAction in
                
//                let startApp = self.storyboard?.instantiateViewController(withIdentifier: "NavViewController") as! NavViewController
//                self.dismiss(animated: true, completion: nil);
                
                self.performSegue(withIdentifier: "FirstViewController", sender: self)
                
                
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
                UIAlertAction in
                
            }
            
            // Add the actions
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            // Present the controller
            self.present(alertController, animated: true, completion: nil)
            
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}

public extension UIDevice {
    //Classe para verificar qual aparelho o usuário esta utilizando
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 , value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":return "iPad Pro"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    
}


