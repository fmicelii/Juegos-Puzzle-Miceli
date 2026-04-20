extends RigidBody2D

@export var raycast: RayCast2D 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(_delta: float) -> void:
	if raycast.get_collider():
		freeze = false
