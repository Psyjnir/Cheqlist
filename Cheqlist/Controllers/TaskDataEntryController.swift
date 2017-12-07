//
//  AddEditTaskDataController.swift
//  Cheqlist
//
//  Created by Robert Sogomonian on 12/7/17.
//  Copyright © 2017 Psyjnir, Inc. All rights reserved.
//

import UIKit

class TaskDataEntryController: UIViewController {
	var task: Task?
	var delegate: ChecklistDelegate?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor.white
		
		let oper: String = {
			if task != nil {
				return "Edit"
			}
			return "Add"
		}()
		
		title = "{} Task".format(oper)
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(returnToChecklist))
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTaskAndReturnToChecklist))
	}
	
	@objc func saveTaskAndReturnToChecklist() {
		// TODO: Save to a datasource
		delegate?.reloadData()
		returnToChecklist()
	}
	
	@objc func returnToChecklist() {
		navigationController?.popViewController(animated: true)
	}
}
