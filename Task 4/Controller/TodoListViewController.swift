//
//  ViewController.swift
//  Task 4
//
//  Created by Amais Sheikh on 26/10/2020.
//  Copyright © 2020 AmaisSheikh. All rights reserved.
//

import UIKit
import RealmSwift

class TodoListViewController: UIViewController
{
    @IBOutlet weak var todoListTableView: UITableView!
    
    var realm: Realm?
    
    var todoListArray: Results<TodoItem>?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        todoListTableView.delegate = self
        todoListTableView.dataSource = self
        
        getRealmObj()
        loadList()
    }

    @IBAction func addItemPressed(_ sender: UIBarButtonItem)
    {
        let alert = UIAlertController(title: "Add Task", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "task title here.."
        }
        let addAction = UIAlertAction(title: "Save", style: .default)
        { [unowned self] (alertAction) in
            
            guard self.realm != nil else { return }
            if alert.textFields?.first != nil, alert.textFields?.first?.text != ""
            {
                let item = TodoItem()
                item.title = alert.textFields!.first!.text!
                do
                {
                try self.realm?.write
                    {
                        self.realm?.add(item)
                    }
                } catch
                {
                    print("Error adding task: \(error)")
                }
                self.todoListTableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func getRealmObj()
    {
        do
        {
            self.realm = try Realm()
        } catch
        {
            print("Error creating realm: \(error)")
        }
    }
    
    func loadList()
    {
        self.todoListArray = realm?.objects(TodoItem.self)
        todoListTableView.reloadData()
    }
    
}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return todoListArray?.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = todoListTableView.dequeueReusableCell(withIdentifier: TODO_ITEM_CELL_IDENTIFIER, for: indexPath) as! TodoItemTableViewCell
        cell.delegate = self
        
        guard todoListArray != nil
        else
        {
            cell.textLabel?.text = "no tasks added!"
            cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 15)
            return cell
        }
        
        cell.taskTitleLabel.text = todoListArray![indexPath.row].title
        if todoListArray![indexPath.row].isComplete
        {
            cell.accessoryType = .checkmark
        }
        else
        {
            cell.accessoryType = .none
        }
        
        cell.deleteBtnWidthConstraint.constant = 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        guard todoListArray != nil else { return }
        updateCompletion()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 56.0
    }

    func updateCompletion()
    {
        if let indexPath = todoListTableView.indexPathForSelectedRow
        {
            do
            {
                try self.realm?.write
                {
                    todoListArray![indexPath.row].isComplete = !todoListArray![indexPath.row].isComplete
                    todoListTableView.reloadData()
                }
            }
            catch
            {
                print("Error updating completion: \(error)")
            }
        }
    }
    
}

extension TodoListViewController: TodoItemTableViewCellDelegate
{
    func deleteTask(cell: TodoItemTableViewCell)
    {
        guard let indexPath = todoListTableView.indexPath(for: cell), self.todoListArray != nil else { return }

        let item = self.todoListArray![indexPath.row]
        do
        {
            try self.realm?.write
            {
                self.realm?.delete(item)
                todoListTableView.reloadData()
            }
        }
        catch
        {
            print("Error updating completion: \(error)")
        }
        
    }
}
