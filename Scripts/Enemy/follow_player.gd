extends ActionNodeBT

var player: Player
@onready var nav_agent: NavigationAgent3D = $"../../../NavigationAgent3D"
@onready var actor = $"../../.."

func _ready() -> void:
	player = GlobalRefs.player

func execute() -> int:
	await get_tree().physics_frame
	nav_agent.target_position = GlobalRefs.player.global_position
	
	var next_position = nav_agent.get_next_path_position()
	var new_velocity = (next_position - actor.global_position).normalized() * actor.SPEED
	actor.velocity = actor.velocity.move_toward(new_velocity, 0.2)
	actor.look_at(GlobalRefs.player.global_position)
	actor.global_rotation.x = 0
	actor.global_rotation.z = 0
	
	if player.global_position.distance_to(actor.global_position) < 1.5:
		actor.velocity = Vector3.ZERO
	
	actor.move_and_slide()
	return SUCCESS
