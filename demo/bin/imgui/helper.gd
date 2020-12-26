class_name ImGuiHelper
extends Reference
# Wrapper for raw gdimgui native, provide convenient way to use imgui

# default parameters for widgets
const FLOAT_POSITIVE_MIN:= 1.175494351e-38
const FLOAT_MAX:= 3.402823466e+38
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
		return _show_demo_window(is_open)

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

func get_version() -> String:
	return _imgui.get_version()

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
	
func checkbox(label: String, checked:=true) -> bool:
	return _imgui.checkbox(label, checked)

func checkbox_flags(label: String, flags: int, flag_value: int) -> int:
	return _imgui.checkbox_flags(label, flags, flag_value)

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

func end_combo() -> void:
	_imgui.end_combo()

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

func input_text_with_hint(label: String, hint: String, value: String, max_length: int, flags:=ImGuiConstants.INPUT_TEXT_FLAGS_NONE) -> String:
	return _imgui.input_text_with_hint(label, hint, value, max_length, flags)

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
	
	
func plot_lines(label: String, values: PoolRealArray, value_offset:=0, overlay:="", scale_min:=FLOAT_POSITIVE_MIN, scale_max:=FLOAT_MAX, size:=ZERO2, stride:=4) -> void:
	_imgui.plot_lines(label, values, value_offset, overlay, scale_min, scale_max, size, stride)

func plot_histogram(label: String, values: PoolRealArray, value_offset:=0, overlay:="", scale_min:=0.1, scale_max:=100.0, size:=ZERO2, stride:=4) -> void:
	_imgui.plot_histogram(label, values, value_offset, overlay, scale_min, scale_max, size, stride)
	
func tree_node(label: String) -> bool:
	return _imgui.tree_node(label)

func tree_node_ex(id: int, flags: int, label: String) -> bool:
	return _imgui.tree_node_ex(id, flags, label);
	
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

func set_next_window_pos(pos: Vector2, condition:=ImGuiConstants.GUI_COND_NONE, pivot:=ZERO2) -> void:
	_imgui.set_next_window_pos(pos, condition, pivot)

func set_next_window_size(size: Vector2, condition:=ImGuiConstants.GUI_COND_NONE) -> void:
	_imgui.set_next_window_size(size, condition)

func set_next_window_bg_alpha(alpha: float) -> void:
	_imgui.set_next_window_bg_alpha(alpha)
	
func set_window_font_scale(scale: float) -> void:
	_imgui.set_window_font_scale(scale)
	
func push_id(id: int) -> void:
	_imgui.push_id(id)
	
func pop_id() -> void:
	_imgui.pop_id()
	
func same_line(offset_from_start_x:=0.0, spacing_w:=-1.0) -> void:
	_imgui.same_line(offset_from_start_x, spacing_w)
	
func indent(indent_w:=12.0) -> void:
	_imgui.indent(indent_w)
	
func unindent(indent_w:=12.0) -> void:
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

func is_item_clicked(button:= ImGuiConstants.MOUSE_BUTTON_LEFT) -> bool:
	return _imgui.is_item_clicked(button)

func is_item_activated() -> bool:
	return _imgui.is_item_activated()

func is_item_active() -> bool:
	return _imgui.is_item_active()

func is_item_edited() -> bool:
	return _imgui.is_item_edited()

func is_item_focused() -> bool:
	return _imgui.is_item_focused()

func is_item_visible() -> bool:
	return _imgui.is_item_visible()

func push_style_color(index: int, color: Color) -> void:
	_imgui.push_style_color(index, color)

func pop_style_color(count: int) -> void:
	_imgui.pop_style_color(count)

func set_tooltip(text: String) -> void:
	_imgui.set_tooltip(text)

"""
DEMO WINDOW with exist features
"""

