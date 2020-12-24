extends Node

class_name ImGuiHelpers

const float_format:= "%.3f"
const int_format:= "%d"

const drag_speed:= 1.0
const float_min:= 0.0
const float_max:= 0.0
const int_min:= 0
const int_max:= 0
const drag_flags:= ImGuiConstants.slider_flags_none
const input_flags:= ImGuiConstants.input_text_flags_none
const color_options:= ImGuiConstants.color_edit_flags_options_default

const zero2: Vector2 = Vector2(0, 0)
const one2: Vector2 = Vector2(1, 1)
const black: Color = Color.black
const white: Color = Color.white

static func button(imgui: ImGui, label: String, size:= zero2):
	return imgui.button(label, size)
static func selectable(imgui: ImGui, label: String, is_selected: bool, flags:=ImGuiConstants.selectable_flags_none, size:=zero2):
	return imgui.selectable(label, is_selected, flags, size)

static func image(imgui: ImGui, tex_id: int, size:= zero2, uv0:= zero2, uv1:= one2, tint_color:= white, border_color:= black):
	imgui.image(tex_id, size, uv0, uv1, tint_color, border_color)

static func image_button(imgui: ImGui, tex_id: int, size:= zero2, uv0:= zero2, uv1:= one2, tint_color:= white, bg_color:= black):
	return imgui.image_button(tex_id, size, uv0, uv1, bg_color, tint_color, -1)

static func drag_float(imgui: ImGui, label: String, value: float, speed:=drag_speed, v_min:=float_min, v_max:=float_max, format:= float_format, flags:=drag_flags):
	return imgui.drag_float(label, value, speed, v_min, v_max, format, flags)
	
static func drag_float2(imgui: ImGui, label: String, value: Vector2, speed:=drag_speed, v_min:=float_min, v_max:=float_max, format:= float_format, flags:=drag_flags):
	return imgui.drag_float2(label, value, speed, v_min, v_max, format, flags)
	
static func drag_float3(imgui: ImGui, label: String, value: Vector3, speed:=drag_speed, v_min:=float_min, v_max:=float_max, format:= float_format, flags:=drag_flags):
	return imgui.drag_float3(label, value, speed, v_min, v_max, format, flags)

static func drag_int(imgui: ImGui, label: String, value: int, speed:=drag_speed, v_min:=int_min, v_max:=int_max, format:= int_format, flags:=drag_flags):
	return imgui.drag_int(label, value, speed, v_min, v_max, format, flags)

static func drag_int2(imgui: ImGui, label: String, value: PoolIntArray, speed:=drag_speed, v_min:=int_min, v_max:=int_max, format:= int_format, flags:=drag_flags):
	return imgui.drag_int2(label, value, speed, v_min, v_max, format, flags)
	
static func drag_int3(imgui: ImGui, label: String, value: PoolIntArray, speed:=drag_speed, v_min:=int_min, v_max:=int_max, format: = int_format, flags:=drag_flags):
	return imgui.drag_int3(label, value, speed, v_min, v_max, format, flags)

static func slider_float(imgui: ImGui, label: String, value: float, v_min:=float_min, v_max:=float_max, format:= float_format, flags:=drag_flags):
	return imgui.slider_float(label, value, v_min, v_max, format, flags)

static func slider_float2(imgui: ImGui, label: String, value: Vector2, v_min:=float_min, v_max:=float_max, format:= float_format, flags:=drag_flags):
	return imgui.slider_float2(label, value, v_min, v_max, format, flags)
	
static func slider_float3(imgui: ImGui, label: String, value: Vector2, v_min:=float_min, v_max:=float_max, format:= float_format, flags:int=drag_flags):
	return imgui.slider_float3(label, value, v_min, v_max, format, flags)

static func slider_int(imgui: ImGui, label: String, value: int, v_min:=int_min, v_max:=int_max, format:= int_format, flags:=drag_flags):
	return imgui.slider_int(label, value, v_min, v_max, format, flags)

static func slider_int2(imgui: ImGui, label: String, value: PoolIntArray, v_min:=int_min, v_max:=int_max, format:= int_format, flags:=drag_flags):
	return imgui.slider_int2(label, value, v_min, v_max, format, flags)
	
