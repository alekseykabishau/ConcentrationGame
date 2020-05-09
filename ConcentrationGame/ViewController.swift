//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Aleksey on 0503..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet private var cardButtons: [UIButton]!
	@IBOutlet private weak var flipCountLabel: UILabel!
	
	private lazy var game = Concentration(numberOfPairsOfCard: numberOfPairsOfCard)
	
	var numberOfPairsOfCard: Int {
		return cardButtons.count / 2
	}
	
	private var emojiChoices = ["🇨🇭","🇨🇦","🇪🇸","🇵🇱","🇺🇸","🇧🇾","🇮🇹","🇩🇪", "🇯🇵"]
	private var emoji = [Int: String]()
	
	private(set) var flipCount = 0 {
		didSet { flipCountLabel.text = "Flips: \(flipCount)" }
	}
	
	
	@IBAction private func touchCard(_ sender: UIButton) {
		flipCount += 1
		if let cardIndex = cardButtons.firstIndex(of: sender) {
			game.chooseCard(at: cardIndex)
			updateViewFromModel()
		} else {
			print("chosen card was not in cardButtons")
		}
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	

	private func emoji(for card: Card) -> String {
		if emoji[card.id] == nil, emojiChoices.count > 0 {
			let randomIndex = Int.random(in: 0..<emojiChoices.count)
			emoji[card.id] = emojiChoices.remove(at: randomIndex)
		}
		return emoji[card.id] ?? "?"
	}

	
	private func updateViewFromModel() {
		for index in cardButtons.indices {
			let button = cardButtons[index]
			let card = game.cards[index]
			if card.isFaceUp {
				button.setTitle(emoji(for: card), for: .normal)
				button.backgroundColor = .white
			} else {
				button.setTitle("", for: .normal)
				button.backgroundColor = card.isMatched ? .clear : .systemOrange
			}
		}
	}
}

