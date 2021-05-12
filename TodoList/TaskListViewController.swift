//
//  TaskListViewController.swift
//  TodoList
//
//  Created by Dmitry on 12.05.2021.
//

import UIKit

class TaskListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavigationBar()
    }


    private func setUpNavigationBar() {
        
        title = "Task List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarApperance = UINavigationBarAppearance()
        navBarApperance.configureWithOpaqueBackground()
        
        navBarApperance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarApperance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarApperance.backgroundColor = UIColor(red: 21/255, green: 103/255, blue: 192/255, alpha: 194/255)
        
        navigationController?.navigationBar.standardAppearance = navBarApperance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarApperance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTask))
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(addNewTask))
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc private func addNewTask() {
        
    }
}

