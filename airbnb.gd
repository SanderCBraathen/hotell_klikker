extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.money <= GameManager.upgrade1_cost:
		self.disabled = true
	else:
		self.disabled = false
	
	
	$cost.text = str(GameManager.upgrade1_cost).pad_decimals(2)
	$amount.text = str(GameManager.upgrade1_amount)


func _on_pressed() -> void:
	GameManager.money -= GameManager.upgrade1_cost
	GameManager.upgrade1_amount += 1
	GameManager.upgrade1_cost *= 1.25
	GameManager.money_s += GameManager.upgrade1_money
