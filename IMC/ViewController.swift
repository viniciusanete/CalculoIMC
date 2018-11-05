//
//  ViewController.swift
//  IMC
//
//  Created by Vinicius Anete on 05/11/2018.
//  Copyright © 2018 Vinicius Anete. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfPeso: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    @IBOutlet weak var lbResultado: UILabel!
    @IBOutlet weak var ivResultado: UIImageView!
    @IBOutlet weak var viewResultado: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func Calcular(_ sender: Any) {
        if let peso = Double(tfPeso.text!), let altura = Double(tfAltura.text!) {
            imc = peso / pow(altura, 2)
            showResult()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func showResult(){
        var result: String
        var imagem: String
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                imagem = "abaixo"
                break
            case 16..<18.5:
                result = "Abaixo do peso"
                imagem = "abaixo"
                break
            case 18.5..<25:
                result = "Peso ideal"
                imagem = "ideal"
                break
            case 25..<30:
                result = "Sobrepeso"
                imagem = "sobre"
                break
            default:
                result = "Obesidade"
                imagem = "obesidade"
            }
        
        lbResultado.text = "\(Int(imc)): \(result)"
        ivResultado.image = UIImage(named: imagem)
        viewResultado.isHidden = false
        view.endEditing(true)
    }
    
}

