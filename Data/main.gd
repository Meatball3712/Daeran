extends Control

export (PackedScene) var next_scene
var next_scene_instance = null
#loading thread
onready var loading_thread = Thread.new()

func _ready():
	#Begin Load Data
	loading_thread.start(self, "load_data")
	#display splash screen
	splash_screen()
	
func splash_screen():
	print("Load Splash Screen")
	
	#create instance
	next_scene_instance = next_scene.instance()
	
	#add to scene
	add_child(next_scene_instance)


#load data (configs, saves etc.)
func load_data(vars):
#	#simulate data load
	for i in range(0, 9900000):
		for j in range(0, 7):
			pass
	print("Done Loading Data!")
	next_scene_instance.is_loading = false