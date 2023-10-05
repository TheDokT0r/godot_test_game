extends Node2D

@onready var hand = $HandPos

var hand_start_pos
var hand_end_pos
var card = preload("res://src/scenes/card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	hand.position.x = get_viewport().size.x / 2
	hand.position.y = get_viewport().size.y / 2
	hand_start_pos = Vector2((hand.position.x-(hand.position.x-50)), hand.position.y)
	hand_end_pos = Vector2((hand.position.x+(hand.position.x-50)), hand.position.y)
	add_cards(6)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _draw():
	draw_line(hand_start_pos, hand_end_pos, Color.BLACK)
	
func add_cards(n):
	print("fuck")
	for number in n:
		var card_inst = card.instantiate()
		card_inst.cardType = "Diamond"
		card_inst.cardNum = 1
		add_child(card_inst)

	distribute_cards()
	
func distribute_cards():
	var cards = get_tree().get_nodes_in_group("cards")
	var hand_ratio
	for current_card in cards:
		hand_ratio = float(current_card.get_index()-1)/float(cards.size()-1)
		current_card.position.x = hand_end_pos.x * hand_ratio
		current_card.position.y = hand.position.y
		print(hand_ratio)
