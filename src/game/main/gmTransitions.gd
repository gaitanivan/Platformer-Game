## 📑 Clase que define las transisiones de pantallas en el juego.
class_name gmTransitions
extends CanvasLayer


#region Vars
## Define la transición sencilla de fondo negro.
var _tran_01_ : PanelContainer
## Indica si una transición de entrada ha trerminado.
var _tran_in_end_ : bool
## Indica si una transición de salida ha trerminado.
var _tran_out_end_ : bool
## Define el tween para animaciónes.
var _tween_ : Tween
#endregion


#region Events
func _ready() -> void:
	# Inicializar variables.
	_tran_01_ = %Tran_01

	# Inicializar estado de las transiciones.
	_tran_01_.visible = false
#endregion


#region Functions
## Función para mostrar una transición de aparecer desde abajo.
func bottom_in() -> void:
	# Indicar el estado de la transición.
	_tran_in_end_ = false
	# Inicializar estado de la transición.
	# Obtener el stylebox que representa el panel.
	var _sbf : StyleBoxFlat = _tran_01_.get("theme_override_styles/panel")
	# Hacer el color del panel opaco.
	_sbf.bg_color.a = 1
	# Definir el tamaño.
	_tran_01_.anchor_left = 0
	_tran_01_.anchor_top = 1
	_tran_01_.anchor_right = 1
	_tran_01_.anchor_bottom = 1
	# Definir la visibilidad.
	_tran_01_.visible = true
	# Definir el tween que hará la animación.
	if _tween_:
		_tween_.kill()
	_tween_ = create_tween()
	_tween_.finished.connect(func():
		_tran_in_end_ = true
	)
	_tween_.tween_property(_tran_01_, "anchor_top", 0, 0.5)

## Función para mostrar una transición de desaparecer desde abajo.
func bottom_out() -> void:
	# Indicar el estado de la transición.
	_tran_out_end_ = false
	# Inicializar estado de la transición.
	# Obtener el stylebox que representa el panel.
	var _sbf : StyleBoxFlat = _tran_01_.get("theme_override_styles/panel")
	# Hacer el color del panel opaco.
	_sbf.bg_color.a = 1
	# Definir el tamaño.
	_tran_01_.anchor_left = 0
	_tran_01_.anchor_top = 0
	_tran_01_.anchor_right = 1
	_tran_01_.anchor_bottom = 1
	# Definir la visibilidad.
	_tran_01_.visible = true
	# Definir el tween que hará la animación.
	if _tween_:
		_tween_.kill()
	_tween_ = create_tween()
	_tween_.finished.connect(func():
		_tran_out_end_ = true
		_tran_01_.visible = false
	)
	_tween_.tween_property(_tran_01_, "anchor_bottom", 0, 0.5)

## Función para mostrar una transición de aparecer.
func fade_in() -> void:
	# Indicar el estado de la transición.
	_tran_in_end_ = false
	# Inicializar estado de la transición.
	# Obtener el stylebox que representa el panel.
	var _sbf : StyleBoxFlat = _tran_01_.get("theme_override_styles/panel")
	# Hacer el color del panel transparente.
	_sbf.bg_color.a = 0
	# Definir el tamaño.
	_tran_01_.anchor_left = 0
	_tran_01_.anchor_top = 0
	_tran_01_.anchor_right = 1
	_tran_01_.anchor_bottom = 1
	# Definir la visibilidad.
	_tran_01_.visible = true
	# Definir el tween que hará la animación.
	if _tween_:
		_tween_.kill()
	_tween_ = create_tween()
	_tween_.finished.connect(func():
		_tran_in_end_ = true
	)
	_tween_.tween_property(_sbf, "bg_color:a", 1, 0.5)

## Función para mostrar una transición de desaparecer.
func fade_out() -> void:
	# Indicar el estado de la transición.
	_tran_out_end_ = false
	# Inicializar estado de la transición.
	# Obtener el stylebox que representa el panel.
	var _sbf : StyleBoxFlat = _tran_01_.get("theme_override_styles/panel")
	# Hacer el color del panel opaco.
	_sbf.bg_color.a = 1
	# Definir el tamaño.
	_tran_01_.anchor_left = 0
	_tran_01_.anchor_top = 0
	_tran_01_.anchor_right = 1
	_tran_01_.anchor_bottom = 1
	# Definir la visibilidad.
	_tran_01_.visible = true
	# Definir el tween que hará la animación.
	if _tween_:
		_tween_.kill()
	_tween_ = create_tween()
	_tween_.finished.connect(func():
		_tran_out_end_ = true
		_tran_01_.visible = false
	)
	_tween_.tween_property(_sbf, "bg_color:a", 0, 0.5)

## Función para mostrar una transición de aparecer desde la izquierda.
func left_in() -> void:
	# Indicar el estado de la transición.
	_tran_in_end_ = false
	# Inicializar estado de la transición.
	# Obtener el stylebox que representa el panel.
	var _sbf : StyleBoxFlat = _tran_01_.get("theme_override_styles/panel")
	# Hacer el color del panel opaco.
	_sbf.bg_color.a = 1
	# Definir el tamaño.
	_tran_01_.anchor_left = 0
	_tran_01_.anchor_top = 0
	_tran_01_.anchor_right = 0
	_tran_01_.anchor_bottom = 1
	# Definir la visibilidad.
	_tran_01_.visible = true
	# Definir el tween que hará la animación.
	if _tween_:
		_tween_.kill()
	_tween_ = create_tween()
	_tween_.finished.connect(func():
		_tran_in_end_ = true
	)
	_tween_.tween_property(_tran_01_, "anchor_right", 1, 0.5)

