extends Node2D

@export_group("Card Props")
@export_range(0, 13, 1) var cardNum: int # Joker is 0
enum CardTypes {Clover, Diamond, Hurt, Spade}
@export var type: CardTypes

# Called when the node enters the scene tree for the first time.
func _ready():
	set

func setCardTexture():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
