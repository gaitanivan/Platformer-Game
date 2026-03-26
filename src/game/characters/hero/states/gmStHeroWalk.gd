## 📑 Clase que define el estado Walk de un heroe.
class_name gmStHeroWalk
extends gmStHeroBase


#region Vars
#endregion


#region Events
#endregion


#region Functions
## Función con la que se podrán ejecutar comandos para cuando el estado procese su funcionamiento.
## El parámetro [param _delta] recibe el tiempo en segundos transcurrido desde la última ejecución de esta función.
func process(_delta : float) -> void:
	# Cambiar de estado a Jump.
	if to_jump(): return
	# Cambiar de estado a Falling.
	if to_falling(): return
	# Cambiar de estado a Idle.
	if to_idle(): return

## Función con la que se podrán ejecutar comandos para cuando el estado inicie su funcionamiento.
func start() -> void:
	# Inicializar valores.
	name = "Walk"
	_hero_.can_double_jump = true

	# Definir animaciones de este estado.
	animations.append("Walk_01")
	# Reproducir la animación base.
	_hero_.animated_sprite.play(animations[0])
#endregion
