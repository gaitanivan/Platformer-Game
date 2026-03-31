## 📑 Clase que define la máquina de estados base que usan los componentes del juego.
class_name gmStateMachineBase


#region Vars
## Mantiene la referencia al estado actual.
var current_state : gmStateBase
## Mantiene el nombre del estado anterior.
var previous_state : StringName
#endregion


#region Events
#endregion


#region Functions
## Función para cambiar de estado.[br]
## El parámetro [param _new_state] recibe el estado a ejecutar.
func change_state(_new_state : gmStateBase) -> void:
	if current_state:
		current_state.end()
		previous_state = current_state.name
	current_state = _new_state
	current_state.start()

## Función que le indica al estado actual que ejecute su comportamiento.[br]
## El parámetro [param _delta] recibe el tiempo en segundos transcurrido desde la última ejecución de esta función.
func process(_delta : float) -> void:
	current_state.process(_delta)
#endregion
