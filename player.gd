# Player.gd
extends KinematicBody2D

const SPEED = 200
const DAMAGE_AMOUNT = 0.1

var velocity = Vector2.ZERO
var health = 100

# Screen boundaries
var screen_size
var margin = 20

func _ready():
	screen_size = get_viewport_rect().size


func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0

	if Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED

	if Input.is_action_pressed("ui_down"):
		velocity.y += SPEED
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= SPEED

	move_and_collide(velocity * delta)
	
	var c1 = position.x < -margin
	var c2 = position.x > screen_size.x + margin
	var c3 = position.y < -margin
	var c4 = position.y > screen_size.y + margin
	
	# Check if the player is outside the screen boundaries
	if c1 or c2 or c3 or c4:
		take_damage_on_screen_exit()
	
func take_damage_on_screen_exit():
	health -= DAMAGE_AMOUNT
	if health <= 0:
		health = 0
		# Game over logic here (e.g., show a game-over screen)
	
	update_health_ui()

func update_health_ui():
	var hud = get_parent().get_node("HUD")
	
	hud.update_health_bar()
