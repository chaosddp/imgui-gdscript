class_name ImGuiHelper
extends Reference
# Wrapper for raw gdimgui native, provide convenient way to use imgui

# default parameters for widgets
const FLOAT_POSITIVE_MIN:= 1.175494351e-38
const FLOAT_FORMAT:= "%.3f"
const INT_FORMAT:= "%d"
const DRAG_SPEED:= 1.0
const DRAG_FLOAT_MIN:= 0.0
const DRAG_FLOAT_MAX:= 0.0
const DRAG_INT_MIN:= 0
const DRAG_INT_MAX:= 0

const ZERO2: Vector2 = Vector2(0, 0)
const ONE2: Vector2 = Vector2(1, 1)
const BLACK: Color = Color.black
const WHITE: Color = Color.white

# default flags for widgets
const DRAG_FLAGS:= ImGuiConstants.SLIDER_FLAGS_NONE
const INPUT_FLAGS:= ImGuiConstants.INPUT_TEXT_FLAGS_NONE
const COLOR_OPTIONS:= ImGuiConstants.COLOR_EDIT_FLAGS_OPTIONS_DEFAULT
const SELETABLE_FLAGS:= ImGuiConstants.SELECTABLE_FLAGS_NONE
const GUI_CONDITION:= ImGuiConstants.GUI_COND_NONE
const TREE_NODE_FLAGS:= ImGuiConstants.TREE_NODE_FLAGS_NONE
const WINDOW_FLAGS:= ImGuiConstants.WINDOW_FLAGS_NONE
const TABLE_FLAGS:= ImGuiConstants.TABLE_FLAGS_NONE
const TABLE_COLUMN_FLAGS:= ImGuiConstants.TABLE_COLUMN_FLAGS_NONE
const TABLE_ROW_FLAGS:= ImGuiConstants.TABLE_ROW_FLAGS_NONE

# style color
enum StyleColor {DARK, LIGHT, CLASSIC}

# target imgui instance, each instance maintains its own context.
var _imgui: ImGui

func _init(imgui: ImGui):
	_imgui = imgui
	
func render():
	_imgui.render()

func add_image(tex: Texture) -> int:
	"""add an image to imgui, and return an id, later we can use this id to show image, or image button"""
	return _imgui.add_image(tex)

func show_demo_window(is_open:=true, is_raw:=true) -> bool:
	if is_raw:
		return _imgui.show_demo_window(is_open)
	else:
		# TODO: create a demo window with gdscript that only contains features supported
		return false

func show_metrics_window(is_open: bool, is_raw:=true) -> bool:
	if is_raw:
		return _imgui.show_metrics_window(is_open)
	else:
		# TODO: gdscript metrics window
		return false
		
func show_about_window(is_open: bool) -> bool:
	return _imgui.show_about_window(is_open)

func style_color(color:=StyleColor.DARK) -> void:
	match color:
		StyleColor.DARK:
			_imgui.style_color_dark()
		StyleColor.LIGHT:
			_imgui.style_color_light()
		StyleColor.CLASSIC:
			_imgui.style_color_classic()

func new_frame() -> void:
	_imgui.new_frame()

func text_unformatted(text: String) -> void:
	_imgui.text_unformatted(text)
	
func text(text: String) -> void:
	_imgui.text(text)

func text_colored(color: Color, text: String) -> void:
	_imgui.text_colored(color, text)
	
func text_disabled(text: String) -> void:
	_imgui.text_disabled(text)
	
func label_text(label: String, text: String) -> void:
	_imgui.label_text(label, text)
	
func bullet_text(text: String) -> void:
	_imgui.bullet_text(text)

func small_button(label: String) -> bool:
	return _imgui.small_button(label)
	
func arrow_button(id: String, dir:=ImGuiConstants.dir_none) -> bool:
	return _imgui.arrow_button(id, dir)
	
func check_box(label: String, checked:=true) -> bool:
	return _imgui.checkbox(label, checked)

func radio_button(label: String, activated:=true) -> bool:
	return _imgui.radio_button(label, activated)

func progressbar(fraction: float, size:=Vector2(FLOAT_POSITIVE_MIN, 0), overlay: String="") -> void:
	_imgui.progressbar(fraction, size, overlay)

