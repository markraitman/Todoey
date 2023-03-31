//
//  TodoListTableViewController.swift
//  Todoey
//
//  Created by Марк Райтман on 28.03.2023.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    
    //MARK: - Properties
    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    // Эта функция вызывается всякий раз, когда пользователь нажимает кнопку "+" на панели навигации
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // Создание пустого текстового поля для ввода
        var textField = UITextField()
        
        // Создание всплывающего окна оповещения с заголовком "Добавить новый элемент Todoey"
        let alert = UIAlertController(title: "Добавить новый элемент Todoey", message: "", preferredStyle: .alert)
        
        // Создание действия "Добавить элемент", которое будет выполняться при нажатии на соответствующую кнопку
        // Данный блок кода добавляет введенный пользователем текст в массив itemArray и обновляет таблицу tableView
        let action = UIAlertAction(title: "Добавить элемент", style: .default) { (action) in
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        // Добавление текстового поля во всплывающее окно оповещения
        // Блок кода задает место для ввода текста внутри всплывающего окна оповещения
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Создать новый элемент"
            textField = alertTextField
        }
        
        // Добавление действия во всплывающее окно оповещения
        alert.addAction(action)
        
        // Отображение всплывающего окна оповещения на экране
        present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Возвращает количество элементов в массиве itemArray
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получение ячейки таблицы с идентификатором ToDoItemCell по индексу
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    
        // Задание текста для отображения в текущей ячейке таблицы
        // Берется соответствующий элемент из массива itemArray с помощью индекса indexPath.row
        cell.textLabel?.text = itemArray[indexPath.row]
    
        // Возврат ячейки таблицы
        return cell
    }
    
    
    //MARK: - Table view delegate methods
   // Эта функция вызывается при выборе пользователем строки в таблице.
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // Выводим элемент, соответствующий выбранной строке.
       print(itemArray[indexPath.row])
       
       // Снимаем выделение с строки и делаем анимацию, если это нужно.
       tableView.deselectRow(at: indexPath, animated: true)
       
       // Проверяем, есть ли уже галочка у выбранной ячейки.
       if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
           // Если есть, удаляем галочку.
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
       } else {
           // Если нет, добавляем галочку к выбранной ячейке.
           tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
       }
   }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
