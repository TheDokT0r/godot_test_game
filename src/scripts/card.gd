extends Node2D

@export_group('Card Props')
@export_range(0, 13, 1) var cardNum: int # Joker is 0

@export_enum('Clover', 'Diamond', 'Heart', 'Spade') var cardType: String = 'Clover'

@onready var cardSprite = $Sprite2D
@onready var mouseRegion = $MouseRegion

var pickedUp: bool = false


signal mouseRealeased

# Called when the node enters the scene tree for the first time.
func _ready():
	setCardTexture()
	
	mouseRegion.size.x = cardSprite.texture.get_width()
	mouseRegion.size.y = cardSprite.texture.get_height()
	mouseRegion.position.x =  (cardSprite.texture.get_width() / 2) * -1
	mouseRegion.position.y =  (cardSprite.texture.get_height() / 2) * -1


func setCardTexture():
	var path = str('res://sprites/pcp/', cardType, '/card_', cardNum, '_', cardType, '.png') 
	print(path)
	
	cardSprite.texture = load(path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pickedUp:
		global_position = get_global_mouse_position()
		remove_from_group("cards")
	
	else :
		add_to_group("cards")
	
	if Input.is_action_just_pressed("M1"):
		mouseRealeased.emit()

func _on_mouse_region_pressed():
	pickedUp = true
	await mouseRealeased
	pickedUp = false
