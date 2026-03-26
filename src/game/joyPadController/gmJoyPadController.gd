## 📑 Clase que define la gestión del control con que el jugador maneja al heroe.
class_name gmJoyPadController


#region Vars
## Indica la dirección que el jugador está marcando en su control.
var dir : Vector2
## Indica si recien se presionó el botón de saltar.
var jump_just_pressed : bool
## Indica si se está presionando el botón de saltar.
var jump_pressed : bool
#endregion


#region Events
#endregion


#region Functions
func process(_delta: float) -> void:
	# Verificar la dirección.
	dir.x = (-1 if Input.is_action_pressed("gm_LE") else 0) + (1 if Input.is_action_pressed("gm_RI") else 0)
	dir.y = (-1 if Input.is_action_pressed("gm_UP") else 0) + (1 if Input.is_action_pressed("gm_DO") else 0)
	# Verificar el botón de salto.
	jump_just_pressed = Input.is_action_just_pressed("gm_B0")
	jump_pressed = Input.is_action_pressed("gm_B0")
#endregion
