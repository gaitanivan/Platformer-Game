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
## Determina si el personaje puede hacer un impulso.
var can_dash : bool :
	get:
		return can_dash_cooldown and can_dash_ground
## Determina si ha pasado el tiempo de espera para que el personaje puede hacer un impulso.
var can_dash_cooldown : bool = true
## Determina si se ha tocado el suelo para que el personaje puede hacer un impulso.
var can_dash_ground : bool = true
## Determina si el personaje puede hacer doble salto.
var can_double_jump : bool
## Mantiene la referencia al CollisionShape2D del personaje.
var collision_shape : CollisionShape2D
## Determina si se debe desplazar el personaje a una velocidad constante.
var constant_velocity : Vector2
## Determina la dirección en la que mira el personaje.
var dir_face : dirs_face = dirs_face.RIGHT
## Determina la dirección en la que se moverá el personaje.
var dir_movement : Vector2
## Mantiene el valor de la gravedad que usa el personaje.
var gravity : float
## Mantiene el valor de la altura máxima que alcanza el personaje al saltar.
var jump_height_max : float
## Mantiene la referencia a la máquina de estados que usa el personaje.
var sm : gmStateMachineBase
## Mantiene el valor de la velocidad en X que usa el personaje.
var speed_x : float

## Temporizador para el tiempo que ha de pasar para que el personaje puede hacer un impulso.
var _can_dash_cooldown_timer_ : Tween
## Mantiene el valor de la gravedad base que usa el personaje.
var _gravity_base_ : float
## Mantiene el valor de la altura máxima que alcanza el personaje al saltar.
var _jump_height_max_base_ : float
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
	if constant_velocity.y != 0:
		velocity.y = constant_velocity.y
	else:
		velocity.y += gravity * _delta
	# Hacer que la velocidad de caida no supere el 1.5 de la gravedad actual.
	if velocity.y >= gravity * 1.5:
		velocity.y = gravity * 1.5
	# Aplicar movimiento horizontal.
	if constant_velocity.x != 0:
		velocity.x = constant_velocity.x
	else:
		velocity.x = dir_movement.x * speed_x

	# Mover el personaje.
	move_and_slide()
#endregion


#region Functions
## Función que inicia el conteo del tiempo de espera para permitir hacer un impulso después de haber hecho uno.[br]
## El parámetro [param _now] recibe un valor para indicar si se debe restablecer de inmediato.[br]
## Por defecto es [code]false[/code] y realiza el conteo.[br]
## Si se pasa el valor [code]true[/code] no se realiza conteo y se restaura de inmediato.
func dash_cooldown_timer(_now : bool = false) -> void:
	# Siempre que se llame a esta función, detener el temporizador.
	if _can_dash_cooldown_timer_:
		_can_dash_cooldown_timer_.kill()
	# Validar si se debe aplicar el cambio de inmediato.
	if _now:
		can_dash_cooldown = true
		return
	# Si llega aquí, realizar el conteo.
	_can_dash_cooldown_timer_ = create_tween()
	_can_dash_cooldown_timer_.tween_interval(1)
	_can_dash_cooldown_timer_.tween_property(self, "can_dash_cooldown", true, 0)

## Función con la que se hace saltar al personaje.
func do_jump() -> void:
	velocity.y = -get_jump_force()

## Función con la que se deja de subir por un salto.
func do_jump_release() -> void:
	velocity.y /= 2

## Función con la que se calcula la fuerza a aplicar (velocidad inicial) para que el personaje salte.[br]
## Se usa la fórmula v0=√2gh.
func get_jump_force() -> float:
	return sqrt(2 * gravity * jump_height_max) + 4

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

## Función con la que se puede inicializar la altura del salto.
func start_jump_height_max(_jump_height_max : float) -> void:
	_jump_height_max_base_ = _jump_height_max
	jump_height_max = _jump_height_max_base_

## Función con la que se puede inicializar la velocidad en X.[br]
## El parámetro [param _speed_x] recibe la velocidad base del personaje.
func start_speed_x(_speed_x) -> void:
	_speed_x_base_ = _speed_x
	speed_x = _speed_x_base_
#endregion
