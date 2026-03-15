## 📑 Clase que define la escena principal que va a controlar el juego.
class_name gmMain
extends Node2D


#region Vars
## Mantiene la referencia al módulo actual.
var _current_module_ : gmModuleBase
## Mantiene la referencia al nodo que contiene los módulos.
var _modules_container_ : Node2D
## Mantiene la referencia al nodo que controla las transiciones de pantallas.
var _transitions_ : CanvasLayer
#endregion


#region Events
func _ready() -> void:
	# Inicializar contenedores y controles.
	_modules_container_ = %ModulesContainer
	_transitions_ = %Transitions

	# Cargar el módulo principal.
	var __module : gmModuleBase = load("uid://ctnmwppedeqm5").instantiate()
	change_module(__module)
#endregion


#region Functions
## Función para cambiar de módulo en el juego.[br]
## El parámetro [param _new_module] recibe el módulo a ejecutar.
func change_module(_new_module : gmModuleBase) -> void:
	if _current_module_:
		_current_module_.end()
		_modules_container_.remove_child(_current_module_)
	_current_module_ = _new_module
	_current_module_.start()
	_modules_container_.add_child(_current_module_)
#endregion