# variables for demo window
var _is_show_app_main_menu_bar:= false
var _is_show_app_documents:= false
var _is_show_app_console:= false
var _is_show_app_log:= false
var _is_show_app_layout:= false
var _is_show_app_long_text:= false
var _is_show_app_property_editor:= false
var _is_show_app_auto_resize:= false
var _is_show_app_constrained_resize:= false
var _is_show_app_simple_overlay:= false
var _is_show_app_window_titles:= false
var _is_show_app_custom_rendering:= false

# sub windows
var _is_show_metrics:= false
var _is_show_app_about:= false

var _no_titlebar:= false
var _no_scrollbar:= false
var _no_menu:= false
var _no_move:= false
var _no_resize:= false
var _no_collapse:= false
var _no_close:= false
var _no_background:= false
var _no_bring_to_front:= false

func _show_demo_window(is_open:=true) -> bool:

	if _is_show_app_main_menu_bar:
		_show_example_app_main_menu_bar()
		
	if _is_show_app_documents:
		_show_app_document()

	if _is_show_app_console:
		_show_app_console()

	if _is_show_app_log:
		_show_app_log()

	if _is_show_app_layout:
		_show_app_layout()

	if _is_show_app_property_editor:
		_show_app_property_editor()

	if _is_show_app_long_text:
		_show_app_long_text()

	if _is_show_app_auto_resize:
		_show_app_auto_resize()

	if _is_show_app_constrained_resize:
		_show_app_constrained_resize()

	if _is_show_app_simple_overlay:
		_show_app_simple_overlay()

	if _is_show_app_window_titles:
		_show_app_window_titles()

	if _is_show_app_custom_rendering:
		_show_app_custom_rendering()

	if _is_show_metrics:
		_is_show_metrics = _show_metrics_window(_is_show_metrics)

	if _is_show_app_about:
		_is_show_app_about = _show_about_window(_is_show_app_about)

	var window_flags:= 0

	if _no_titlebar:
		window_flags |= ImGuiConstants.WINDOW_FLAGS_NO_TITLE_BAR

	if _no_scrollbar:
		window_flags |= ImGuiConstants.WINDOW_FLAGS_NO_SCROLLBAR

	if not _no_menu:
		window_flags |= ImGuiConstants.WINDOW_FLAGS_MENUBAR
		
	if _no_move:
		window_flags |= ImGuiConstants.WINDOW_FLAGS_NO_MOVE

	if _no_resize:
		window_flags |= ImGuiConstants.WINDOW_FLAGS_NO_RESIZE

	if _no_collapse:
		window_flags |= ImGuiConstants.WINDOW_FLAGS_NO_COLLAPSE

	if _no_background:
		window_flags |= ImGuiConstants.WINDOW_FLAGS_NO_BACKGROUND

	if _no_bring_to_front:
		window_flags |= ImGuiConstants.WINDOW_FLAGS_NO_BRING_TO_FRONT_ON_FOCUS

	if _no_close:
		pass

	set_next_window_pos(Vector2(20, 20), ImGuiConstants.GUI_COND_FIRST_USE_EVER)
	set_next_window_size(Vector2(550, 680), ImGuiConstants.GUI_COND_FIRST_USE_EVER)

	if not begin("Dear ImGi Demo", is_open, window_flags):
		end()

		return is_open

	push_item_width(get_font_size() * - 12)

	if begin_menu_bar():
		if begin_menu("Menu"):
			_show_example_menu_file()
			end_menu()
		
		if begin_menu("Examples"):
			_is_show_app_main_menu_bar = menu_item("Main menu item", "", _is_show_app_main_menu_bar)
			_is_show_app_console = menu_item("Console", "", _is_show_app_console)
			_is_show_app_log = menu_item("Log", "", _is_show_app_log)
			_is_show_app_layout = menu_item("Simple layot", "", _is_show_app_layout)
			_is_show_app_property_editor = menu_item("Property editor", "", _is_show_app_property_editor)
			_is_show_app_long_text = menu_item("Long text display", "", _is_show_app_long_text)
			_is_show_app_auto_resize = menu_item("Auto-resizing window", "", _is_show_app_auto_resize)
			_is_show_app_constrained_resize = menu_item("Constrained-resizing window", "", _is_show_app_constrained_resize)
			_is_show_app_simple_overlay = menu_item("Simple overlay", "", _is_show_app_simple_overlay)
			_is_show_app_window_titles = menu_item("Manipulating window titles", "", _is_show_app_window_titles)
			_is_show_app_custom_rendering = menu_item("Custom rendering", "", _is_show_app_custom_rendering)
			_is_show_app_documents = menu_item("Documents", "", _is_show_app_documents)

			end_menu()

		if begin_menu("Tools"):
			_is_show_metrics = menu_item("Metrics/Debugger", "", _is_show_metrics)
			_is_show_app_about = menu_item("About Dear ImGui", "", _is_show_app_about)

			end_menu()
			
		end_menu_bar()

	text("dear imgui says hello. %s" % get_version())
	spacing()

	if collapsing_header("Hello"):
		text("ABOUT THIS DEMO:")
		bullet_text("Sections below are demonstrating many aspects of the library.")
		bullet_text('The "Examples" menu above leads to more demo contents.')
		bullet_text("""The "Tools" menu above gives access to: About Box, Style Editor,
and Metrics/Debugger (general purpose Dear ImGui debugging tool).""")

		separator()

		text("PROGRAMMER GUIDE:")
		bullet_text("See the _show_demo_window() code in helper.gd to see supported features.")
		bullet_text("Read the FAQ at http://www.dearimgui.org/faq/")

		separator()

		text("USER GUIDE:")
		_show_user_guide()


	if collapsing_header("Capture/Logging"):
		helper_marker("""The logging API redirects all text output so you can easily capture the content of a window or a block. Tree nodes can be automatically expanded.
Try opening any of the contents below in this window and then click one of the "Log To" button.""")
		
		log_buttons()

		helper_marker("You can also call log_text() to output directly to the log without a visual output.")

		if button("""Copy "Hello, world!" to clipboard"""):
			log_to_clipboard()
			log_text("Hello, world!")
			log_finish()


	if collapsing_header("Window options"):
		if begin_table("split", 3):
			table_next_column()
			_no_titlebar = checkbox("No titlebar", _no_titlebar)

			table_next_column()
			_no_scrollbar = checkbox("No scrollbarl", _no_scrollbar)

			table_next_column()
			_no_menu = checkbox("No menu", _no_menu)

			table_next_column()
			_no_move = checkbox("No move", _no_move)

			table_next_column()
			_no_resize = checkbox("No resize", _no_resize)

			table_next_column()
			_no_collapse = checkbox("No collapse", _no_collapse)

			table_next_column()
			_no_close = checkbox("No close", _no_close)

			table_next_column()
			_no_background = checkbox("No background", _no_background)

			table_next_column()
			_no_bring_to_front = checkbox("No bring to front", _no_bring_to_front)

			end_table()
	
	_show_demo_window_widgets()
	_show_demo_window_layout()
	_show_demo_window_popup()
	_show_demo_window_tables()
	_show_demo_window_misc()

	pop_item_width()
	end()

	return is_open

