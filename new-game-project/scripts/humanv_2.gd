extends Area2D
@onready var humanv_2: Area2D = $"."
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

#human
var speed : float
const start_speed : float = 1
const max_speed : int = 3
var human_direction : String 

#variation
var variation: Array[String] = ["Blue", "Brown", "Green", "Pink"]

#signals
signal roomba_touched

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite_2d.flip_h = true
	var random_choice: String = variation.pick_random()
	animated_sprite_2d.play(random_choice)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed = start_speed
	
	if human_direction == "Right":
		humanv_2.position.x -= speed
	elif human_direction == "Left":
		animated_sprite_2d.flip_h = false
		humanv_2.position.x += speed

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Roomba":
		roomba_touched.emit()
		
