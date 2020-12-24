extends Node2D

# image we will show later
export var image1: Texture
# id we use to identify an images added to imgui, we use this to show images
var image1_id: int
var imgui: ImGui



func _ready():
	imgui = ImGui.new()

	# DO add as a child
	add_child(imgui)

	if image1:
		# add to imgui
		image1_id = imgui.add_image(image1)

func _process(_delta):
	# set style to light, default is dark
	imgui.style_color_light()

	imgui.new_frame()
	
	# NOTE:
	# not sure why we have to create a window before showing demo window, or it will crash
	imgui.begin("Hello", false, ImGuiConstants.window_flags_none)
	
	if image1:
		# use helper to provide default parameters
		ImGuiHelpers.image(imgui, image1_id, image1.get_size())
	
	imgui.end()

	imgui.show_demo_window()
	
	

	imgui.render()
