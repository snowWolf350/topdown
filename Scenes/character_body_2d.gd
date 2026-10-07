extends CharacterBody2D

const speed = 300.0
const rotateSpeed = 20

var bulletPrefab = preload("res://Scenes/bullet.tscn")

func _process(delta: float) -> void:
	handleRotation(delta)

func _physics_process(_delta: float) -> void:
	handleInput()
		

func handleRotation(delta :float ) -> void :
	var aimDir := (position - get_viewport().get_mouse_position()).normalized()
	var aimAngle = aimDir.angle()
	rotation = rotate_toward(rotation,aimAngle,rotateSpeed * delta)
	
	if(Input.is_action_just_pressed("shoot")):
		var bulletSpawned : Node2D = bulletPrefab.instantiate()
		bulletSpawned.SetAimDir(aimDir)
		get_node("/root").add_child(bulletSpawned)
		bulletSpawned.position = position

func handleInput() ->void :
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
