//
//  TodoListTableViewController.swift
//  Todoey
//
//  Created by Марк Райтман on 28.03.2023.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
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
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            self.saveItems()
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
        
        let item = itemArray[indexPath.row]
        
        // Задание текста для отображения в текущей ячейке таблицы
        // Берется соответствующий элемент из массива itemArray с помощью индекса indexPath.row
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        // Возврат ячейки таблицы
        return cell
    }
    
    
    //MARK: - Table view delegate methods
    
    // Эта функция вызывается при выборе пользователем строки в таблице.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Выводим элемент, соответствующий выбранной строке.
        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()
        
        // Снимаем выделение с строки и делаем анимацию, если это нужно.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Data manager methods
    
    // Эта функция сохраняет массив itemArray в файл по адресу dataFilePath с помощью PropertyListEncoder.
    func saveItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(itemArray)
            
            // Записывает закодированные данные на диск по указанному адресу в dataFilePath.
            try data.write(to: dataFilePath!)
            
        } catch {
            print("Ошибка при кодировании массива элементов, \(error)")
        }
    }
    
    // Эта функция загружает элементы из файла по адресу dataFilePath в массив itemArray с помощью PropertyListDecoder.
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                // Декодирует полученные данные с диска в массив объектов типа Item и присваивает его itemArray.
                itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Ошибка: \(error.localizedDescription)")
            }
        }
    }
    
    
}
