//
//  Concetration.swift
//  ConcentrationGame
//
//  Created by Aleksey on 0503..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import Foundation

class Concentration {
	
	private(set) var cards = [Card]()

	private var indexOfOneAndOnlyFaceUpCard: Int? {
		get {
			var foundIndex: Int?
			for index in cards.indices {
				if cards[index].isFaceUp {
					if foundIndex == nil {
						foundIndex = index
					} else {
						return nil
					}
				}
			}
			return foundIndex
		}
		set {
			cards.indices.forEach { index in
				cards[index].isFaceUp = (index == newValue)
			}
		}
	}
	
	
	init(numberOfPairsOfCard: Int) {
		assert(numberOfPairsOfCard > 0, "Concentration.init - numberOfPairsOfCard is \(numberOfPairsOfCard) but should be more then 0")
		for _ in 0..<numberOfPairsOfCard {
			let card = Card()
			cards += [card, card]
		}
		cards.shuffle()
	}
	
	
	func chooseCard(at index: Int) {
		if !cards[index].isMatched {
			assert(cards.indices.contains(index), "Concentration.chooseCard - Index \(index) is not in cards.indices ")
			if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
				if cards[matchIndex].id == cards[index].id {
					cards[matchIndex].isMatched = true
					cards[index].isMatched = true
				}
				cards[index].isFaceUp = true
			} else {
				indexOfOneAndOnlyFaceUpCard = index
			}
		}
	}
}
