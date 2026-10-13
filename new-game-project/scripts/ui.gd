extends CanvasLayer
@onready var days: Label = $Days
@onready var ground: Node2D = $"../Ground"
@onready var scores: Label = $Score

#signals
signal send_final_score(final_score : int)

func _enter_tree() -> void:
	add_to_group("UI")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	days.text = "Day: 1"
	days.visible = true
	scores.text = "Scores: 0"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_ground_brand_new_day(day_number: int) -> void:
	var hold = str(day_number)
	days.text = "Day: " + hold


func _on_ground_game_over() -> void:
	days.visible = false
	scores.visible = false

func _display_score(score : int) -> void:
	var hold = str(score)
	scores.text = "Score: " + hold
	send_final_score.emit(score)
