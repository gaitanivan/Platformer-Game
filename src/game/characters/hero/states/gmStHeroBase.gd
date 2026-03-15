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
## Función que ayuda a saber si el heroe debe cambiar al estado Idle.
func to_idle() -> bool:
	# Determinar si el personaje se mueve.
	if _hero_.dir_movement.x == 0:
		_hero_.sm.call_deferred("change_state", gmStHeroIdle.new(_hero_))
		return true
	return false

## Función que ayuda a saber si el heroe debe cambiar al estado Walk.
func to_walk() -> bool:
	# Determinar si el personaje se mueve.
	if _hero_.dir_movement.x != 0:
		_hero_.sm.call_deferred("change_state", gmStHeroWalk.new(_hero_))
		return true
	return false
#endregion
