extends Node2D
var timer:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#timer += delta
	#print("Timer: ",timer)
	pass

#Signals
func _on_roomba_touched() -> void:
	print("roomba touched")
