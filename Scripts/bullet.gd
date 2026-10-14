extends Area2D

var aimDir 
const bulletSpeed = 300

func SetAimDir(aimdir : Vector2) -> void :
	aimDir = aimdir

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position -= aimDir * delta * bulletSpeed
	
func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	queue_free()
