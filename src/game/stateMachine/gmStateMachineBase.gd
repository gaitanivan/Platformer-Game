## 📑 Clase que define la máquina de estados base que usan los componentes del juego.
class_name gmStateMachineBase


#region Vars
## Mantiene la referencia al estado actual.
var _current_state_ : gmStateBase
#endregion


#region Events
#endregion


#region Functions
## Función para cambiar de estado.[br]
## El parámetro [param _new_state] recibe el estado a ejecutar.
func change_state(_new_state : gmStateBase) -> void:
	if _current_state_:
		_current_state_.end()
	_current_state_ = _new_state
	_current_state_.start()

## Función que le indica al estado actual que ejecute su comportamiento.[br]
## El parámetro [param _delta] recibe el tiempo en segundos transcurrido desde la última ejecución de esta función.
func process(_delta : float) -> void:
	_current_state_.process(_delta)
#endregion
