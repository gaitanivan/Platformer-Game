## 📑 Clase que define el estado WallJump de un heroe.
class_name gmStHeroWallJump
extends gmStHeroBase


#region Vars
## Determina a donde debe mirar el personaje.
var _dir_face_ : gmCharacterBase.dirs_face = gmCharacterBase.dirs_face.LEFT
## Determina si se ha dejado de presionar el botón de salto.
var _jump_released_ : bool
#endregion


#region Events
#endregion


#region Functions
## Función con la que se podrán ejecutar comandos para cuando el estado termina su funcionamiento.
func end() -> void:
	# Hacer que la velocidad constante se resetee.
	_hero_.constant_velocity.x = 0

## Función con la que se podrán ejecutar comandos para cuando el estado procese su funcionamiento.
## El parámetro [param _delta] recibe el tiempo en segundos transcurrido desde la última ejecución de esta función.
func process(_delta : float) -> void:
	# Procesar acciones del estado.
	# Validar si se deja de pulsar el botón de salto.
	if not _jump_released_ and not _hero_.jp_controller.jump_pressed:
		_jump_released_ = true
		_hero_.do_jump_release()
	# Asignar la dirección a la que mira el personaje.
	_hero_.set_dir_face(_dir_face_)

	# Cambiar de estado a WallJump.
	if to_wall_jump(): return
	# Cambiar de estado a DoubleJump.
	if to_double_jump(): return
	# Cambiar de estado a Falling.
	if to_falling(): return
	# Cambiar de estado a Walk.
	if _hero_.velocity.y >= 0 and to_walk(): return
	# Cambiar de estado a Idle.
	if _hero_.velocity.y >= 0 and to_idle(): return

## Función con la que se podrán ejecutar comandos para cuando el estado inicie su funcionamiento.
func start() -> void:
	# Inicializar valores.
	name = "WallJump"
	# Determinar la dirección del salto.
	var __coll := _hero_.get_last_slide_collision()
	var __coll_dir := signf(__coll.get_normal().x) as int
	# Hacer que el heroe se mueva de forma constante en la dirección contraria a la pared desde la que salta.
	_dir_face_ = __coll_dir as gmCharacterBase.dirs_face
	_hero_.constant_velocity.x = _hero_._speed_x_base_ * __coll_dir

	# Definir animaciones de este estado.
	animations.append("Jump")
	# Reproducir la animación base.
	_hero_.animated_sprite.play(animations[0])
	# Aplicar la fuerza de salto.
	_hero_.do_jump()
#endregion
