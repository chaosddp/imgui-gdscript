extends Node

class_name ImGuiConstants

# flags to create a new window
const window_flags_none:= 0
const window_flags_no_title_bar:= 1 << 0
const window_flags_no_resize:= 1 << 1
const window_flags_no_move:= 1 << 2
const window_flags_no_scrollbar:= 1 << 3
const window_flags_no_scroll_with_mouse:= 1 << 4
const window_flags_no_collapse:= 1 << 5
const window_flags_always_auto_resize:= 1 << 6
const window_flags_no_background:= 1 << 7
const window_flags_no_saved_settings:= 1 << 8
const window_flags_no_mouse_inputs:= 1 << 9
const window_flags_menubar:= 1 << 10
const window_flags_horizontal_scrollbar:= 1 << 11
const window_flags_no_focus_on_appearing:= 1 << 12
const window_flags_no_bring_to_front_on_focus:= 1 << 13
const window_flags_always_vertical_scrollbar:= 1 << 14
const window_flags_always_horizontal_scrollbar:= 1 << 15
const window_flags_always_use_window_padding:= 1 << 16
const window_flags_no_nav_inputs:= 1 << 18
const window_flags_no_nav_focus:= 1 << 19
const window_flags_unsaved_document:= 1 << 20
const window_flags_no_nav:= window_flags_no_nav_inputs | window_flags_no_nav_focus
const window_flags_no_decoration:= window_flags_no_title_bar | window_flags_no_resize | window_flags_no_scrollbar | window_flags_no_collapse
const window_flags_no_inputs:= window_flags_no_mouse_inputs | window_flags_no_nav_inputs | window_flags_no_nav

# dir flags, for array_button
const dir_none:= -1
const dir_left:= 0
const dir_right:= 1
const dir_up:= 2
const dir_down:= 3

# combo flags, used for begin_combo
const combo_flags_none:= 0
const combo_flags_popup_align_left:= 1 << 0
const combo_flags_height_small:= 1 << 1
const combo_flags_height_regular:= 1 << 2
const combo_flags_height_large:= 1 << 3
const combo_flags_height_largest:= 1 << 4
const combo_flags_no_arrow_button:= 1 << 5
const combo_flags_no_preview:= 1 << 6

# selectable flags
const selectable_flags_none:= 0
const selectable_flags_dont_close_popups:= 1 << 0
const selectable_flags_span_all_columns:= 1 << 1
const selectable_flags_allow_double_click:= 1 << 2
const selectable_flags_disabled:= 1 << 3
const selectable_flags_allow_item_overlap:= 1 << 4

# slider flag for drag_xxx
const slider_flags_none:= 0
const slider_flags_always_clamp:= 1 << 4
const slider_flags_logarithmic:= 1 << 5
const slider_flags_no_round_to_format:= 1 << 6

# input text flags, for input_xxx
const input_text_flags_none:= 0
const input_text_flags_chars_decimal:= 1 << 0
const input_text_flags_chars_hexadecimal:= 1 << 1
const input_text_flags_chars_Uppercase:= 1 << 2
const input_text_flags_chars_no_blank:= 1 << 3
const input_text_flags_auto_select_all:= 1 << 4
const input_text_flags_allow_tab_input:= 1 << 10
const input_text_flags_ctrl_enter_for_newline:= 1 << 11
const input_text_flags_no_horizontal_scroll:= 1 << 12
const input_text_flags_always_insert_mode:= 1 << 13
const input_text_flags_readonly:= 1 << 14
const input_text_flags_password:= 1 << 15
const input_text_flags_no_undo_redo:= 1 << 16
const inutt_text_flags_chars_scientific:= 1 << 17

