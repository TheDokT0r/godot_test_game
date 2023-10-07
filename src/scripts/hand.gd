extends Node2D

@onready var hand = $HandPos
@onready var curve = $cardcurve

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
	distribute_cards()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	distribute_cards()

func _draw():
	draw_line(hand_start_pos, hand_end_pos, Color.BLACK)
	
func add_cards(n):
	for number in n:
		var card_inst = card.instantiate()
		var rng  = RandomNumberGenerator.new()
		var type = ['Clover', 'Diamond', 'Heart', 'Spade']
		card_inst.cardType = type[rng.randf_range(0,3)]
		card_inst.cardNum = rng.randf_range(0,13)
		add_child(card_inst)

	distribute_cards()
	
func distribute_cards():
	var cards = get_tree().get_nodes_in_group("cards")
	var hand_ratio
	for current_card in cards:
		hand_ratio = float(current_card.get_index()-1)/float(cards.size()+1)
		current_card.position.x = hand_end_pos.x * hand_ratio
		current_card.position.y = hand.position.y
		
