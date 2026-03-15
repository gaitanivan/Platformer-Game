## 📑 Clase que define la escena que va a controlar un heroe.
class_name gmHero
extends gmCharacterBase


#region Vars
## Mantiene referencia al control del jugador.
var _jp_controller_ : gmJoyPadController
#endregion


#region Events
func _ready() -> void:
	# Ejecutar los comandos de la clase padre.
	super()
	# Inicializaciones.
	_jp_controller_ = gmJoyPadController.new()
	var __initial_state := gmStHeroIdle.new(self)
	sm.change_state(__initial_state)
	start_gravity()
	start_speed_x(64)

func _physics_process(_delta: float) -> void:
	_jp_controller_.process(_delta)
	dir_movement = _jp_controller_.dir
	super(_delta)
#endregion


#region Functions
#endregion
