extends CharacterBody2D

const MOVE_SPEED: float = 32.0 #imutável

#var move_speed: float = 32.0

@export var move_speed: float = 64.0

#Guarda referência a objetos
@export var sprite: Sprite2D = null
@export var animation: AnimationPlayer = null

# String = "Eu sou um texto"
# int = 1 2 3 35 250
# float = 0.1 0.23 1.35 239.203
# bool = true false

#if can_move_player == false: #não pode mover o personagem
#if can_move_player == true: #pode mover o personagem
#           velocity = direction * move_speed

func _physics_process(_delta):
	var direction: Vector2 = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	).normalized()
	
	#1/1.414
	velocity = move_speed * direction
	move_and_slide()
	
	check_orientation()
	animate()
	
	
#Serve para inverter a textura baseado na velocidade
func check_orientation():
	if velocity.x > 0:
		sprite.flip_h = false
		
	if velocity.x < 0:
		sprite.flip_h = true
		
		
#Serve para animar o personagem
func animate():
	if velocity != Vector2.ZERO: #Vector2(0, 0)
		animation.play("walk")
		return
		
	animation.play("idle")
