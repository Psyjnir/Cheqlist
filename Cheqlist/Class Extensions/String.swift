//
//  String.swift
//  Cheqlist
//
//  Created by Robert Sogomonian on 12/7/17.
//  Copyright © 2017 Psyjnir, Inc. All rights reserved.
//

import Foundation

extension String {
	// python style string format
	// ie: print("test {} python style {}".format(123, "formatting"))
	func format(_ args: Any...) -> String {
		var ret = self
		for arg in args {
			let nextRange = ret.range(of: "{}")
			if nextRange == nil {
				fatalError("invalid # of parameters for format string")
			}
			ret = ret.replacingOccurrences(of: "{}", with: String(describing: arg), options: .literal, range: nextRange)
		}
		return ret
	}
}
