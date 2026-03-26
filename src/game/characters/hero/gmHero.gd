## 📑 Clase que define la escena que va a controlar un heroe.
class_name gmHero
extends gmCharacterBase


#region Vars
## Mantiene referencia al control del jugador.
var jp_controller : gmJoyPadController
#endregion


#region Events
func _ready() -> void:
	# Ejecutar los comandos de la clase padre.
	super()
	# Inicializaciones.
	jp_controller = gmJoyPadController.new()
	var __initial_state := gmStHeroIdle.new(self)
	sm.change_state(__initial_state)
	start_gravity()
	start_jump_height_max(32)
	start_speed_x(128)

func _physics_process(_delta: float) -> void:
	jp_controller.process(_delta)
	dir_movement = jp_controller.dir
	super(_delta)
	$Label.text = sm._current_state_.name
#endregion


#region Functions
#endregion