# color edit flags
const color_edit_flags_none:= 0
const color_edit_flags_no_alpha:= 1 << 1
const color_edit_flags_no_picker:= 1 << 2
const color_edit_flags_no_options:= 1 << 3
const color_edit_flags_no_small_preview:= 1 << 4
const color_edit_flags_no_inputs:= 1 << 5
const color_edit_flags_no_tooltip:= 1 <<6
const color_edit_flags_no_label:= 1 << 7
const color_edit_flags_no_side_preview:= 1 << 8
const color_edit_flags_no_drag_drop:= 1 << 9
const color_edit_flags_no_border:= 1 << 10

const color_edit_flags_alpha_bar:= 1 << 16
const color_edit_flags_alpha_preview:= 1 << 17
const color_edit_flags_alpha_preview_half:= 1 << 18
const color_edit_flags_hdr:= 1 << 19
const color_edit_flags_display_rgb:= 1 << 20
const color_edit_flags_display_hsv:= 1 << 21
const color_edit_flags_display_hex:= 1 << 22
const color_edit_flags_uint8:= 1 << 23
const color_edit_flags_float:= 1 << 24
const color_edit_flags_picker_hue_bar:= 1 << 25
const color_edit_flags_picker_hue_wheel:= 1 << 26
const color_edit_flags_input_rgb:= 1 << 27
const color_edit_flags_input_hsv:= 1 << 28

const color_edit_flags_options_default:= color_edit_flags_uint8 | color_edit_flags_display_rgb | color_edit_flags_input_rgb | color_edit_flags_picker_hue_bar

# gui condition
const gui_cond_none: = 0
const gui_cond_always: = 1 << 0
const gui_cond_once: = 1 << 1
const gui_cond_first_use_ever: = 1 << 2
const gui_cond_appearing: = 1 << 3

# flags for tree node
const tree_node_flags_none: = 0
const tree_node_flags_selected: = 1 << 0
const tree_node_flags_framed: = 1 << 1
const tree_node_flags_allow_item_overlap: = 1 << 2
const tree_node_flags_no_tree_push_on_open: = 1 << 3
const tree_node_flags_no_auto_open_on_log: = 1 << 4
const tree_node_flags_default_open: = 1 << 5
const tree_node_flags_open_on_double_click: = 1 << 6
const tree_node_flags_open_on_arrow: = 1 << 7
const tree_node_flags_leaf: = 1 << 8
const tree_node_flags_bullet: = 1 << 9
const tree_node_flags_frame_padding: = 1 << 10
const tree_node_flags_span_avail_width: = 1 << 11
const tree_node_flags_span_full_width: = 1 << 12
const tree_node_flags_nav_left_jumps_back_here: = 1 << 13

const tree_node_flags_collapsing_header: = tree_node_flags_framed | tree_node_flags_no_tree_push_on_open | tree_node_flags_no_auto_open_on_log

# tabbar
const tab_bar_flags_none: = 0
const tab_bar_flags_reorderable: = 1 << 0
const tab_bar_flags_auto_select_new_tab: = 1 << 1
const tab_bar_flags_tab_list_popup_button: = 1 << 2
const tab_bar_flags_no_closed_with_middle_mouse_button: = 1 << 3
const tab_bar_flags_no_tab_list_scrolling_buttons: = 1 << 4
const tab_bar_flags_no_tooltip: = 1 << 5
const tab_bar_flags_fitting_policy_resize_down: = 1 << 6
const tab_bar_flags_fitting_policy_scroll: = 1 << 7

# tab item
const tab_item_flags_none: = 0
const tab_item_flags_unsaved_document: = 1 << 0
const tab_item_flags_set_selected: = 1 << 1
const tab_item_flags_no_close_with_middle_mouse_button: = 1 << 2
const tab_item_flags_no_push_id: = 1 << 3
const tab_item_flags_no_tooltip: = 1 << 4
const tab_item_flags_no_recorder: = 1 << 5
const tab_item_flags_leading: = 1 << 6
const tab_item_flags_trailing: = 1 << 7

