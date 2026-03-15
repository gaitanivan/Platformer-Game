## 📑 Clase que define la gestión del control con que el jugador maneja al heroe.
class_name gmJoyPadController


#region Vars
## Indica la dirección que el jugador está marcando en su control.
var dir : Vector2
#endregion


#region Events
#endregion


#region Functions
func process(_delta: float) -> void:
	dir.x = (-1 if Input.is_action_pressed("gm_LE") else 0) + (1 if Input.is_action_pressed("gm_RI") else 0)
	dir.y = (-1 if Input.is_action_pressed("gm_UP") else 0) + (1 if Input.is_action_pressed("gm_DO") else 0)
#endregion