static func slider_int3(imgui: ImGui, label: String, value: PoolIntArray, v_min:=int_min, v_max:=int_max, format:= int_format, flags:=drag_flags):
	return imgui.slider_int3(label, value, v_min, v_max, format, flags)

static func slider_angle(imgui: ImGui, label: String, rad: float, v_min:=-360.0, v_max:=360.0, format:="%.0f deg", flags:= drag_flags):
	return imgui.slider_float(label, rad, v_min, v_max, format, flags)
	
static func v_slider_float(imgui: ImGui, label: String, size: Vector2, value: float, v_min:=float_min, v_max:=float_max, format:=float_format, flags:=drag_flags):
	return imgui.v_slider_float(label, size, value, v_min, v_max, format, flags)

static func v_slider_int(imgui: ImGui, label: String, size: Vector2, value: int, v_min:=int_min, v_max:=int_max, format:= int_format, flags:=drag_flags):
	return imgui.v_slider_int(label, size, value, v_min, v_max, format, flags)

static func input_float(imgui: ImGui, label: String, value: float, step:=float_min, step_fast:=float_min, format:= float_format, flags:=input_flags):
	return imgui.input_float(label, value, step, step_fast, format, flags)

static func input_float2(imgui: ImGui, label: String, value: Vector2, format: = float_format, flags:=input_flags):
	return imgui.input_float2(label, value, format, flags)

static func input_float3(imgui: ImGui, label: String, value: Vector3, format: = float_format, flags:=input_flags):
	return imgui.input_float3(label, value, format, flags)

static func input_int(imgui: ImGui, label: String, value: int, step:=int_min, step_fast:=int_min, flags:=input_flags):
	return imgui.input_int(label, value, step, step_fast, flags)
	
static func input_int2(imgui: ImGui, label: String, value: PoolIntArray, flags:=input_flags):
	return imgui.input_int2(label, value, flags)
	
static func input_int3(imgui: ImGui, label: String, value: PoolIntArray, flags:=input_flags):
	return imgui.input_int3(label, value, flags)

static func color_edit4(imgui: ImGui, label: String, color: Color, flags: = color_options):
	return imgui.color_edit4(label, color, flags)
	
static func color_picker4(imgui: ImGui, label: String, color: Color, flags: = color_options):
	return imgui.color_picker4(label, color, flags)

static func color_button(imgui: ImGui, desc_id: String, color: Color, flags: = color_options, size:= zero2):
	return imgui.color_button(desc_id, color, flags, size)
	
static func set_next_item_open(imgui: ImGui, is_open: bool, condition:= ImGuiConstants.gui_cond_none):
	imgui.set_next_item_open(is_open, condition)
	
static func collapsing_header(imgui: ImGui, label: String, flags:=ImGuiConstants.tree_node_flags_none):
	return imgui.collapsing_header(label, flags)
	
static func plot_lines(imgui: ImGui, label: String, values: PoolRealArray, value_offset:=0, overlay:="", scale_min:=0.1, scale_max:=100.0, size:=zero2, stride:=4):
	imgui.plot_lines(label, values, value_offset, overlay, scale_min, scale_max, size, stride)

static func plot_histogram(imgui: ImGui, label: String, values: PoolRealArray, value_offset:=0, overlay:="", scale_min:=0.1, scale_max:=100.0, size:=zero2, stride:=4):
	imgui.plot_histogram(label, values, value_offset, overlay, scale_min, scale_max, size, stride)

static func begin_child(imgui: ImGui, id: String, size:=zero2, border:=false, flags:=ImGuiConstants.window_flags_none):
	return imgui.begin_child(id, size, border, flags)
	
static func begin_table(imgui: ImGui, id: String, columns_count: int, flags:=ImGuiConstants.table_flags_none, outer_size:=zero2, inner_width:=0.0):
	return imgui.begin_table(id, columns_count, flags, outer_size, inner_width)
	
static func table_setup_column(imgui: ImGui, label: String, flags:=ImGuiConstants.table_column_flags_none, init_width_or_weight:=-1.0, user_id:=0):
	imgui.table_setup_column(label, flags, init_width_or_weight, user_id)
	
static func table_next_row(imgui: ImGui, row_flags:=ImGuiConstants.table_row_flags_none, min_row_height:=0.0):
	imgui.table_next_row(row_flags, min_row_height)
	
static func show_demo_window(imgui: ImGui):
	"""Show a demo window with features current supported."""
	pass