func bullet() -> void:
	_imgui.bullet()
	
func spacing() -> void:
	_imgui.spacing()
	
func dummy(size: Vector2) -> void:
	_imgui.dummy(size)
	
func newline() -> void:
	_imgui.newline()
	
func align_text_to_frame_padding() -> void:
	_imgui.align_text_to_frame_padding()
	
func separator() -> void:
	_imgui.separator()
	
func begin_combo(label: String, preview_value: String, flags:=ImGuiConstants.COMBO_FLAGS_NONE) -> bool:
	return _imgui.begin_combo(label, preview_value, flags)

func set_item_default_focus() -> void:
	_imgui.set_item_default_focus()
	
func button(label: String, size:=ZERO2) -> bool:
	return _imgui.button(label, size)

func selectable(label: String, is_selected: bool, flags:=SELETABLE_FLAGS, size:=ZERO2) -> bool:
	return _imgui.selectable(label, is_selected, flags, size)

func image(tex_id: int, size:=ZERO2, uv0:=ZERO2, uv1:=ONE2, tint_color:=WHITE, border_color:=BLACK) -> void:
	"""retrieve the tex_id with add_image method"""
	_imgui.image(tex_id, size, uv0, uv1, tint_color, border_color)

func image_button(tex_id: int, size:=ZERO2, uv0:=ZERO2, uv1:=ONE2, tint_color:=WHITE, bg_color:=BLACK) -> bool:
	return _imgui.image_button(tex_id, size, uv0, uv1, bg_color, tint_color, -1)

func drag_float(label: String, value: float, speed:=DRAG_SPEED, v_min:=DRAG_FLOAT_MIN, v_max:=DRAG_FLOAT_MAX, format:=FLOAT_FORMAT, flags:=DRAG_FLAGS) -> float:
	return _imgui.drag_float(label, value, speed, v_min, v_max, format, flags)
	
func drag_float2(label: String, value: Vector2, speed:=DRAG_SPEED, v_min:=DRAG_FLOAT_MIN, v_max:=DRAG_FLOAT_MAX, format:=FLOAT_FORMAT, flags:=DRAG_FLAGS) -> Vector2:
	return _imgui.drag_float2(label, value, speed, v_min, v_max, format, flags)
	
func drag_float3(label: String, value: Vector3, speed:=DRAG_SPEED, v_min:=DRAG_FLOAT_MIN, v_max:=DRAG_FLOAT_MAX, format:=FLOAT_FORMAT, flags:=DRAG_FLAGS) -> Vector3:
	return _imgui.drag_float3(label, value, speed, v_min, v_max, format, flags)

func drag_int(label: String, value: int, speed:=DRAG_SPEED, v_min:=DRAG_INT_MIN, v_max:=DRAG_INT_MAX, format:=INT_FORMAT, flags:=DRAG_FLAGS) -> int:
	return _imgui.drag_int(label, value, speed, v_min, v_max, format, flags)

func drag_int2(label: String, value: PoolIntArray, speed:=DRAG_SPEED, v_min:=DRAG_INT_MIN, v_max:=DRAG_INT_MAX, format:=INT_FORMAT, flags:=DRAG_FLAGS) -> PoolIntArray:
	"""value is a PoolIntArray instance with 2 elements to emulate int vector2"""
	return _imgui.drag_int2(label, value, speed, v_min, v_max, format, flags)
	
func drag_int3(label: String, value: PoolIntArray, speed:=DRAG_SPEED, v_min:=DRAG_INT_MIN, v_max:=DRAG_INT_MAX, format:=INT_FORMAT, flags:=DRAG_FLAGS) -> PoolIntArray:
	return _imgui.drag_int3(label, value, speed, v_min, v_max, format, flags)

func slider_float(label: String, value: float, v_min:=DRAG_FLOAT_MIN, v_max:=DRAG_FLOAT_MAX, format:=FLOAT_FORMAT, flags:=DRAG_FLAGS) -> float:
	return _imgui.slider_float(label, value, v_min, v_max, format, flags)

