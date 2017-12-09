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
	
	let txtTaskName: UITextField = {
		let t = UITextField()
		t.placeholder = "Enter a task name..."
		
		return t
	}()
	
	let tvwTaskDesc: UITextView = {
		let t = UITextView()
		t.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
		t.layer.borderWidth = 0.5
		t.layer.cornerRadius = 5.0
		
		return t
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor.white
		view.addSubview(txtTaskName)
		view.addSubview(tvwTaskDesc)
		
		txtTaskName.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 75, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 20)
		tvwTaskDesc.anchor(txtTaskName.bottomAnchor, left: txtTaskName.leftAnchor, bottom: nil, right: txtTaskName.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 60)
		
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
		if task == nil {
			task = Task()
		}
		
		task?.name = txtTaskName.text ?? ""
		task?.description = tvwTaskDesc.text
		task?.complete = false
		
		delegate?.addTaskToList(task: task!)
		returnToChecklist()
	}
	
	@objc func returnToChecklist() {
		navigationController?.popViewController(animated: true)
	}
}
