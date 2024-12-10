extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$MarginContainer/VBoxContainer/money.text = "Money: " + str(GameManager.money).pad_decimals(0)
	$MarginContainer/VBoxContainer/customer.text = "Customers: " + str(GameManager.customer).pad_decimals(0)
	$money_s.text = "Money/s: " + str(GameManager.money_s).pad_decimals(1)
	$customer_s.text = "Customers/s: " + str(GameManager.customer_s).pad_decimals(1)
	

func _on_texture_button_pressed() -> void:
	GameManager.money += GameManager.click_amount


func _on_timer_timeout() -> void:
	var money:float = GameManager.money_s * 0.1
	var customer:float = GameManager.customer_s * 0.1
	
	GameManager.money += money
	GameManager.customer += customer
