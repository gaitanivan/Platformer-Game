## 📑 Clase que define el estado Landing de un heroe.
class_name gmStHeroLanding
extends gmStHeroBase


#region Vars
## Determina a donde debe mirar el personaje.
var _dir_face_ : gmCharacterBase.dirs_face = gmCharacterBase.dirs_face.LEFT
## Ayuda a saber si ya se debe salir del estado.
var _end_ : bool
## Determina el temporizador que indica cuánto tiempo se mantiene en este estado.
var _landing_timer_ : Tween
#endregion


#region Events
#endregion


#region Functions
## Función con la que se podrán ejecutar comandos para cuando el estado termina su funcionamiento.
func end() -> void:
	# Resetear la velocidad constante.
	_hero_.constant_velocity.x = 0
	# Terminar el temporizador.
	if _landing_timer_:
		_landing_timer_.kill()

## Función con la que se podrán ejecutar comandos para cuando el estado procese su funcionamiento.
## El parámetro [param _delta] recibe el tiempo en segundos transcurrido desde la última ejecución de esta función.
func process(_delta : float) -> void:
	# Procesar acciones del estado.
	# Asignar la dirección a la que mira el personaje.
	_hero_.set_dir_face(_dir_face_)

	# Cambiar de estado a Falling.
	if to_falling(): return
	# Cambiar a estos estados si se determina que deben ejecutarse.
	if _end_:
		# Cambiar de estado a Walk.
		if to_walk(): return
		# Cambiar de estado a Idle.
		if to_idle(): return

## Función con la que se podrán ejecutar comandos para cuando el estado inicie su funcionamiento.
func start() -> void:
	# Inicializar valores.
	name = "Landing"
	_end_ = false
	_hero_.constant_velocity.x = 0.001
	# Obtener la dirección en que estaba mirando el heroe.
	_dir_face_ = _hero_.dir_face
	# Iniciar el conteo de tiempo para este estado.
	if _landing_timer_:
		_landing_timer_.kill()
	_landing_timer_ = _hero_.create_tween()
	_landing_timer_.tween_interval(0.3)
	_landing_timer_.tween_property(self, "_end_", true, 0)

	# Definir animaciones de este estado.
	animations.append("Landing")
	# Reproducir la animación base.
	_hero_.animated_sprite.play(animations[0])
#endregion
