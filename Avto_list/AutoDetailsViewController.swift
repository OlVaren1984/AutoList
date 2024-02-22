//
//  AutoDetailsViewController.swift
//  Avto_list
//
//  Created by Олег Варенников  on 27.01.2024.
//

import UIKit

class AutoDetailsViewController: UIViewController {
    
    //MARK: Private color
    private let primatyColorView = UIColor( //Значение цвета с верху экрана
        red: 220/255,
        green: 240/255,
        blue: 255/255,
        alpha: 1
    )
    private let secondaryColorView = UIColor( // Значение цвета с низу экрана
        red: 180/255,
        green: 204/255,
        blue: 222/255,
        alpha: 1
    )
    
    //MARK: Outlets
    @IBOutlet var ButtonExit: UIButton!
    @IBOutlet var artCoverImageView: UIImageView!
    @IBOutlet var autoNameLabel: UILabel!
    
    var auto: Auto!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artCoverImageView.image = UIImage(named: auto.name)
        autoNameLabel.text = auto.name
        
        ButtonExit.setTitle("EXIT", for: .normal)
        
        //Градиент экрана, смена цвета на градиент
        addVerticalGradientLauerView(topColor: primatyColorView, bottonColor: secondaryColorView)
        
    }
    
    // Возврат на предыдущий экран
    @IBAction func exitButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
// MARK: - Set background color
extension AutoDetailsViewController {
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