func helper_marker(desc: String) -> void:
	text_disabled("(?)")

	if is_item_hovered():
		begin_tooltip()
		push_text_wrap_pos(get_font_size() * 35.0)
		text_unformatted(desc)
		pop_text_wrap_pos()
		end_tooltip()

func _show_metrics_window(is_open: bool) -> bool:
	return false

func _show_about_window(is_open: bool) -> bool:
	return false

func _show_user_guide() -> void:
	bullet_text("Double-click on title bar to collapse window.")
	bullet_text("Click and drag on lower corner to resize window")
	bullet_text("CTRL+Click on a slider or drag box to input value as text.")
	bullet_text("TAB/SHIFT+TAB to cycle through keyboard editable fields.")

	bullet_text("While inputing text:\n")
	indent()
	bullet_text("CTRL+Left/Right to word jump.")
	bullet_text("CTRL+A or double-click to select all.")
	bullet_text("CTRL+X/C/V to use clipboard cut/copy/paste.")
	bullet_text("CTRL+Z,CTRL+Y to undo/redo.")
	bullet_text("You can apply arithmetic operators +,*,/ on numerical values.\nUse +- to subtract.")
	unindent()

func _show_example_app_main_menu_bar() -> void:
	pass

func _show_app_document() -> void:
	pass

