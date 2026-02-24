extends Area2D

var terra = "nao"
var plantar = "nao"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	await get_tree().create_timer(3.0).timeout

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# atualiza o rótulo de sementes
	var label = get_node("../CanvasLayer/semente-tomate") if has_node("../CanvasLayer/semente-tomate") else null
	if label:
		label.text = "sementes de tomate: %d" % Dados.semente

	if terra == "sim":
		if Dados.semente >= 1 and Input.is_action_just_released("ui_accept"):
			show()
			Dados.semente -= 1
			$AnimatedSprite2D.frame = 0
			await get_tree().create_timer(3.0).timeout
			$AnimatedSprite2D.frame = 1
			await get_tree().create_timer(4.0).timeout
			$AnimatedSprite2D.frame = 2
			await get_tree().create_timer(5.0).timeout
			$AnimatedSprite2D.frame = 3
			await get_tree().create_timer(6.0).timeout
			$AnimatedSprite2D.frame = 4

func _on_body_entered(body: Node2D) -> void:
	# não use "var" aqui (evita criar variável local)
	terra = "sim"

func _on_sementes_body_exited(body: Node2D) -> void:
	terra = "nao"
