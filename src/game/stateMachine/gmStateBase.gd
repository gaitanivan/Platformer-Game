## 📑 Clase que define el estado base que usan los componentes del juego.
class_name gmStateBase


#region Vars
## Define el nombre que identifica el estado.
var name : StringName
#endregion


#region Events
#endregion


#region Functions
## Función con la que se podrán ejecutar comandos para cuando el estado termina su funcionamiento.
func end() -> void:
	pass

## Función con la que se podrán ejecutar comandos para cuando el estado procese su funcionamiento.
## El parámetro [param _delta] recibe el tiempo en segundos transcurrido desde la última ejecución de esta función.
func process(_delta : float) -> void:
	pass

## Función con la que se podrán ejecutar comandos para cuando el estado inicie su funcionamiento.
func start() -> void:
	pass
#endregion
