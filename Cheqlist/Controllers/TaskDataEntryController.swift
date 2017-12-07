//
//  AddEditTaskDataController.swift
//  Cheqlist
//
//  Created by Robert Sogomonian on 12/7/17.
//  Copyright © 2017 Psyjnir, Inc. All rights reserved.
//

import UIKit

class TaskDataEntryController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor.white
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(returnToChecklist))
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTaskAndReturnToChecklist))
	}
	
	@objc func saveTaskAndReturnToChecklist() {
		// TODO: Save to a datasource
	}
	
	@objc func returnToChecklist() {
		navigationController?.popViewController(animated: true)
	}
}
