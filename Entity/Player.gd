extends KinematicBody2D

var gravity = 900 
var velocity = Vector2.ZERO
var maxHSpeed = 100
var Hacceleration = 500
var jumpSpeed = 300
var jumpTermMultiplier = 3

func _ready() -> void:
	pass
	

func _process(delta: float) -> void:
	closeGame()
	resetMethod()
	updateAnimation()
	var moveVector = get_movement_vector()
	var wasOnFloor = is_on_floor()
	
	##### Two Movement methods #####
	#Move char left right based on max speed
#	velocity.x = moveVector.x * maxHSpeed
	
	#aply acceleration
	velocity.x += moveVector.x * Hacceleration * delta
	
	
	#Check if the player's vector is on 0 to decelerate it
	if (moveVector.x == 0):
		#low power makes it slide
		velocity.x = lerp(0, velocity.x, pow(2, -55 * delta))
		
		
	
	#Check that the acceleration doesnt exceed
	clamp(velocity.x, -Hacceleration, Hacceleration)
	
	
	
#Make character jump properly
	if (Input.is_action_just_pressed("WASD_UP")):
		moveVector.y = -1
	else:
		moveVector.y = 0
	
	if (moveVector.y < 0 && (is_on_floor() || !$CoyoteTimer.is_stopped())):
		velocity.y = moveVector.y * jumpSpeed
	
	if (velocity.y < 0 and not Input.is_action_pressed("WASD_UP")):
		#Apply enhanved gravity if player hold jump
		velocity.y += gravity * jumpTermMultiplier *delta
	else:
		#Apply normal gravity on character
		velocity.y += gravity * delta
	
	#move and slide ( x, y)
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if (wasOnFloor && !is_on_floor()):
		$CoyoteTimer.start()
	
	






#This method's made to determine whether the player is jumping
func get_movement_vector():
	
	var moveVector = Vector2.ZERO
	#Cancel out double input 
	moveVector.x = Input.get_action_strength("WASD_RIGHT") - Input.get_action_strength("WASD_LEFT")
	
	if (Input.is_action_just_pressed("WASD_UP")):
		moveVector.y = -1
	else:
		moveVector.y = 0
	return moveVector



func closeGame():
	if(Input.is_action_pressed("CLOSE_GAME")):
		get_tree().quit()

func resetMethod():
	if(Input.is_action_just_pressed("RESET")):
		get_tree().reload_current_scene()


func updateAnimation():
	var moveVec = get_movement_vector()
	
	if (!is_on_floor()):
		$AnimatedSprite.play("jump")
	elif(moveVec.x < 0):
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
	elif(moveVec.x > 0):
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("idle")
	




