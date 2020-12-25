Use imgui in gdscript with GDNative binding for Godot 3.2.x.


## How to build

1. Before building, make sure the sub-modules are ready.

```bash
git submodule update --init --recursive
```

2. Build godot-cpp:

```bash
scons platform="platform" generate_bindings=yes bits=64 target=release -j"cpu core"
```

3. Build imgui-gdscript

```bash
scons platform="platform" target=release
```

## How to use

The libary will output into dist folder, copy all dist/bin to your project root.


```gdscript

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
	
	# helper
	helper = ImGuiHelper.new(imgui)

	if image1:
		# add to imgui
		image1_id = helper.add_image(image1)

func _process(_delta):
	# set style to light, default is dark
	helper.style_color(helper.StyleColor.LIGHT)

	helper.new_frame()
	
	# NOTE:
	# not sure why we have to create a window before showing demo window, or it will crash
	helper.begin("Hello")
	
	if image1:
		if helper.button("toggle demo window"):
			show_demo_window = !show_demo_window
		
		# use helper to provide default parameters
		helper.image(image1_id, image1.get_size())
	
	helper.end()
	
	if show_demo_window:
		helper.show_demo_window()
	
	imgui.render()
```

NOTE:

Only tested on Windows.
