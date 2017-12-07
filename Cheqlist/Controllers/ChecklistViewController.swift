//
//  ChecklistViewController.swift
//  Cheqlist
//
//  Created by Robert Sogomonian on 12/7/17.
//  Copyright © 2017 Psyjnir, Inc. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
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
		navigationController?.pushViewController(taskEntryController, animated: true)
	}
}
