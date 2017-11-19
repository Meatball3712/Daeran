extends Control

# next scene
export (PackedScene) var next_scene

#animation player
onready var anim_player = get_node("anim_player")

#are we loading?
var is_loading = true

#start
func _ready():
	#enable user input
	set_process_input(true)
	
	#run animation
	fade_in_out()
	
#user input
func _input(event):
	if(event.is_action_pressed("ui_select")):
		next_scene()
		
#run fade in and fade out
func fade_in_out():
	anim_player.play("fade_in_out")
	anim_player.connect("finished", self, "goto_next_scene")
	
func goto_next_scene():
	#if data is still loading when splash screen animation is done
	#try to load the next scene every second
	if(is_loading):
		var timer = Timer.new()
		add_child(timer)
		timer.set_wait_time(1) #seconds
		timer.connect("timeout", self, "next_scene")
		timer.start() 
	else:
		next_scene()
		
func next_scene():
	if(!is_loading):
		print("Still loading next scene from splash!")
		#go to next scene
		get_parent().add_child(next_scene.instance())
		queue_free()
		
