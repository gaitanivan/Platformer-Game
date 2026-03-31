## 📑 Clase que define el estado base de un heroe.
class_name gmStHeroBase
extends gmStCharacterBase


#region Vars
## Mantiene referencia al heroe.
var _hero_ : gmHero
#endregion


#region Events
## Señal que sirve como constructor de la clase.[br]
## El parámetro [param _hero] recibe el objeto sobre el que trabaja este estado.
func _init(_hero : gmHero) -> void:
	_hero_ = _hero
#endregion


#region Functions
## Función que ayuda a saber si el heroe debe cambiar al estado Dash.
func to_dash() -> bool:
	# Determinar si el personaje se impulsa.
	if _hero_.can_dash and _hero_.jp_controller.dash_just_pressed:
		_hero_.sm.change_state(gmStHeroDash.new(_hero_))
		return true
	return false

## Función que ayuda a saber si el heroe debe cambiar al estado DoubleJump.
func to_double_jump() -> bool:
	# Determinar si el personaje salta.
	if _hero_.can_double_jump and not _hero_.is_on_floor() and _hero_.jp_controller.jump_just_pressed:
		_hero_.sm.change_state(gmStHeroDoubleJump.new(_hero_))
		return true
	return false

## Función que ayuda a saber si el heroe debe cambiar al estado Falling.
func to_falling() -> bool:
	# Determinar si el personaje cae.
	if not _hero_.is_on_floor() and _hero_.velocity.y > 0:
		_hero_.sm.change_state(gmStHeroFalling.new(_hero_))
		return true
	return false

## Función que ayuda a saber si el heroe debe cambiar al estado Idle.
func to_idle() -> bool:
	# Determinar si el personaje está quieto.
	if _hero_.is_on_floor() and _hero_.dir_movement.x == 0:
		_hero_.sm.change_state(gmStHeroIdle.new(_hero_))
		return true
	return false

## Función que ayuda a saber si el heroe debe cambiar al estado Jump.
func to_jump() -> bool:
	# Determinar si el personaje salta.
	if _hero_.is_on_floor() and _hero_.jp_controller.jump_just_pressed:
		_hero_.sm.change_state(gmStHeroJump.new(_hero_))
		return true
	return false

## Función que ayuda a saber si el heroe debe cambiar al estado Landing.[br]
## El parámetro [param _previous_velocity_y] recibe el valor de la velocidad en Y que tenía el heroe.
func to_landing(_previous_velocity_y : float) -> bool:
	# Determinar si el personaje se llega al suelo muy rápido.
	if _hero_.is_on_floor() and _previous_velocity_y >= _hero_.gravity:
		_hero_.sm.change_state(gmStHeroLanding.new(_hero_))
		return true
	return false

## Función que ayuda a saber si el heroe debe cambiar al estado Walk.
func to_walk() -> bool:
	# Determinar si el personaje se mueve.
	if _hero_.is_on_floor() and _hero_.dir_movement.x != 0:
		_hero_.sm.change_state(gmStHeroWalk.new(_hero_))
		return true
	return false

## Función que ayuda a saber si el heroe debe cambiar al estado WallJump.
func to_wall_jump() -> bool:
	# Determinar si el personaje salta desde la pared.
	if _hero_.is_on_wall() and _hero_.jp_controller.jump_just_pressed:
		var __coll := _hero_.get_last_slide_collision()
		if __coll:
			var __coll_dir := -signf(__coll.get_normal().x)
			if __coll_dir == _hero_.dir_movement.x:
				_hero_.sm.change_state(gmStHeroWallJump.new(_hero_))
		return true
	return false

## Función que ayuda a saber si el heroe debe cambiar al estado WallSlide.
func to_wall_slide() -> bool:
	# Determinar si el personaje está en una pared y el jugador está presionando a esa pared.
	if not _hero_.is_on_floor() and _hero_.is_on_wall():
		var __coll_dir := -signf(_hero_.get_wall_normal().x)
		if __coll_dir == _hero_.dir_movement.x:
			_hero_.sm.change_state(gmStHeroWallSlide.new(_hero_))
			return true
	return false
#endregion