func slider_float2(label: String, value: Vector2, v_min:=DRAG_FLOAT_MIN, v_max:=DRAG_FLOAT_MAX, format:=FLOAT_FORMAT, flags:=DRAG_FLAGS) -> Vector2:
	return _imgui.slider_float2(label, value, v_min, v_max, format, flags)
	
func slider_float3(label: String, value: Vector2, v_min:=DRAG_FLOAT_MIN, v_max:=DRAG_FLOAT_MAX, format:=FLOAT_FORMAT, flags:int=DRAG_FLAGS) -> Vector3:
	return _imgui.slider_float3(label, value, v_min, v_max, format, flags)

func slider_int(label: String, value: int, v_min:=DRAG_INT_MIN, v_max:=DRAG_INT_MAX, format:=INT_FORMAT, flags:=DRAG_FLAGS) -> int:
	return _imgui.slider_int(label, value, v_min, v_max, format, flags)

func slider_int2(label: String, value: PoolIntArray, v_min:=DRAG_INT_MIN, v_max:=DRAG_INT_MAX, format:=INT_FORMAT, flags:=DRAG_FLAGS) -> PoolIntArray:
	return _imgui.slider_int2(label, value, v_min, v_max, format, flags)
	
func slider_int3(label: String, value: PoolIntArray, v_min:=DRAG_INT_MIN, v_max:=DRAG_INT_MAX, format:=INT_FORMAT, flags:=DRAG_FLAGS) -> PoolIntArray:
	return _imgui.slider_int3(label, value, v_min, v_max, format, flags)

func slider_angle(label: String, rad: float, v_min:=-360.0, v_max:=360.0, format:="%.0f deg", flags:=DRAG_FLAGS) -> float:
	return _imgui.slider_float(label, rad, v_min, v_max, format, flags)
	
func v_slider_float(label: String, size: Vector2, value: float, v_min:=DRAG_FLOAT_MIN, v_max:=DRAG_FLOAT_MAX, format:=FLOAT_FORMAT, flags:=DRAG_FLAGS) -> float:
	return _imgui.v_slider_float(label, size, value, v_min, v_max, format, flags)

func v_slider_int(label: String, size: Vector2, value: int, v_min:=DRAG_INT_MIN, v_max:=DRAG_INT_MAX, format:=INT_FORMAT, flags:=DRAG_FLAGS) -> int:
	return _imgui.v_slider_int(label, size, value, v_min, v_max, format, flags)

func input_float(label: String, value: float, step:=DRAG_FLOAT_MIN, step_fast:=DRAG_FLOAT_MIN, format:=FLOAT_FORMAT, flags:=INPUT_FLAGS) -> float:
	return _imgui.input_float(label, value, step, step_fast, format, flags)

func input_float2(label: String, value: Vector2, format:=FLOAT_FORMAT, flags:=INPUT_FLAGS) -> Vector2:
	return _imgui.input_float2(label, value, format, flags)

func input_float3(label: String, value: Vector3, format:=FLOAT_FORMAT, flags:=INPUT_FLAGS) -> Vector3:
	return _imgui.input_float3(label, value, format, flags)

func input_int(label: String, value: int, step:=DRAG_INT_MIN, step_fast:=DRAG_INT_MIN, flags:=INPUT_FLAGS) -> int:
	return _imgui.input_int(label, value, step, step_fast, flags)
	
func input_int2(label: String, value: PoolIntArray, flags:=INPUT_FLAGS) -> PoolIntArray:
	return _imgui.input_int2(label, value, flags)
	
func input_int3(label: String, value: PoolIntArray, flags:=INPUT_FLAGS) -> PoolIntArray:
	return _imgui.input_int3(label, value, flags)

func input_text(label: String, value: String, max_length: int, flags:=ImGuiConstants.INPUT_TEXT_FLAGS_NONE) -> String:
	return _imgui.input_text(label, value, max_length, flags)

func input_text_multipleline(label: String, value: String, max_length: int, size:=ZERO2, flags:=ImGuiConstants.INPUT_TEXT_FLAGS_NONE) -> String:
	return _imgui.input_text_multipleline(label, value, max_length, size, flags)
	
func color_edit4(label: String, color: Color, flags:=COLOR_OPTIONS) -> Color:
	return _imgui.color_edit4(label, color, flags)
	
