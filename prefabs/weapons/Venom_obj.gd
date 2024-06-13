extends weapon_obj

@onready var timedDestroy = $TimedDestroy

func _ready():
	timedDestroy.wait_time = lifetime
