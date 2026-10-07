extends Area2D

var aimDir 
const bulletSpeed = 100

func SetAimDir(aimdir : Vector2) -> void :
	aimDir = aimdir

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position -= aimDir * delta * bulletSpeed
	