func color_picker4(label: String, color: Color, flags:=COLOR_OPTIONS) -> Color:
	return _imgui.color_picker4(label, color, flags)

func color_button(desc_id: String, color: Color, flags:=COLOR_OPTIONS, size:=ZERO2) -> bool:
	return _imgui.color_button(desc_id, color, flags, size)
	
func set_color_edit_options(flags:=ImGuiConstants.COLOR_EDIT_FLAGS_NONE) -> void:
	_imgui.set_color_edit_options(flags)
	
func set_next_item_open(is_open: bool, condition:=ImGuiConstants.GUI_COND_NONE) -> void:
	_imgui.set_next_item_open(is_open, condition)
	
	
func plot_lines(label: String, values: PoolRealArray, value_offset:=0, overlay:="", scale_min:=0.1, scale_max:=100.0, size:=ZERO2, stride:=4) -> void:
	_imgui.plot_lines(label, values, value_offset, overlay, scale_min, scale_max, size, stride)

func plot_histogram(label: String, values: PoolRealArray, value_offset:=0, overlay:="", scale_min:=0.1, scale_max:=100.0, size:=ZERO2, stride:=4) -> void:
	_imgui.plot_histogram(label, values, value_offset, overlay, scale_min, scale_max, size, stride)
	
func tree_node(label: String) -> bool:
	return _imgui.tree_node(label)
	
func tree_pop() -> void:
	_imgui.tree_pop()
	
func get_tree_node_to_label_spacing() -> float:
	return _imgui.get_tree_node_to_label_spacing()
	
func collapsing_header(label: String, flags:=ImGuiConstants.TREE_NODE_FLAGS_NONE) -> bool:
	return _imgui.collapsing_header(label, flags)

func listbox_header(label: String, size:=ZERO2) -> bool:
	return _imgui.listbox_header(label, size)
	
func listbox_footer() -> void:
	_imgui.listbox_footer()
	
func begin_menu_bar() -> bool:
	return _imgui.begin_menu_bar()
	
func end_menu_bar() -> void:
	_imgui.end_menu_bar()
	
func begin_main_menu_bar() -> bool:
	return _imgui.begin_main_menu_bar()
	
func end_main_menu_bar() -> void:
	_imgui.end_main_menu_bar()
	
func begin_menu(label: String, enabled:=true) -> bool:
	return _imgui.begin_menu(label, enabled)
	
func end_menu() -> void:
	_imgui.end_menu()
	
func menu_item(label: String, shortcut:="", selected:=false, enabled:=true) -> bool:
	return _imgui.menu_item(label, shortcut, selected, enabled)
	
func begin_tab_bar(id: String, flags:=ImGuiConstants.TAB_BAR_FLAGS_NONE) -> bool:
	return _imgui.begin_tab_bar(id, flags)
	
func end_tab_bar() -> void:
	_imgui.end_tab_bar()
	
func begin_tab_item(label: String, open:=false, flags:=ImGuiConstants.TAB_ITEM_FLAGS_NONE) -> bool:
	return _imgui.begin_tab_item(label, open, flags)
	
func end_tab_item() -> void:
	_imgui.end_tab_item()
	
func tab_item_button(label: String, flags:=ImGuiConstants.TAB_ITEM_FLAGS_NONE) -> bool:
	return _imgui.tab_item_button(label, flags)
	
func set_tab_item_closed(label: String) -> void:
	_imgui.set_tab_item_closed(label)
	
func begin_table(id: String, columns_count: int, flags:=ImGuiConstants.TABLE_FLAGS_NONE, outer_size:=ZERO2, inner_width:=0.0) -> bool:
	return _imgui.begin_table(id, columns_count, flags, outer_size, inner_width)
	
func end_table() -> void:
	_imgui.end_table()

func table_setup_column(label: String, flags:=ImGuiConstants.TABLE_COLUMN_FLAGS_NONE, init_width_or_weight:=-1.0, user_id:=0) -> void:
	_imgui.table_setup_column(label, flags, init_width_or_weight, user_id)
	
func table_next_row(row_flags:=ImGuiConstants.TABLE_ROW_FLAGS_NONE, min_row_height:=0.0) -> void:
	_imgui.table_next_row(row_flags, min_row_height)	

