## 📑 Clase que define el estado WallSlide de un heroe.
class_name gmStHeroWallSlide
extends gmStHeroBase


#region Vars
#endregion


#region Events
#endregion


#region Functions
## Función con la que se podrán ejecutar comandos para cuando el estado termina su funcionamiento.
func end() -> void:
	# Hacer que la velocidad constante se resetee.
	_hero_.constant_velocity.y = 0
	# Hacer que el personaje quede viendo al otro lado.
	_hero_.set_dir_face(_hero_.dirs_face.RIGHT if _hero_.dir_face == _hero_.dirs_face.LEFT else _hero_.dirs_face.LEFT)

## Función con la que se podrán ejecutar comandos para cuando el estado procese su funcionamiento.
## El parámetro [param _delta] recibe el tiempo en segundos transcurrido desde la última ejecución de esta función.
func process(_delta : float) -> void:
	# Cambiar de estado a Falling.
	if (_hero_.dir_movement.x == 0 or not _hero_.is_on_wall()) \
	and to_falling(): return
	# Cambiar de estado a Dash.
	if to_dash(): return
	# Cambiar de estado a Walk.
	if to_wall_jump(): return
	# Cambiar de estado a Walk.
	if to_walk(): return
	# Cambiar de estado a Idle.
	if to_idle(): return

## Función con la que se podrán ejecutar comandos para cuando el estado inicie su funcionamiento.
func start() -> void:
	# Inicializar valores.
	name = "WallSlide"
	# Hacer que el heroe caiga despacio.
	_hero_.constant_velocity.y = _hero_._gravity_base_ / 4

	# Definir animaciones de este estado.
	animations.append("WallSlide")
	# Reproducir la animación base.
	_hero_.animated_sprite.play(animations[0])
#endregion
