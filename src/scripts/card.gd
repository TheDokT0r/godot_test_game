extends Node2D

@export_group('Card Props')
@export_range(0, 13, 1) var cardNum: int # Joker is 0
enum CardTypes {Clover, Diamond, Hurt, Spade}
@export var type: CardTypes

@onready var cardSprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set

func setCardTexture():
	var path = str('res://sprites/pcp/', type, '/card_', cardNum, '_', str(type).to_lower(), 'png') 
	
	cardSprite.texture = load(path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
