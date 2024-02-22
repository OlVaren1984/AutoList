//
//  StartViewController.swift
//  Avto_list
//
//  Created by Олег Варенников  on 29.01.2024.
//

import UIKit

class StartViewController: UIViewController {
    
    //MARK: Private color
    private let primatyColorView = UIColor( //Значение цвета с верху экрана
        red: 242/255,
        green: 229/255,
        blue: 210/255,
        alpha: 1
    )
    private let secondaryColorView = UIColor( // Значение цвета с низу экрана
        red: 77/255,
        green: 111/255,
        blue: 148/255,
        alpha: 1
    )
    
    //MARK: IBOutlets
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var startButtonId: UIButton!
    @IBOutlet var startButtonIdent: UIButton!
    @IBOutlet var startButtonTwo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "ВЫБЕРИ СВОЮ МАШИНУ"
        textLabel.textColor = .red
        
        //Градиент экрана, смена цвета на градиент
        addVerticalGradientLauerView(topColor: primatyColorView, bottonColor: secondaryColorView)
    }
    
    @IBAction func goId(_ sender: Any) {
        let _: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let avtoListViewController = storyboard?.instantiateViewController(identifier: "vc") as! AvtoListViewController
        self.present(avtoListViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func goVc(_ sender: Any) {
        performSegue(withIdentifier: "govc", sender: nil)
    }
    
    // MARK: - Navigation
    /*
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "startSegue" {
     let userDetailsVC = segue.destination as! AvtoListViewController
     userDetailsVC.autoList = sender as! [Auto]
     }
     }
     */
}

// MARK: - Set background color

extension StartViewController {
    func addVerticalGradientLauerView(topColor: UIColor, bottonColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds // задаем границы, как будет располагаться цвет  - по границам экрана (view)
        gradient.colors = [topColor.cgColor, bottonColor.cgColor]
        gradient.locations = [0.0, 1.0] // задаем границы от куда начать и где закончить, весь экран площадь - это 1, соответственно от 0 до   1
        gradient.startPoint = CGPoint(x: 0, y: 0) // передаем координаты, откуда начать
        gradient.endPoint = CGPoint(x: 0, y: 1) // передаем координаты, где закончить
        view.layer.insertSublayer(gradient, at: 0) // вызываем градиент
    }
}