func _show_app_console() -> void:
	pass

func _show_app_log() -> void:
	pass

func _show_app_layout() -> void:
	pass

func _show_app_property_editor() -> void:
	pass

func _show_app_long_text() -> void:
	pass

func _show_app_auto_resize() -> void:
	pass

func _show_app_constrained_resize() -> void:
	pass

func _show_app_simple_overlay() -> void:
	pass

func _show_app_window_titles() -> void:
	pass

func _show_app_custom_rendering() -> void:
	pass

func _show_example_menu_file() -> void:
	pass

# variables to hold states for demo
var _demo_clicked:= 0
var _demo_checked:= true
var _demo_e:= 0
var _demo_counter:= 0
var _demo_combo_selected_index:= 0
var _demo_str0:= "Hello, world!"
var _demo_str1:= ""
var _demo_i0:= 123
var _demo_f0:= 0.001
var _demo_d0:= 999999.00000001
var _demo_f1:= 1.e10
var _demo_vec3a:= Vector3(0.10, 0.20, 0.30)
var _demo_i1:= 50
var _demo_i2:= 42
var _demo_f2:= 0.0067
var _demo_angle:= 0.0
var _demo_elem:= 0
const _demo_elems_names:= ["Fire", "Earth", "Air", "Water"]
var _demo_col1:= Color(1.0, 0.0, 0.2, 1.0)
var _demo_col2:= Color(0.4, 0.7, 0.0, 0.5)
const _demo_items:= ["Apple", "Banana", "Cherry", "Kiwi", "Mango", "Orange", "Pineapple", "Strawberry", "Watermelon"]
var _demo_item_current:= 1
var _demo_base_flags:= ImGuiConstants.TREE_NODE_FLAGS_OPEN_ON_DOUBLE_CLICK | ImGuiConstants.TREE_NODE_FLAGS_OPEN_ON_ARROW | ImGuiConstants.TREE_NODE_FLAGS_SPAN_AVAIL_WIDTH
var _demo_align_label_with_current_x_position:= false
var _demo_selection_mask:= 1 << 2

