//
//  InfoViewController.swift
//  mom
//
//  Created by Gabriel Dezena on 15/10/16.
//  Copyright © 2016 Gabriel Dezena. All rights reserved.
//

import UIKit
import UserNotifications


class InfoViewController: UIViewController {

    @IBOutlet weak var totalSono: UILabel!
    @IBOutlet weak var dataFim: UILabel!
    @IBOutlet weak var dataInicio: UILabel!
    @IBOutlet weak var horaFim: UILabel!
    @IBOutlet weak var horaInicio: UILabel!
    @IBOutlet weak var son: UILabel!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var codigo: UILabel!
    @IBOutlet weak var statusSwitch: UISwitch!
    var controladorTimer: ControladorTimer?

    let infos = Singleton.currentUser()
    
    @IBAction func actionSwitch(_ sender: AnyObject) {
        
        if statusSwitch.isOn{
            print("LALALALALALALALALAL")
            status.text = "disponivel"
            status.textColor = UIColor.green
        }else{
            status.text = "ocupado"
            status.textColor = UIColor.red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        son.textColor = UIColor.green
       
        nome.text = self.infos.nome
        codigo.text = self.infos.codigo
        
        if (infos.status == "disponivel"){
            status.textColor = UIColor.green
        }else{
            status.textColor = UIColor.red
        }
        
        controladorTimer = ControladorTimer(timerInterval: 15, fromViewController: self)
        status.text = infos.status
        controladorTimer?.startTimer()
    }
    
    
    @IBAction func atualizar(_ sender: AnyObject) {
        horaInicio.text = "01:54"
        horaFim.text = "05:42"
        dataInicio.text = "15/10/2016"
        dataFim.text = "15/10/2016"
        totalSono.text = "03:48"
        son.text = "Ruim"
        son.textColor = UIColor.red
        
        let request = NSMutableURLRequest(url: URL(string: "http://freteconsciente.com.br/InsertMonitoramento.php")!)
        request.httpMethod = "POST"
        let postString = "hi=\(horaInicio.text!)&hf=\(horaFim.text!)&di=\(dataInicio.text!)&df=\(dataFim.text!)&th=\(totalSono.text!)&nome=\(nome.text!)&cm=\(codigo.text!)"
        
        
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
        
    }
    
    
    @IBAction func logout(_ sender: AnyObject) {
        
        self.performSegue(withIdentifier: "logout", sender: self)
        let infos = Singleton.currentUser()
        infos.logado = false
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNotification(){
        let notifyAlarm = UNMutableNotificationContent()
        
        notifyAlarm.categoryIdentifier = "MOM"
        notifyAlarm.title = "Solicitação"
        notifyAlarm.body = "Voce foi solicitado para fazer um frete, deseja ver detalhes?"
        notifyAlarm.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest.init(identifier: "MOM", content: notifyAlarm, trigger: trigger)
        
        // Schedule the notification.
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            
            if(error != nil){
                print("Erro na notificação: \(error)")
            }
        }
    }
    

}
