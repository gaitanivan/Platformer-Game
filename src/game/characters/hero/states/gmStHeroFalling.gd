## 📑 Clase que define el estado Falling de un heroe.
class_name gmStHeroFalling
extends gmStHeroBase


#region Vars
#endregion


#region Events
#endregion


#region Functions
## Función con la que se podrán ejecutar comandos para cuando el estado termina su funcionamiento.
func end() -> void:
	# Hacer que la gravedad del heroe vuelva a su valor base.
	_hero_.gravity = _hero_._gravity_base_

## Función con la que se podrán ejecutar comandos para cuando el estado procese su funcionamiento.
## El parámetro [param _delta] recibe el tiempo en segundos transcurrido desde la última ejecución de esta función.
func process(_delta : float) -> void:
	# Cambiar de estado a DoubleJump.
	if to_double_jump(): return
	# Cambiar de estado a Walk.
	if to_walk(): return
	# Cambiar de estado a WallSlide.
	if to_wall_slide(): return
	# Cambiar de estado a Idle.
	if to_idle(): return

## Función con la que se podrán ejecutar comandos para cuando el estado inicie su funcionamiento.
func start() -> void:
	# Inicializar valores.
	name = "Falling"
	# Hacer que el heroe caiga algo mas rápido.
	_hero_.gravity = _hero_._gravity_base_ * 2

	# Definir animaciones de este estado.
	animations.append("Falling")
	# Reproducir la animación base.
	_hero_.animated_sprite.play(animations[0])
#endregion
