extends Area2D
var semente = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	hide()
	
	await get_tree().create_timer(3.0).timeout
	print("tempo acabou")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"../seguradados/semente_tomate".text = str("sementes de tomate: ", semente)
	print(semente)
	pass


func _on_body_entered(body: Node2D) -> void:
	
	if semente >=1:
		show()
		semente -=1
		$AnimatedSprite2D.frame = 0
		await get_tree().create_timer(3.0).timeout
		$AnimatedSprite2D.frame = 1
		await get_tree().create_timer(4.0).timeout
		$AnimatedSprite2D.frame = 2
		await get_tree().create_timer(5.0).timeout
		$AnimatedSprite2D.frame = 3
		await get_tree().create_timer(6.0).timeout
		$AnimatedSprite2D.frame = 4