func table_setup_scroll_freeze(columns: int, rows: int) -> void:
	_imgui.table_setup_scroll_freeze(columns, rows)
	
func table_set_bg_color(target: int, color: Color, column_n: int) -> void:
	_imgui.table_set_bg_color(target, color, column_n)
	
func table_get_row_index() -> int:
	return _imgui.table_get_row_index()
	
func table_set_column_index(column_n: int) -> bool:
	return _imgui.table_set_column_index(column_n)
	
func table_next_column() -> void:
	_imgui.table_next_column()

func table_headers_row() -> void:
	_imgui.table_headers_row()
	
func table_header(label: String) -> void:
	_imgui.table_header(label)
	
func get_column_index() -> int:
	return _imgui.get_column_index()
	
func get_columns_count() -> int:
	return _imgui.get_columns_count()
	
func get_column_offset(column_index: int) -> float:
	return _imgui.get_column_offset(column_index)
	
func get_column_width(column_index: int) -> float:
	return _imgui.get_column_width(column_index)
	
func set_column_width(column_index: int, width: float) -> void:
	_imgui.set_column_width(column_index, width)
	
func set_column_offset(column_index: int, offset: float) -> void:
	_imgui.set_column_offset(column_index, offset)
	
func get_content_region_avail() -> Vector2:
	return _imgui.get_content_region_avail()
	
func next_column() -> void:
	_imgui.next_column()
	
func columns(columns_count: int, id:="", border:=true) -> void:
	_imgui.columns(columns_count, id, border)

func set_clipboard_text(text: String) -> void:
	_imgui.set_clipboard_text(text)
	
func push_clip_rect(rect_min: Vector2, rect_max: Vector2, intersect_with_current_clip: bool) -> void:
	_imgui.push_clip_rect(rect_min, rect_max, intersect_with_current_clip)
	
func pop_clip_rect() -> void:
	_imgui.pop_clip_rect()
	
func calc_text_size(text: String, text_end:="", hide_text_after_double_has:=false, wrap_width:=0.0) -> Vector2:
	return _imgui.calc_text_size(text, text_end, hide_text_after_double_has, wrap_width)
	
func is_mouse_hovering_rect(r_min: Vector2, r_max: Vector2, clip: bool) -> bool:
	return _imgui.is_mouse_hovering_rect(r_min, r_max, clip)
	
func begin_child(id: String, size:=ZERO2, border:=false, flags:=ImGuiConstants.WINDOW_FLAGS_NONE) -> bool:
	return _imgui.begin_child(id, size, border, flags)
	
func end_child() -> void:
	_imgui.end_child()
	
func begin_child_frame(id: int, size: Vector2, flags:=ImGuiConstants.WINDOW_FLAGS_NONE) -> bool:
	assert(id >= 0)
	return _imgui.begin_child_frame(id, size, flags)
	
func end_child_frame() -> void:
	_imgui.end_child_frame()
	
func push_button_repeat(repeat: bool) -> void:
	_imgui.push_button_repeat(repeat)
	
func pop_button_repeat() -> void:
	_imgui.pop_button_repeat()
	
func push_allow_keyboard_focus(allow_keyboard_focus: bool) -> void:
	_imgui.push_allow_keyboard_focus(allow_keyboard_focus)
	
func pop_allow_keyboard_focus() -> void:
	_imgui.pop_allow_keyboard_focus()
	
func set_window_size(name: String, size: Vector2, condition:=ImGuiConstants.GUI_COND_NONE) -> void:
	_imgui.set_window_size(name, size, condition)
	
func set_window_collapsed(name: String, collapsed: bool, condition:=ImGuiConstants.GUI_COND_NONE) -> void:
	_imgui.set_window_collapsed(name, collapsed, condition)
	
func set_window_focus(name: String) -> void:
	_imgui.set_window_focus(name)
	
func set_next_window_bg_alpha(alpha: float) -> void:
	_imgui.set_next_window_bg_alpha(alpha)
	
func set_window_font_scale(scale: float) -> void:
	_imgui.set_window_font_scale(scale)
	
func push_id(id: int) -> void:
	_imgui.push_id(id)
	
