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
			return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
		}
		set {
			cards.indices.forEach { index in
				cards[index].isFaceUp = (index == newValue)
			}
		}
	}
	
	
	init(numberOfPairsOfCard: Int) {
		assert(numberOfPairsOfCard > 0, "Concentration.init(\(numberOfPairsOfCard)) number must greater then 0")
		for _ in 0..<numberOfPairsOfCard {
			let card = Card()
			cards += [card, card]
		}
		cards.shuffle()
	}
	
	
	func chooseCard(at index: Int) {
		if !cards[index].isMatched {
			assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index) chosen index is not in cards")
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

extension Collection {
	var oneAndOnly: Element? {
		return count == 1 ? first : nil
	}
}