## Función para mostrar una transición de desaparecer desde la izquierda.
func left_out() -> void:
	# Indicar el estado de la transición.
	_tran_out_end_ = false
	# Inicializar estado de la transición.
	# Obtener el stylebox que representa el panel.
	var _sbf : StyleBoxFlat = _tran_01_.get("theme_override_styles/panel")
	# Hacer el color del panel opaco.
	_sbf.bg_color.a = 1
	# Definir el tamaño.
	_tran_01_.anchor_left = 0
	_tran_01_.anchor_top = 0
	_tran_01_.anchor_right = 1
	_tran_01_.anchor_bottom = 1
	# Definir la visibilidad.
	_tran_01_.visible = true
	# Definir el tween que hará la animación.
	if _tween_:
		_tween_.kill()
	_tween_ = create_tween()
	_tween_.finished.connect(func():
		_tran_out_end_ = true
		_tran_01_.visible = false
	)
	_tween_.tween_property(_tran_01_, "anchor_left", 1, 0.5)

## Función para mostrar una transición de aparecer desde la derecha.
func right_in() -> void:
	# Indicar el estado de la transición.
	_tran_in_end_ = false
	# Inicializar estado de la transición.
	# Obtener el stylebox que representa el panel.
	var _sbf : StyleBoxFlat = _tran_01_.get("theme_override_styles/panel")
	# Hacer el color del panel opaco.
	_sbf.bg_color.a = 1
	# Definir el tamaño.
	_tran_01_.anchor_left = 1
	_tran_01_.anchor_top = 0
	_tran_01_.anchor_right = 1
	_tran_01_.anchor_bottom = 1
	# Definir la visibilidad.
	_tran_01_.visible = true
	# Definir el tween que hará la animación.
	if _tween_:
		_tween_.kill()
	_tween_ = create_tween()
	_tween_.finished.connect(func():
		_tran_in_end_ = true
	)
	_tween_.tween_property(_tran_01_, "anchor_left", 0, 0.5)

## Función para mostrar una transición de desaparecer desde la izquierda.
func right_out() -> void:
	# Indicar el estado de la transición.
	_tran_out_end_ = false
	# Inicializar estado de la transición.
	# Obtener el stylebox que representa el panel.
	var _sbf : StyleBoxFlat = _tran_01_.get("theme_override_styles/panel")
	# Hacer el color del panel opaco.
	_sbf.bg_color.a = 1
	# Definir el tamaño.
	_tran_01_.anchor_left = 0
	_tran_01_.anchor_top = 0
	_tran_01_.anchor_right = 1
	_tran_01_.anchor_bottom = 1
	# Definir la visibilidad.
	_tran_01_.visible = true
	# Definir el tween que hará la animación.
	if _tween_:
		_tween_.kill()
	_tween_ = create_tween()
	_tween_.finished.connect(func():
		_tran_out_end_ = true
		_tran_01_.visible = false
	)
	_tween_.tween_property(_tran_01_, "anchor_right", 0, 0.5)

## Función para mostrar una transición de aparecer desde arriba.
func top_in() -> void:
	# Indicar el estado de la transición.
	_tran_in_end_ = false
	# Inicializar estado de la transición.
	# Obtener el stylebox que representa el panel.
	var _sbf : StyleBoxFlat = _tran_01_.get("theme_override_styles/panel")
	# Hacer el color del panel opaco.
	_sbf.bg_color.a = 1
	# Definir el tamaño.
	_tran_01_.anchor_left = 0
	_tran_01_.anchor_top = 0
	_tran_01_.anchor_right = 1
	_tran_01_.anchor_bottom = 0
	# Definir la visibilidad.
	_tran_01_.visible = true
	# Definir el tween que hará la animación.
	if _tween_:
		_tween_.kill()
	_tween_ = create_tween()
	_tween_.finished.connect(func():
		_tran_in_end_ = true
	)
	_tween_.tween_property(_tran_01_, "anchor_bottom", 1, 0.5)

## Función para mostrar una transición de desaparecer desde arriba.
func top_out() -> void:
	# Indicar el estado de la transición.
	_tran_out_end_ = false
	# Inicializar estado de la transición.
	# Obtener el stylebox que representa el panel.
	var _sbf : StyleBoxFlat = _tran_01_.get("theme_override_styles/panel")
	# Hacer el color del panel opaco.
	_sbf.bg_color.a = 1
	# Definir el tamaño.
	_tran_01_.anchor_left = 0
	_tran_01_.anchor_top = 0
	_tran_01_.anchor_right = 1
	_tran_01_.anchor_bottom = 1
	# Definir la visibilidad.
	_tran_01_.visible = true
	# Definir el tween que hará la animación.
	if _tween_:
		_tween_.kill()
	_tween_ = create_tween()
	_tween_.finished.connect(func():
		_tran_out_end_ = true
		_tran_01_.visible = false
	)
	_tween_.tween_property(_tran_01_, "anchor_top", 1, 0.5)
#endregion
