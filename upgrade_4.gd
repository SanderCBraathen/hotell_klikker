extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.money < GameManager.upgrade4_cost:
		self.disabled = true
	else:
		self.disabled = false
	
	if GameManager.upgrade4_cost >= 10000:
		$cost.text = str(GameManager.upgrade4_cost / 1000).pad_decimals(1) + "K"
	else:
		$cost.text = str(GameManager.upgrade4_cost).pad_decimals(0)
	
	$amount.text = str(GameManager.upgrade4_amount)


func _on_pressed() -> void:
	GameManager.money -= GameManager.upgrade4_cost
	GameManager.upgrade4_amount += 1
	GameManager.upgrade4_cost *= 1.25
	GameManager.money_s += GameManager.upgrade4_money
	GameManager.customer_s += GameManager.upgrade4_customer
