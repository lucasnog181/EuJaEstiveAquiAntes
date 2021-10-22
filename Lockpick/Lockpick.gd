extends Node2D

var start = false
var previous_value = -1
var goal = 10
var one = false
var two = false

var rng = RandomNumberGenerator.new()

func _ready():
	get_node("Control/GoalLabel").text = String(goal)
	Serial.connect("potenciometro", self, "_on_potenciometro")
	get_node("Timer").start(5)
	start = true

func _process(delta):
	if start:
		get_node("Control/TimerLabel").text = String(int(get_node("Timer").time_left))

func _on_potenciometro(player, value):
	value = int(value)
	if value != previous_value:
		print(value)
		previous_value = value
		get_node("Control/Label").text = String(value)
		lockpick(value)

func lockpick(value):
	if value == goal:
		# start timer, when it times out, check if it is still equal to goal
		if not one:
			one = true
		else:
			if not two:
				two = true
			else:
				print("You win! Change scene.")
		rng.randomize()
		goal = int(rng.randf_range(1, 19))
		get_node("Control/GoalLabel").text = String(goal)
		get_node("Timer").start(5)
	


func _on_Timer_timeout():
	get_node("Timer").stop()
	get_node("Control/Label").hide()
	get_node("Control/TimerLabel").hide()
	get_node("Control/GoalLabel").hide()
	get_node("Control/ObjetivoText").hide()
	get_node("Control/TempoText").text = "Voce Perdeu!"
	
