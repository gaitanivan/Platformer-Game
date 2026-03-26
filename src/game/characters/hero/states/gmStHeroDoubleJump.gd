## 📑 Clase que define el estado DoubleJump de un heroe.
class_name gmStHeroDoubleJump
extends gmStHeroBase


#region Vars
## Determina si se ha dejado de presionar el botón de salto.
var _jump_released_ : bool
#endregion


#region Events
#endregion


#region Functions
## Función con la que se podrán ejecutar comandos para cuando el estado procese su funcionamiento.
## El parámetro [param _delta] recibe el tiempo en segundos transcurrido desde la última ejecución de esta función.
func process(_delta : float) -> void:
	# Procesar acciones del estado.
	# Validar si se deja de pulsar el botón de salto.
	if not _jump_released_ and not _hero_.jp_controller.jump_pressed:
		_jump_released_ = true
		_hero_.do_jump_release()

	# Cambiar de estado a WallJump.
	if to_wall_jump(): return
	# Cambiar de estado a Falling.
	if to_falling(): return
	# Cambiar de estado a Walk.
	if _hero_.velocity.y >= 0 and to_walk(): return
	# Cambiar de estado a Idle.
	if _hero_.velocity.y >= 0 and to_idle(): return

## Función con la que se podrán ejecutar comandos para cuando el estado inicie su funcionamiento.
func start() -> void:
	# Inicializar valores.
	name = "DoubleJump"
	_hero_.can_double_jump = false

	# Definir animaciones de este estado.
	animations.append("Jump")
	# Reproducir la animación base.
	_hero_.animated_sprite.play(animations[0])
	# Aplicar la fuerza de salto.
	_hero_.do_jump()
#endregion
