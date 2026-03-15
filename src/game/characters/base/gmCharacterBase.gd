## 📑 Clase que define la escena base que va a controlar un personaje.
class_name gmCharacterBase
extends CharacterBody2D


#region Vars
## Enumeración que muestra las direcciones en la que puede mirar un personaje.
enum dirs_face {
	LEFT = -1, ## Izquierda
	RIGHT = 1, ## Derecha
}

## Mantiene la referencia al AnimationPlayer del personaje.
var animated_sprite : AnimatedSprite2D
## Mantiene la referencia al CollisionShape2D del personaje.
var collision_shape : CollisionShape2D
## Determina la dirección en la que mira el personaje.
var dir_face : dirs_face = dirs_face.RIGHT
## Determina la dirección en la que se moverá el personaje.
var dir_movement : Vector2
## Mantiene el valor de la gravedad que usa el personaje.
var gravity : float
## Mantiene la referencia a la máquina de estados que usa el personaje.
var sm : gmStateMachineBase
## Mantiene el valor de la velocidad en X que usa el personaje.
var speed_x : float

## Mantiene el valor de la gravedad base que usa el personaje.
var _gravity_base_ : float
## Mantiene el valor de la velocidad base en X que usa el personaje.
var _speed_x_base_ : float
#endregion


#region Events
func _ready() -> void:
	# Inicializar variables.
	animated_sprite = %AnimatedSprite
	collision_shape = %CollisionShape

	sm = gmStateMachineBase.new()

func _physics_process(_delta: float) -> void:
	# Determinar la dirección en la que mira el personaje.
	var __face : dirs_face = dirs_face.RIGHT if dir_movement.x == 1 else dir_face
	__face = dirs_face.LEFT if dir_movement.x == -1 else __face
	set_dir_face(__face)

	# Llamar al process de la máquina de estados.
	sm.process(_delta)

	# Calcular movimientos.
	# Aplicar la gravedad.
	velocity.y += gravity * _delta
	# Aplicar movimiento horizontal.
	velocity.x = dir_movement.x * speed_x

	# Mover el personaje.
	move_and_slide()
#endregion


#region Functions
## Función que define la dirección en la que mira el personaje.[br]
## El parámetro [param _dir_face] recibe la dirección en la que se debe mirar.
func set_dir_face(_dir_face : dirs_face) -> void:
	if dir_face == _dir_face: return
	dir_face = _dir_face
	animated_sprite.flip_h = true if dir_face == dirs_face.LEFT else false

## Función con la que se puede inicializar la gravedad.
func start_gravity() -> void:
	_gravity_base_ = ProjectSettings.get_setting("physics/2d/default_gravity") * ProjectSettings.get_setting("physics/custom/pixels_per_meter")
	gravity = _gravity_base_

## Función con la que se puede inicializar la velocidad en X.[br]
## El parámetro [param _speed_x] recibe la velocidad base del personaje.
func start_speed_x(_speed_x) -> void:
	_speed_x_base_ = _speed_x
	speed_x = _speed_x_base_
#endregion
