extends Node2D

func _ready():
	$Bike/spring_suspension_back_bike.stiffness = 500
	$Bike/spring_suspension_back_bike.damping = 5.0
	$Bike/spring_suspension_front_bike.stiffness = 1000
	$Bike/spring_suspension_front_bike.damping = 5.0
	return 0
	
func _physics_process(delta):
	drive(delta)
	
func drive(delta):
	apply_tilt()
	apply_gas()
	apply_brakes()
	
func apply_tilt():
	var back = Input.get_action_strength("tilt_back")
	var forward = Input.get_action_strength("tilt_forward")
	if back:
		$Bike/bike_body_rb.angular_velocity = -1
		#$Bike/bike_body_rb.add_torque(-500)
	if forward:
		$Bike/bike_body_rb.angular_velocity = 1
		# $Bike/bike_body_rb.add_torque(500)
	
func apply_gas():
	var gas = Input.get_action_strength("gas")
	if gas:
		$Bike/wheel_back_rb.add_torque(1500)
	
func apply_brakes():
	var brake = Input.get_action_strength("brake")
	if brake:
		$Bike/wheel_back_rb.angular_velocity = 0
		$Bike/wheel_front_rb.angular_velocity = 0
