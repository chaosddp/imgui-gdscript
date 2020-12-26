extends Node2D

# image we will show later
export var image1: Texture
# id we use to identify an images added to imgui, we use this to show images
var image1_id: int
var imgui: ImGui

	# helper class that wrap raw imgui instance that provide convenient way to construct widgets (with default parameters)
var helper: ImGuiHelper

var show_demo_window:= false

func _ready():
	imgui = ImGui.new()

	# DO add as a child
	add_child(imgui)
	
	# set style to light, default is dark
	#helper.style_color(helper.StyleColor.LIGHT)	
	
	# helper
	helper = ImGuiHelper.new(imgui)

	if image1:
		# add to imgui
		image1_id = helper.add_image(image1)

func _process(_delta):
	helper.new_frame()
	
	# NOTE:
	# not sure why we have to create a window before showing demo window, or it will crash
	"""
	helper.begin("Hello")
	
	if image1:
		if helper.button("toggle demo window"):
			show_demo_window = !show_demo_window
		
		# use helper to provide default parameters
		helper.image(image1_id, image1.get_size())
	
	helper.end()
	"""
	#if show_demo_window:
	helper.show_demo_window(true, false)
	helper.show_demo_window(true, true)
	helper.render()
