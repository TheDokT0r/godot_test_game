extends ClassDB


class CardsDeck:
	var _card = preload("res://src/scenes/card.tscn")
	
	var decks = []
	
	func _init(playersAmount:int):
		decks = self._chunk(self.getAllCards(), playersAmount)
		


	func getAllCards():	
		var cards = []
		
		var cardTypes = ['Clover', 'Diamond', 'Heart', 'Spade']
		
		for type in cardTypes:
			for i in range(1, 13, 1):
				var newCard = _card.instantiate()
				newCard.cardType = type
				newCard.cardNum = i
				
		return cards
		
		
	# Seperates an array into smaller arrays
	func _chunk(arr, size):
		var ret = []
		var i = 0
		var j = -1
		for el in arr:
			if i % size == 0:
				ret.push_back([])
				j += 1;
			ret[j].push_back(el)
			i += 1
		return ret
