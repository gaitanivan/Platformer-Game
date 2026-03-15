## 📑 Clase que define el módulo que representa el mundo del juego.
class_name gmModuleWorld
extends gmModuleBase


#region Vars
## Mantiene la referencia al nivel actual.
var _current_level_ : gmLevelBase
## Mantiene la referencia al nodo que contiene los niveles.
var _level_container_ : Node2D
#endregion


#region Events
func _ready() -> void:
	# Inicializar contenedores y controles.
	_level_container_ = %LevelContainer

	# Cargar el nivel de pruebas.
	var __testLevel : gmLevelBase = load("uid://btdn1pkj6jri").instantiate()
	change_level(__testLevel)
#endregion


#region Functions
## Función para cambiar de nivel en el mundo.[br]
## El parámetro [param _new_level] recibe el nivel a cargar.
func change_level(_new_level : gmLevelBase) -> void:
	if _current_level_:
		_current_level_.end()
		_level_container_.remove_child(_current_level_)
	_current_level_ = _new_level
	_current_level_.start()
	_level_container_.add_child(_current_level_)
#endregion
