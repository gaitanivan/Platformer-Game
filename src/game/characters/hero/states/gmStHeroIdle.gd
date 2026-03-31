## 📑 Clase que define el estado Idle de un heroe.
class_name gmStHeroIdle
extends gmStHeroBase


#region Vars
## Usado para intercalar las animaciones de este estado.
var _tween_animation_loop_ : Tween
#endregion


#region Events
#endregion


#region Functions
## Función con la que se podrán ejecutar comandos para cuando el estado termina su funcionamiento.
func end() -> void:
	# Terminar el tween de animación.
	if _tween_animation_loop_:
		_tween_animation_loop_.kill()
	if _hero_.animated_sprite.animation_finished.is_connected(_play_animation_secondary_finished_):
		_hero_.animated_sprite.animation_finished.disconnect(_play_animation_secondary_finished_)

## Función con la que se podrán ejecutar comandos para cuando el estado procese su funcionamiento.
## El parámetro [param _delta] recibe el tiempo en segundos transcurrido desde la última ejecución de esta función.
func process(_delta : float) -> void:
	# Cambiar de estado a Dash.
	if to_dash(): return
	# Cambiar de estado a Jump.
	if to_jump(): return
	# Cambiar de estado a Walk.
	if to_walk(): return
	# Cambiar de estado a Falling.
	if to_falling(): return

## Función con la que se podrán ejecutar comandos para cuando el estado inicie su funcionamiento.
func start() -> void:
	# Inicializar valores.
	name = "Idle"
	_hero_.can_dash_ground = true
	_hero_.can_double_jump = true

	# Definir animaciones de este estado.
	animations.append("Idle_01")
	animations.append("Idle_02")
	animations.append("Idle_03")
	# Reproducir la animación base.
	_play_animation_base_()

## Función para reproducir la animación base de este estado.
func _play_animation_base_() -> void:
	_hero_.animated_sprite.play(animations[0])
	# Usar un tween para temporizar la animación base y pasar a otra.
	if _tween_animation_loop_:
		_tween_animation_loop_.kill()
	_tween_animation_loop_ = _hero_.create_tween()
	# Esperar entre 10 y 15 segundos.
	_tween_animation_loop_.tween_interval(randi_range(10, 15))
	_tween_animation_loop_.tween_callback(_play_animation_secondary_)

## Función para reproducir una animación secundaria de este estado.
func _play_animation_secondary_() -> void:
	# Seleccionar una animación secundaria de forma aleatoria.
	var __aux : int = randi_range(1, animations.size() - 1)
	_hero_.animated_sprite.play(animations[__aux])
	# Al terminar la animación secundaria, volver a la animación base.
	_hero_.animated_sprite.animation_finished.connect(_play_animation_secondary_finished_)

## Función para recibir la señal de terminar la animación secundaria.
func _play_animation_secondary_finished_() -> void:
	_hero_.animated_sprite.animation_finished.disconnect(_play_animation_secondary_finished_)
	_play_animation_base_()
#endregion
