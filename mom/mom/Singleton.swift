//
//  Singleton.swift
//  mom
//
//  Created by Gabriel Dezena on 15/10/16.
//  Copyright © 2016 Gabriel Dezena. All rights reserved.
//

import UIKit

class Singleton: NSObject {
    
    //Singleton utilizado
    
    var nome: String
    var codigo: String
    var status: String
    var logado : Bool
    
    
    //Iniciar o singleton
    init(nome: String, codigo: String, status: String, logado : Bool){
        
        self.nome = nome
        self.codigo = codigo
        self.status = status
        self.logado = logado
    }
    
    //Variavel do tipo da classe
    fileprivate static var teste: Singleton?
    
    //Retornar sempre o usuário atual
    static func currentUser() -> Singleton{
        
        return teste!
    }
    
    //Iniciar o singleton e retornar o usuário atual
    static func currentUser(_ nome: String, codigo: String, status: String, logado: Bool) -> Singleton{
        
        
        teste = Singleton(nome: nome, codigo: codigo, status: status, logado: logado)
        
        return teste!
    }


}
