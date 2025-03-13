extends Node2D

@onready var rotating_indicator: Node2D = $"Rotating Indicator"
@onready var qte_zone: Sprite2D = $"../qteZone"



@export var isActive : bool = true
@export var isSuccess : bool = true	
@export var rotate : float = 1.0
@export var speed : float = 100.0
var qtePosistion : float  = 0
func _ready() -> void:
	qte_zone.rotation = randf_range(0.0,360.0)
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if isActive:
		rotate += speed * delta
		rotation_degrees = rotate 
		if rotate > 360.0 : rotate = 0.0

func _qteStatus(qteAchieved: bool) -> void:
	if !isActive && isSuccess:
		qteAchieved = true
	if !isActive && !isSuccess:
		qteAchieved = false	

	

func _on_area_entered(area: Area2D) -> bool:
	print("entered")
	if Input.is_action_pressed("ui_accept"):
		isActive = false
	
		isSuccess = true
	return true


#func _on_body_entered(body: Node2D) -> void:
	#print("Entered:", body.name)


func _on_area_exited(area: Area2D) -> bool:
	print("exited")
	if !isActive:
		isSuccess = false
	return false