func pop_id() -> void:
	_imgui.pop_id()
	
func same_line(offset_from_start_x:=0.0, spacing_w:=0.0) -> void:
	_imgui.same_line(offset_from_start_x, spacing_w)
	
func indent(indent_w: float) -> void:
	_imgui.indent(indent_w)
	
func unindent(indent_w: float) -> void:
	_imgui.unindent(indent_w)
	
func set_next_item_width(item_width: float) -> void:
	_imgui.set_next_item_width(item_width)
	
func push_item_width(item_width: float) -> void:
	_imgui.push_item_width(item_width)
	
func pop_item_width() -> void:
	_imgui.pop_item_width()
	
func calc_item_width() -> float:
	return _imgui.calc_item_width()
	
func get_text_line_height() -> float:
	return _imgui.get_text_line_height()
	
func get_text_line_height_with_spacing() -> float:
	return _imgui.get_text_line_height_with_spacing()
	
func get_frame_height() -> float:
	return _imgui.get_frame_height()
	
func get_frame_height_with_spacing() -> float:
	return _imgui.get_frame_height_with_spacing()
	
func begin_group() -> void:
	_imgui.begin_group()
	
func end_group() -> void:
	_imgui.end_group()
	
func is_popup_open(id: String, flags:=ImGuiConstants.POPUP_FLAGS_NONE) -> bool:
	return _imgui.is_popup_open(id, flags)
	
func open_popup(id: String, flags:=ImGuiConstants.POPUP_FLAGS_NONE) -> void:
	_imgui.open_popup(id, flags)
	
func close_current_popup() -> void:
	_imgui.close_current_popup()
	
func begin_popup(id: String, flags:=ImGuiConstants.WINDOW_FLAGS_NONE) -> bool:
	return _imgui.begin_popup(id, flags)
	
func begin_popup_modal(name: String, open:=true, flags:=ImGuiConstants.WINDOW_FLAGS_NONE) -> bool:
	return _imgui.begin_popup_modal(name, open, flags)
	
func end_popup() -> void:
	_imgui.end_popup()
	
func open_popup_on_item_click(id: String, flags:=ImGuiConstants.POPUP_FLAGS_NONE) -> void:
	_imgui.open_popup_on_item_click(id, flags)
	
func begin_popup_context_item(id: String, flags:=ImGuiConstants.POPUP_FLAGS_NONE) -> bool:
	return _imgui.begin_popup_context_item(id, flags)
	
func begin_popup_context_window(id: String, flags:=ImGuiConstants.POPUP_FLAGS_NONE) -> bool:
	return _imgui.begin_popup_context_window(id, flags)
	
func begin_popup_context_void(id: String, flags:=ImGuiConstants.POPUP_FLAGS_NONE) -> bool:
	return _imgui.begin_popup_context_void(id, flags)	
	
func log_text(text: String) -> void:
	_imgui.log_text(text)
	
func log_to_tty(auto_open_depth:=-1) -> void:
	_imgui.log_to_tty(auto_open_depth)
	
func log_to_file(auto_open_depth:=-1, file_name:="") -> void:
	_imgui.log_to_file(auto_open_depth, file_name)
	
func log_to_clipboard(auto_open_depth:=-1) -> void:
	_imgui.log_to_clipboard(auto_open_depth)
	
func log_finish() -> void:
	_imgui.log_finish()
	
func log_buttons() -> void:
	_imgui.log_buttons()
	
func begin(name: String, is_open:=true, flags:=ImGuiConstants.WINDOW_FLAGS_NONE) -> bool:
	return _imgui.begin(name, is_open, flags)
	
func end() -> void:
	_imgui.end()
	
func begin_tooltip() -> void:
	_imgui.begin_tooltip()
	
func end_tooltip() -> void:
	_imgui.end_tooltip()
	
func push_text_wrap_pos(pos_x: float) -> void:
	_imgui.push_text_wrap_pos(pos_x)
	
func pop_text_wrap_pos() -> void:
	_imgui.pop_text_wrap_pos()
	
func get_font_size() -> float:
	return _imgui.get_font_size()
	
func is_item_hovered() -> bool:
	return _imgui.is_item_hovered()
