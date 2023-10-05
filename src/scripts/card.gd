extends Node2D

@export_group('Card Props')
@export_range(0, 13, 1) var cardNum: int # Joker is 0

@export_enum('Clover', 'Diamond', 'Heart', 'Spade') var cardType: String = 'Clover'

@onready var cardSprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	setCardTexture()

func setCardTexture():
	var path = str('res://sprites/pcp/', cardType, '/card_', cardNum, '_', cardType, '.png') 
	print(path)
	
	cardSprite.texture = load(path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
