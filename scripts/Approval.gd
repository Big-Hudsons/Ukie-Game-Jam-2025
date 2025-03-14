#extends Node
#
#var m_approval : int = 0
#var m_debugInt : int = 1
#@onready var h_slider: HSlider = $CanvasLayer/HSlider
#
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#@warning_ignore("unused_parameter")
#func _process(delta: float) -> void:
	#if m_approval == 100 : m_debugInt = -1
	#if m_approval == 0   : m_debugInt = 1
	#m_approval += m_debugInt
	#h_slider.value = m_approval
	#print(m_approval)
	#
#
#func _addApproval(n: int) -> void:
	#m_approval += n
	#
