extends CharacterBody2D

const speed = 300.0
const rotateSpeed = 20

var bulletPrefab = preload("res://Scenes/bullet.tscn")

@onready var gunPivot : Node2D = $GunPivot
@onready var shootPoint : Node2D = $GunPivot/shootPoint

func _process(delta: float) -> void:
	handleRotationShooting(delta)

func _physics_process(_delta: float) -> void:
	handleInput()
		

func handleRotationShooting(delta :float ) -> void :
	var aimDir := (position - get_viewport().get_mouse_position()).normalized()
	var aimAngle = aimDir.angle()
	gunPivot.rotation = rotate_toward(gunPivot.rotation,aimAngle,rotateSpeed * delta)
	
	if(Input.is_action_just_pressed("shoot")):
		var bulletSpawned : Node2D = bulletPrefab.instantiate()
		bulletSpawned.SetAimDir(aimDir)
		get_tree().root.add_child(bulletSpawned)
		bulletSpawned.global_position = shootPoint.global_position

func handleInput() ->void :
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
