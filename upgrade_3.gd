extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.money < GameManager.upgrade3_cost:
		self.disabled = true
	else:
		self.disabled = false
	
	
	$cost.text = str(GameManager.upgrade3_cost).pad_decimals(0)
	$amount.text = str(GameManager.upgrade3_amount)


func _on_pressed() -> void:
	GameManager.money -= GameManager.upgrade3_cost
	GameManager.upgrade3_amount += 1
	GameManager.upgrade3_cost *= 1.25
	GameManager.money_s += GameManager.upgrade3_money
	GameManager.customer_s += GameManager.upgrade3_customer