# popup flags
const popup_flags_none: = 0
const popup_flags_mouse_button_left: = 1 << 0
const popup_flags_mouse_button_right: = 1 << 1
const popup_flags_mouse_button_middle: = 1 << 2
const popup_flags_no_open_over_existing_popup: = 1 << 5
const popup_flags_no_open_over_items: = 1 << 6
const popup_flags_any_popup_id: = 1 << 7
const popup_flags_any_popup_level: = 1 << 8

# table flags for begin_table
const table_flags_none: = 0
const table_flags_resizable: = 1 << 0
const table_flags_reorderable: = 1 << 1
const table_flags_hidable: = 1 << 2
const table_flags_sortabl: = 1 << 3
const table_flags_no_saved_settings: = 1 << 4
const table_flags_context_menu_in_body: = 1 << 5
const table_flags_row_bg: = 1 << 6
const table_flags_borders_inner_h: = 1 << 7
const table_flags_borders_outer_h: = 1 << 8
const table_flags_borders_inner_v: = 1 << 9
const table_flags_borders_outer_v: = 1 << 10
const table_flags_borders_h: = table_flags_borders_inner_h | table_flags_borders_outer_h
const table_flags_borders_v: = table_flags_borders_inner_v | table_flags_borders_outer_v
const table_flags_borders_inner: = table_flags_borders_inner_h | table_flags_borders_inner_v
const table_flags_borders_outer: = table_flags_borders_outer_h | table_flags_borders_outer_v
const table_flags_borders: = table_flags_borders_inner | table_flags_borders_outer
const table_flags_no_borders_in_body: = 1 << 11
const table_flags_no_borders_in_body_util_resize: = 1 << 12
const table_flags_columns_width_stretch: = 1 << 13
const table_flags_columns_width_fixed: = 1 << 14
const table_flags_same_widths: = 1 << 15
const table_flags_no_host_extend_y: = 1 << 17
const table_flags_no_keep_columns_visible: = 1 << 18
const table_flags_precised_widths: = 1 << 19
const table_flags_no_clip: = 1 << 20
const table_flags_pad_outer_x: = 1 << 21
const table_flags_no_pad_outer_x: = 1 << 22
const table_flags_no_pad_intter_x: = 1 << 23
const table_flags_scroll_x: = 1 << 24
const table_flags_scroll_y: = 1 << 25
const table_flags_sort_multi: = 1 << 26
const table_flags_sort_tristate: = 1 << 27

# table background color
const table_bg_target_none: = 0
const table_bg_target_row_bg_0: = 1
const table_bg_target_row_bg_1: = 2
const table_bg_target_cell_bg: = 3

# table row flags, for table_next_row
const table_row_flags_none: = 0
const table_row_flags_headers: = 1 << 0

# table column flags, for table_setup_column
const table_column_flags_none: = 0
const table_column_flags_default_hide: = 1 << 0
const table_column_flags_default_sort: = 1 << 1
const table_column_flags_width_stretch: = 1 << 2
const table_column_flags_width_fixed: = 1 << 3
const table_column_flags_width_auto_resize: = 1 << 4
const table_column_flags_no_resize: = 1 << 5
const table_column_flags_no_reorder: = 1 << 6
const table_column_flags_no_hide: = 1 << 7
const table_column_flags_no_clip: = 1 << 8
const table_column_flags_no_sort: = 1 << 9
const table_column_flags_no_sort_ascending: = 1 << 10
const table_column_flags_no_sort_descending: = 1 << 11
const table_column_flags_no_header_width: = 1 << 12
const table_column_flags_prefer_sort_ascending: = 1 << 13
const table_column_flags_prefer_sort_descending: = 1 << 14
const table_column_flags_indent_enable: = 1 << 15
const table_column_flags_indent_disable: = 1 << 16

const table_column_flags_is_enabled: = 1 << 20
const table_column_flags_is_visible: = 1 << 21
const table_column_flags_is_sorted: = 1 << 22
const table_column_flags_is_hovered: = 1 << 23