func _show_demo_window_widgets() -> void:
	if not collapsing_header("Widgets"):
		return

	if tree_node("Basic"):
		if button("Button"):
			_demo_clicked += 1
		
		if _demo_clicked & 1:
			same_line()
			text("Thanks for clikcing me!")
		
		_demo_checked = checkbox("checkbox", _demo_checked)

		# radio button group
		# we cannot use reference to hold the value as c++ version, so use actualy value to
		# identify if a radio button should be activated
		if radio_button("radio a", _demo_e==0):
			_demo_e = 0
		
		same_line()

		if radio_button("radio b", _demo_e==1):
			_demo_e = 1

		same_line()

		if radio_button("radio c", _demo_e==2):
			_demo_e = 2

		# color buttons
		for i in range(7):

			if i > 0:
				same_line()
			
			push_id(i)
			push_style_color(ImGuiConstants.GUI_COLOR_BUTTON, Color.from_hsv(i/7.0, 0.6, 0.6))
			push_style_color(ImGuiConstants.GUI_COLOR_BUTTON_HOVERED, Color.from_hsv(i/7.0, 0.7, 0.7))
			push_style_color(ImGuiConstants.GUI_COLOR_BUTTON_ACTIVE, Color.from_hsv(i/7.0, 0.8, 0.8))
			button("Click")
			pop_style_color(1)
			pop_id()

		align_text_to_frame_padding()
		text("Hold to repeat")
		same_line()

		# arrow buttons
		push_button_repeat(true)

		if arrow_button("##left", ImGuiConstants.DIR_LEFT):
			_demo_counter -= 1
		
		same_line()

		if arrow_button("##right", ImGuiConstants.DIR_RIGHT):
			_demo_counter += 1

		pop_button_repeat()
		same_line()
		text("%d" % _demo_counter)

		text("Hover over me")

		if is_item_hovered():
			set_tooltip("I am a tooltip")

		same_line()
		text("- or me")

		if is_item_hovered():
			begin_tooltip()
			text("I am a fancy tooltip")
			plot_lines("Curve", PoolRealArray([0.6, 0.1, 1.0, 0.5, 0.92, 0.1, 0.2]))
			end_tooltip()

		separator()

		label_text("label", "Value")

		var items:= ["AAAA", "BBBB", "CCCC", "DDDD"]

		# we have no combo function, we can use begin_combo, end_combo and selectable instead
		# DO NOTE: call end_combo only if begin_combo returns true
		if begin_combo("combo", items[_demo_combo_selected_index]):
			for i in range(len(items)):
				if selectable(items[i], i==_demo_combo_selected_index):
					_demo_combo_selected_index = i

			end_combo()
		same_line()
		helper_marker("""Refer to ImGuiContants.COMBO_FLAGS_ for various flags.\n""")
		
		# input text, max length 128
		_demo_str0 = input_text("input text", _demo_str0, 128)
		same_line()
		helper_marker("""
Hold SHIFT or use mouse to select text.
CTRL+Left/Right to word jump.
CTRL+A or double-click to select all.
CTRL+X,CTRL+C,CTRL+V clipboard.
CTRL+Z,CTRL+Y undo/redo.
		""")

		_demo_str1 = input_text_with_hint("input text (w/ hint)", "enter text here", _demo_str1, 128)

		# TODO: we do not support arithmetic operators +,*,/ on numerical value for now
		_demo_i0 = input_int("input int", _demo_i0)

		_demo_f0 = input_float("input float", _demo_f0, 0.01, 1.0, "%.3f")

		_demo_f1 = input_float("input scientific", _demo_f1, 0.0, 0.0, "%e")
		same_line()
		helper_marker("""You can input value using the scientific notation,\ne.g. "1e+8" becomes "100000000".""")

		# drag
		_demo_i1 = drag_int("drag it", _demo_i1, 1)
		same_line()
		helper_marker("""
Click and drag to edit value.
Hold SHIFT/ALT for faster/slower edit.
Double-click or CTRL+click to input value.
		""")

		_demo_i2 = drag_int("drag int 0..100", _demo_i2, 1, 0, 100, "%d%%", ImGuiConstants.SLIDER_FLAGS_ALWAYS_CLAMP)

		_demo_f1 = drag_float("drag float", _demo_f1, 0.005)
		_demo_f2 = drag_float("drag small float", _demo_f2, 0.0001, 0.0, 0.0, "%.06f ns")


		# slider
		_demo_i1 = slider_int("slider int", _demo_i1, -1, 3)
		same_line()
		helper_marker("CTRL+click to input value.")

		_demo_f1 = slider_float("slider float", _demo_f1, 0.0, 1.0, "ratio = %.3f")
		_demo_f2 = slider_float("slider float (log)", _demo_f2, -10.0, 10.0, "%.4f", ImGuiConstants.SLIDER_FLAGS_LOGARITHMIC)

		_demo_angle = slider_angle("slider angle", _demo_angle)

		_demo_elem = _demo_elem if _demo_elem < len(_demo_elems_names) else 0

		_demo_elem = slider_int("slider enum", _demo_elem, 0, len(_demo_elems_names) - 1, _demo_elems_names[_demo_elem])
		same_line()
		helper_marker("Using the format string parameter to display a name instead of the underlying integer.")


		# color, only edit4
		_demo_col1 = color_edit4("color 1", _demo_col1)
		same_line()
		helper_marker("""
Click on the color square to open a color picker.
Click and hold to use drag and drop.
Right-click on the color square to show options.
CTRL+click on individual component to input value.""")

		# listbox
		# NOTE: we do not have the listbox method to create a listbox
		if listbox_header("list box\n(single select)"):
			for i in range(len(_demo_items)):
				var item = _demo_items[i]

				if selectable(item, _demo_item_current == i):
					_demo_item_current = i

			listbox_footer()

		tree_pop()
	
	# trees
	if tree_node("Trees"):
		if tree_node("Basic trees"):
			for i in range(5):
				if i == 0:
					set_next_item_open(true, ImGuiConstants.GUI_COND_ONCE)

				if tree_node("Child %d" % i):
					text("blah blah")
					same_line()

					if small_button("button"):
						pass

					tree_pop()

		tree_pop()

	if tree_node("Advanced, with selectable nodes"):
		helper_marker("""This is a more typical looking tree with selectable nodes.
Click to select, CTRL+Click to toggle, click on arrows or double-click to open.""")

		_demo_base_flags = checkbox_flags("ImGuiTreeNodeFlags_OpenOnArrow", _demo_base_flags, ImGuiConstants.TREE_NODE_FLAGS_OPEN_ON_ARROW)
		_demo_base_flags = checkbox_flags("ImGuiTreeNodeFlags_OpenOnDoubleClick", _demo_base_flags, ImGuiConstants.TREE_NODE_FLAGS_OPEN_ON_DOUBLE_CLICK)
		_demo_base_flags = checkbox_flags("ImGuiTreeNodeFlags_SpanAvailWidth", _demo_base_flags, ImGuiConstants.TREE_NODE_FLAGS_SPAN_AVAIL_WIDTH)
		_demo_base_flags = checkbox_flags("ImGuiTreeNodeFlags_SpanFullWidth", _demo_base_flags, ImGuiConstants.TREE_NODE_FLAGS_SPAN_FULL_WIDTH)

		_demo_align_label_with_current_x_position = checkbox("Align label with current X position", _demo_align_label_with_current_x_position)

		if _demo_align_label_with_current_x_position:
			unindent(get_tree_node_to_label_spacing())

		var node_clicked:= -1

		for i in range(6):
			var node_flags = _demo_base_flags
			var is_selected = (_demo_selection_mask & (1 << i)) != 0

			if is_selected:
				node_flags |= ImGuiConstants.TREE_NODE_FLAGS_SELECTED
			
			if i < 3:
				var node_open:= tree_node_ex(i, node_flags, "Selectable Node %d" % i)

				if is_item_clicked():
					node_clicked = i
				
				if node_open:
					bullet_text("Blah blah\nBlah blah")
					tree_pop()
			else:
				node_flags |= ImGuiConstants.TREE_NODE_FLAGS_LEAF | ImGuiConstants.TREE_NODE_FLAGS_NO_TREE_PUSH_ON_OPEN

				tree_node_ex(i, node_flags, "Selectable Leaf %d" % i)

				if is_item_clicked():
					node_clicked = i

		if node_clicked != -1:
			# only single selected
			_demo_selection_mask = (1 << node_clicked)

		if _demo_align_label_with_current_x_position:
			indent(get_tree_node_to_label_spacing())

		tree_pop()

		tree_pop()

func _show_demo_window_layout() -> void:
	pass

func _show_demo_window_popup() -> void:
	pass

func _show_demo_window_tables() -> void:
	pass

func _show_demo_window_misc() -> void:
	pass
