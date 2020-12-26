#ifndef GDIMGUI_H
#define GDIMGUI_H



#include <Godot.hpp>
#include <CanvasItem.hpp>
#include <Image.hpp>
#include <ImageTexture.hpp>
#include <ArrayMesh.hpp>
#include <MeshInstance2D.hpp>
#include <VisualServer.hpp>
#include <Resource.hpp>
#include <Node2D.hpp>
#include <Input.hpp>
#include <InputEvent.hpp>
#include <SceneTree.hpp>
#include <InputEventMouseMotion.hpp>
#include <InputEventMouseButton.hpp>
#include <InputEventKey.hpp>
#include <Viewport.hpp>
#include <GlobalConstants.hpp>
#include <Texture.hpp>
#include <GodotGlobal.hpp>


#include <unordered_map>

#include "imgui.h"

using namespace godot;

class GDImGui : public Node2D
{
    GODOT_CLASS(GDImGui, Node2D);

    // imgui context for current instance
    ImGuiContext *_imgui_ctx;

    // global texture id for new added images
    static int texture_id;

    // current avaiable customized images
    std::unordered_map<int, Texture *> _textures;

    // used to hold value from checkbox
    bool _checkbox_v;
    bool _combo_is_last_selected;

    void gen_font_tex();
    void init_imgui();

    // custom image management
    int add_texture(Texture *tex);
    Texture *get_texture(int id);
    void remove_texture(int id);

    // make sure the root exist
    void ensure_root();

public:
    static void _register_methods();

    GDImGui();
    ~GDImGui();

    void _init(); // our initializer called by Godot

    void _input(Ref<InputEvent> event);

    void _process(float delta);

    void render();

    // helpers
    // add image and get an id for following usage, like imgui.image, imgui.image_button
    int add_image(Ref<Texture> tex);

    // Set context of this instance as current context for imgui
    void set_as_current_context();

    // show demo window
    bool show_demo_window(bool opened);
    bool show_metrics_window(bool opened);
    bool show_about_window(bool opened);

    // styles
    void style_color_dark();
    void style_color_light();
    void style_color_classic();

    void new_frame();

    String get_version();

    // widgets

    void text_unformatted(String text);
    void text(String text);
    void text_colored(Color color, String text);
    void text_disabled(String text);
    void text_wrapped(String text);
    void label_text(String label, String text);
    void bullet_text(String text);

    bool button(String label, Vector2 size);
    bool small_button(String label);
    bool arrow_button(String id, int dir); // dir: ImGuiContants.dir
    void image(int tex_id, Vector2 size, Vector2 uv0, Vector2 uv1, Color tint_color, Color border_color);
    void image_button(int tex_id, Vector2 size, Vector2 uv0, Vector2 uv1, Color bg_color, Color tint_color, int frame_padding);
    bool checkbox(String label, bool checked);
    bool radio_button(String label, bool activated);
    void progressbar(float fraction, Vector2 size, String overlay);
    void bullet();

    // layouts
    void spacing();
    void dummy(Vector2 size);
    void newline();
    void align_text_to_frame_padding();
    void separator();
    bool begin_combo(String label, String preview_value, int flag);
    void end_combo();
    bool selectable(String label, bool is_selected, int flags, Vector2 size);
    void set_item_default_focus();

    // drag
    float drag_float(String label, float default_value, float speed, float v_min, float v_max, String format, int flags);
    Vector2 drag_float2(String label, Vector2 default_value, float speed, float v_min, float v_max, String format, int flags);
    Vector3 drag_float3(String label, Vector3 default_value, float speed, float v_min, float v_max, String format, int flags);

    int drag_int(String label, int default_value, float speed, int v_min, int v_max, String format, int flags);
    PoolIntArray drag_int2(String label, PoolIntArray default_value, float speed, int v_min, int v_max, String format, int flags);
    PoolIntArray drag_int3(String label, PoolIntArray default_value, float speed, int v_min, int v_max, String format, int flags);

    // slider
    float slider_float(String label, float default_value, float v_min, float v_max, String format, int flags);
    Vector2 slider_float2(String label, Vector2 default_value, float v_min, float v_max, String format, int flags);
    Vector3 slider_float3(String label, Vector3 default_value, float v_min, float v_max, String format, int flags);
    float slider_angle(String label, float default_value, float v_min, float v_max, String format, int flags);

    int slider_int(String label, int default_value, int v_min, int v_max, String format, int flags);
    PoolIntArray slider_int2(String label, PoolIntArray default_value, int v_min, int v_max, String format, int flags);
    PoolIntArray slider_int3(String label, PoolIntArray default_value, int v_min, int v_max, String format, int flags);

    float v_slider_float(String label, Vector2 size, float default_value, float v_min, float v_max, String format, int flags);
    int v_slider_int(String label, Vector2 size, int default_value, int v_min, int v_max, String format, int flags);

    // input
    float input_float(String label, float default_value, float step, float step_fast, String format, int flags);
    Vector2 input_float2(String label, Vector2 default_value, String format, int flags);
    Vector3 input_float3(String label, Vector3 default_value, String format, int flags);

    int input_int(String label, int default_value, int step, int step_fast, int flags);

