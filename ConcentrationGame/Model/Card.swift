//
//  Card.swift
//  ConcentrationGame
//
//  Created by Aleksey on 0503..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import Foundation

struct Card {
	
	var isFaceUp = false
	var isMatched = false
	var id: Int
	
	static var idFactory = 0
	
	static func getUniqueId() -> Int {
		idFactory += 1
		return idFactory
	}
	
	
	init() {
		self.id = Card.getUniqueId()
	}
	
}
