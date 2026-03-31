## 📑 Clase que define el estado Dash de un heroe.
class_name gmStHeroDash
extends gmStHeroBase


#region Vars
## Determina a donde debe mirar el personaje.
var _dir_face_ : gmCharacterBase.dirs_face = gmCharacterBase.dirs_face.LEFT
## Define la distancia recorrida.
var _distance_elapsed_ : float
## Define la distancia a recorrer.
var _distance_total_ : float
## Ayuda a saber si se termina el impulso.
var _end_ : bool
#endregion


#region Events
#endregion


#region Functions
## Función con la que se podrán ejecutar comandos para cuando el estado termina su funcionamiento.
func end() -> void:
	# Hacer que la velocidad constante se resetee.
	_hero_.constant_velocity = Vector2.ZERO
	# Iniciar el timpo de espera para poder realizar otro impulso.
	_hero_.dash_cooldown_timer()

## Función con la que se podrán ejecutar comandos para cuando el estado procese su funcionamiento.
## El parámetro [param _delta] recibe el tiempo en segundos transcurrido desde la última ejecución de esta función.
func process(_delta : float) -> void:
	# Procesar acciones del estado.
	# Ir sumando el avance, ayuda a determinar si a alcanzó la distancia a recorrer.
	_distance_elapsed_ += _hero_.get_position_delta().x
	# Determinar si ya recorrió la distancia total.
	_end_ = abs(_distance_elapsed_) >= _distance_total_
	# A mitad del recorrido se puede detener el avance.
	if abs(_distance_elapsed_) >= _distance_total_ / 2 and \
	_dir_face_ != _hero_.dir_face:
		_end_ = true
	# Asignar la dirección a la que mira el personaje.
	_hero_.set_dir_face(_dir_face_)

	# Cambiar de estado a Jump.
	if to_jump(): return
	# Cambiar de estado a DoubleJump.
	if to_double_jump(): return
	# Pasar a los siguientes estados si choca con una pared o acaba el recorrido del impulso.
	if _end_ or _hero_.is_on_wall():
		# Cambiar de estado a Walk.
		if to_walk(): return
		# Cambiar de estado a Falling.
		if to_falling(): return
		# Cambiar de estado a Idle.
		if to_idle(): return

## Función con la que se podrán ejecutar comandos para cuando el estado inicie su funcionamiento.
func start() -> void:
	# Inicializar valores.
	name = "Dash"
	_hero_.can_dash_cooldown = false
	_hero_.can_dash_ground = false
	# Determinar la dirección en que se realizará el impulso.
	if _hero_.dir_movement.x == 0:
		_dir_face_ = _hero_.dir_face
	else:
		_dir_face_ = gmCharacterBase.dirs_face.RIGHT if _hero_.dir_movement.x == 1 else gmCharacterBase.dirs_face.LEFT
	# Si viene del estado WallSlide, que el impulso sea contrario a la pared del deslizamiento.
	# Para estar en WallSlide se debe estar pulsando la dirección hacie la pared, invertir la dirección.
	if _hero_.sm.previous_state == "WallSlide":
		_dir_face_ = gmCharacterBase.dirs_face.RIGHT if _hero_.dir_movement.x == -1 else gmCharacterBase.dirs_face.LEFT
	_distance_elapsed_ = 0
	_distance_total_ = _hero_._speed_x_base_
	_end_ = false
	# Hacer que el heroe se mueva de forma constante en la dirección en la determinada.
	var __dir_mov = -1 if _dir_face_ == gmCharacterBase.dirs_face.LEFT else 1
	_hero_.constant_velocity.x = _hero_._speed_x_base_ * 3 * __dir_mov
	# Aplicar un poco de movimiento abajo, con esto no cae con gravedad pero si detecta collisiones con el suelo.
	_hero_.constant_velocity.y = 0.001

	# Definir animaciones de este estado.
	animations.append("Dash")
	# Reproducir la animación base.
	_hero_.animated_sprite.play(animations[0])
#endregion
