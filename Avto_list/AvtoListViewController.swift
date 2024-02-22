//
//  AvtoListViewController.swift
//  Avto_list
//
//  Created by Олег Варенников  on 26.01.2024.
//

import UIKit

class AvtoListViewController: UITableViewController {
    //инициализируем список машин, создаем массив и обращаемся к модели авто и вызываем метод гетАвто
    var autoList = Auto.getAuto()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //выравниваем высоту строки, чтобы поместилось изображение, для всего табличного представления
        tableView.rowHeight = 65
        // Реализумем метод входа в режиме редактирования, два варианта, кнопка с лева и кнопка с права
        // navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //присваиваем количество сторк в ячейке кол-ву позицй в массие autoList строка 12 который
        autoList.count
    }
    // Добавляем функцию масштабирования изображения до нужного размера, так как изначально картинки все были разного размера, для этого вводим функфию  imageWithHeight() и в переопределенном методе override func tableView() импользуем ее для ввода откорректированной картинки в поле image уже в нужную нам ячейку.
    func imageWithHeight(image: UIImage, scaledToSize newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // Функция UIGraphicsEndImageContext() используется для завершения текущего контекста рисования, который был создан с помощью UIGraphicsBeginImageContext() или аналогичного метода. Когда  начинаем новый контекст рисования с помощью UIGraphicsBeginImageContext(), все операции рисования будут происходить в этом новом контексте, поэтому важно завершить его, когда больше не нужно рисовать. Освобождение ресурсов, занятых контекстом рисования, происходит с вызовом UIGraphicsEndImageContext(). Это важно для освобождения памяти и обеспечения оптимальной производительности вашего приложения.
        UIGraphicsEndImageContext()
        return newImage
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AutoName", for: indexPath)
        
        cell.textLabel?.numberOfLines = 0 //устанавливаем параметр ноль для переноса длинного названия на следующую строку
        cell.textLabel?.text = autoList[indexPath.row].brand
        cell.detailTextLabel?.text = autoList[indexPath.row].model
        cell.imageView?.image = UIImage(named: autoList[indexPath.row].name) //присваиваем массиву соответвующую картинку из Assets
        // Задаем конкретные параметры высоты  и ширины ячейки
        if let scaledImage = imageWithHeight(image: UIImage(named: autoList[indexPath.row].name) ?? UIImage(), scaledToSize: CGSize(width: 90, height: 60)) {
            cell.imageView?.image = scaledImage
        }
        return cell
    }
    /* // MARK: Table view delegate - это хард код данный метод применяется только для конкретной ячейки, если нам надо изменить значеия для конкретной ячейки
     override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     65 // выравниваем высоту строки, чтобы поместилось изображение
     }  */
    
    // метод при котором затемнение ячейки при выборе не так явно выражено
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //    _ = autoList[indexPath.row]
        // далее реализуем второй метод предачи данных, если у нас переход програмный от вью контроллера
        //  performSegue(withIdentifier: "autoTwoSegue", sender: autoList)
    }
    //входим в режим редактирования и можем менять местами
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentAuto = autoList.remove(at: sourceIndexPath.row)
        autoList.insert(currentAuto, at: destinationIndexPath.row)
    }
    // убираем красные куружочки в режиме редактированя
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    // убираем отсуп с лева в режиме редактирования
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    // MARK: - Navigation
    
    /* // метод передачи данных при переходе от ячейки по сигвею AvtoName
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "autoTwoSegue" {
     let autoDetailsVC = segue.destination as! AutoDetailsViewController
     autoDetailsVC.auto = sender as? Auto
     }
     }  */
    
    // MARK: - Navigation
    // метод передачи данных при переходе от ячейки по сигвею AutoName
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let autoDetailsVC = segue.destination as! AutoDetailsViewController
        autoDetailsVC.auto = autoList[indexPath.row]
    }
}


   