    PoolIntArray input_int2(String label, PoolIntArray default_value, int flags);
    PoolIntArray input_int3(String label, PoolIntArray default_value, int flags);

    String input_text(String label, String value, int max_length, int flags);
    String input_text_multipleline(String label, String value, int max_length, Vector2 size, int flags);
    String input_text_with_hint(String label, String hint, String value, int max_length, int flags);

    // color edit
    Color color_edit4(String label, Color color, int flags);
    Color color_picker4(String label, Color color, int flags);
    bool color_button(String desc_id, Color color, int flags, Vector2 size);
    void set_color_edit_options(int flags);

    // tree
    bool tree_node(String label);
    void tree_pop();
    float get_tree_node_to_label_spacing();
    void set_next_item_open(bool is_open, int condition);
    bool collapsing_header(String label, int flags);

    // listbox
    bool listbox_header(String label, Vector2 size);
    void listbox_footer();

    // plot
    void plot_lines(String label, PoolRealArray values, int value_offset, String overlay, float scale_min, float scale_max, Vector2 size, int stride);
    void plot_histogram(String label, PoolRealArray values, int value_offset, String overlay, float scale_min, float scale_max, Vector2 size, int stride);

    // menubar
    bool begin_menu_bar();
    void end_menu_bar();
    bool begin_main_menu_bar();
    void end_main_menu_bar();
    bool begin_menu(String label, bool enabled);
    void end_menu();
    bool menu_item(String label, String shortcut, bool selected, bool enabled);

    // tabbar
    bool begin_tab_bar(String id, int flags);
    void end_tab_bar();
    bool begin_tab_item(String label, bool open, int flags);
    void end_tab_item();
    bool tab_item_button(String label, int flags);
    void set_tab_item_closed(String label);

    // table
    bool begin_table(String id, int columns_count, int flags, Vector2 outer_size, float inner_width);
    void end_table();
    void table_setup_column(String label, int flags, float init_width_or_weight, unsigned int user_id);
    void table_setup_scroll_freeze(int columns, int rows);
    void table_set_bg_color(int target, Color color, int column_n);
    int table_get_row_index();
    void table_next_row(int row_flags, float row_min_height);
    bool table_set_column_index(int column_n);
    bool table_next_column();
    void table_headers_row();
    void table_header(String label);
    int get_column_index();
    int get_columns_count();
    float get_column_offset(int column_index);
    float get_column_width(int column_index);
    void set_column_width(int column_index, float width);
    void set_column_offset(int column_index, float offset);
    Vector2 get_content_region_avail();
    void next_column();
    void columns(int columns_count, String id, bool border);

    void set_clipboard_text(String text);
    void push_clip_rect(Vector2 rect_min, Vector2 rect_max, bool intersect_with_current_clip_rect);
    void pop_clip_rect();

    Vector2 calc_text_size(String text, String text_end, bool hide_text_after_double_has, float wrap_width);

    bool is_mouse_hovering_rect(Vector2 r_min, Vector2 r_max, bool clip);

    bool begin_child(String id, Vector2 size, bool border, int flags); // window flags
    void end_child();

    bool begin_child_frame(unsigned int id, Vector2 size, int flags); // window flags
    void end_child_frame();

    void push_button_repeat(bool repeat);
    void pop_button_repeat();

    void push_allow_keyboard_focus(bool allow_keyboard_focus);
    void pop_allow_keyboard_focus();

    void set_next_window_pos(Vector2 pos, int condition, Vector2 pivot);
    void set_next_window_size(Vector2 size, int condition);
    void set_window_size(String name, Vector2 size, int condition);
    void set_window_collapsed(String name, bool collapsed, int condition);
    void set_window_focus(String name);
    void set_next_window_bg_alpha(float alpha);
    void set_window_font_scale(float scale);

    void push_id(int id);
    void pop_id();
    void same_line(float offset_from_start_x, float spacing_w);
    void indent(float indent_w);
    void unindent(float indent_w);

    void set_next_item_width(float item_width);
    void push_item_width(float item_width);
    void pop_item_width();
    float calc_item_width();
    float get_text_line_height();
    float get_text_line_height_with_spacing();
    float get_frame_height();
    float get_frame_height_with_spacing();

    void begin_group();
    void end_group();

    bool is_popup_open(String id, int flags);
    void open_popup(String id, int flags);
    void close_current_popup();

    bool begin_popup(String id, int flags);                    // window flags
    bool begin_popup_modal(String name, bool open, int flags); // window flags
    void end_popup();
    void open_popup_on_item_click(String id, int flags);
    bool begin_popup_context_item(String id, int flags);
    bool begin_popup_context_window(String id, int flags);
    bool begin_popup_context_void(String id, int flags);

    void log_text(String text);
    void log_to_tty(int auto_open_depth);
    void log_to_file(int auto_open_depth, String file_name);
    void log_to_clipboard(int auto_open_depth);
    void log_finish();
    void log_buttons();

    bool begin(String name, bool open, int flags);
    void end();

    void begin_tooltip();
    void end_tooltip();
    void push_text_wrap_pos(float pos_x);
    void pop_text_wrap_pos();
    float get_font_size();
    bool is_item_hovered();

    void push_style_color(int idx, Color color);
    void pop_style_color(int count);

    void set_tooltip(String text);
};

#endif