//
//  Concetration.swift
//  ConcentrationGame
//
//  Created by Aleksey on 0503..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import Foundation

class Concentration {
	
	var cards = [Card]()
	var indexOfOneAndOnlyFaceUpCard: Int?
	
	
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
				indexOfOneAndOnlyFaceUpCard = nil
			} else {
				// either no card or two cards are faceUp
				for flipDownIndex in cards.indices {
					cards[flipDownIndex].isFaceUp = false
				}
				cards[index].isFaceUp = true
				indexOfOneAndOnlyFaceUpCard = index
			}
		}
	}
}
