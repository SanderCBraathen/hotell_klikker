extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if GameManager.money >= 10000:
		$MarginContainer/VBoxContainer/money.text = "Money: " + str(GameManager.money / 1000).pad_decimals(1) + "K"
	else:
		$MarginContainer/VBoxContainer/money.text = "Money: " + str(GameManager.money).pad_decimals(0)
	
	if GameManager.customer >= 10000:
		$MarginContainer/VBoxContainer/customer.text = "Customers: " + str(GameManager.customer / 1000).pad_decimals(1) + "K"
	else:
		$MarginContainer/VBoxContainer/customer.text = "Customers: " + str(GameManager.customer).pad_decimals(0)
	
	if GameManager.money_s >= 1000:
		$money_s.text = "Money/s: " + str(GameManager.money_s / 1000).pad_decimals(1) + "K"
	else:
		$money_s.text = "Money/s: " + str(GameManager.money_s).pad_decimals(1)
	
	if GameManager.customer_s >= 1000:
		$customer_s.text = "Customers/s: " + str(GameManager.customer_s / 1000).pad_decimals(1) + "K"
	else:
		$customer_s.text = "Customers/s: " + str(GameManager.customer_s).pad_decimals(1)



func _on_texture_button_pressed() -> void:
	GameManager.money += GameManager.click_amount


func _on_timer_timeout() -> void:
	var money:float = GameManager.money_s * 0.1
	var customer:float = GameManager.customer_s * 0.1
	GameManager.money += money
	GameManager.customer += customer
