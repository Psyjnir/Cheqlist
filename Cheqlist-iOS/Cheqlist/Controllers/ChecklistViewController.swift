//
//  ChecklistViewController.swift
//  Cheqlist
//
//  Created by Robert Sogomonian on 12/7/17.
//  Copyright © 2017 Psyjnir, Inc. All rights reserved.
//

import UIKit

protocol ChecklistDelegate {
	func addTaskToList(task: Task)
	func reloadData()
}

class ChecklistViewController: UITableViewController, ChecklistDelegate {
	var checklistItems: [Task] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let addTask = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTaskToChecklist))
		navigationItem.rightBarButtonItem = addTask
		
		title = "Primary Checklist"
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// If we have data for the table to display, we return the number of items in the current list.
		if thereAreTasks() {
			return checklistItems.count
		}
		
		// If there is no data, we return one row for an 'empty' checklist prompting user to add items.
		return 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "task-cell")
		
		if thereAreTasks() {
			cell.textLabel?.text = checklistItems[indexPath.row].name
			cell.detailTextLabel?.text = checklistItems[indexPath.row].description
		} else {
			cell.textLabel?.textColor = UIColor.lightGray
			cell.textLabel?.text = "There are no tasks in this cheqlist."
			cell.detailTextLabel?.textColor = UIColor.lightGray
			cell.detailTextLabel?.text = "Please add a new task by clicking the '+' in the top right."
		}
		
		return cell
	}
	
	@objc func addNewTaskToChecklist() {
		let taskEntryController = TaskDataEntryController()
		taskEntryController.delegate = self
		navigationController?.pushViewController(taskEntryController, animated: true)
	}
	
	func addTaskToList(task: Task) {
		checklistItems.append(task)
		tableView.reloadData()
	}
	
	func reloadData() {
		tableView.reloadData()
	}
	
	func thereAreTasks() -> Bool {
		return checklistItems.count > 0
	}
}
