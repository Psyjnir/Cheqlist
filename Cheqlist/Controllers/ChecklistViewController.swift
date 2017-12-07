//
//  ChecklistViewController.swift
//  Cheqlist
//
//  Created by Robert Sogomonian on 12/7/17.
//  Copyright © 2017 Psyjnir, Inc. All rights reserved.
//

import UIKit

protocol ChecklistDelegate {
	func reloadData()
}

class ChecklistViewController: UITableViewController, ChecklistDelegate {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let addTask = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTaskToChecklist))
		navigationItem.rightBarButtonItem = addTask
		
		title = "Primary Checklist"
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
	
	@objc func addNewTaskToChecklist() {
		let taskEntryController = TaskDataEntryController()
		taskEntryController.delegate = self
		navigationController?.pushViewController(taskEntryController, animated: true)
	}
	
	func reloadData() {
		tableView.reloadData()
	}
}
