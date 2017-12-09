//
//  ViewController.swift
//  Cheqlist
//
//  Created by Robert Sogomonian on 12/7/17.
//  Copyright © 2017 Psyjnir, Inc. All rights reserved.
//

import UIKit

class RootViewController: UINavigationController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let vc = ChecklistViewController()
		pushViewController(vc, animated: false)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}

