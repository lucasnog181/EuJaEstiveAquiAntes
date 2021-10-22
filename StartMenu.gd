extends Control


func _ready():
	$VBoxContainer/StartBtn.grab_focus()

func _on_StartBtn_pressed():
	get_tree().change_scene("res://Tela_Calabouco.tscn")


func _on_QuitBtn_pressed():
	get_tree().quit()
