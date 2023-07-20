extends KinematicBody2D

const SPEED = 200

var velocity = Vector2.ZERO
var health = 100

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
