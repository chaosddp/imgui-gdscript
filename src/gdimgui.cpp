#include "gdimgui.h"

using namespace godot;

extern const godot_gdnative_core_api_struct *godot::api;

int GDImGui::texture_id = 1000;

inline ImVec4 to_imgui_color(Color &color)
{
    return ImVec4(color.r, color.g, color.b, color.a);
}

inline ImVec2 to_imgui_vec2(Vector2 &v)
{
    return ImVec2(v.x, v.y);
}

inline Color to_godot_color(ImVec4 c)
{
    return Color(c.x, c.y, c.z, c.w);
}

inline Color to_godot_color(unsigned char r, unsigned char g, unsigned char b, unsigned a)
{
    return Color(r / 255, g / 255, b / 255, a / 255);
}

#define REGISTER_METHOD(name) \
    register_method(#name, &GDImGui::name)

void GDImGui::_register_methods()
{
    api;

    REGISTER_METHOD(_process);
    REGISTER_METHOD(_input);

    REGISTER_METHOD(render);

    REGISTER_METHOD(add_image);

    // styles
    REGISTER_METHOD(style_color_dark);
    REGISTER_METHOD(style_color_light);
    REGISTER_METHOD(style_color_classic);

    REGISTER_METHOD(show_demo_window);
    REGISTER_METHOD(show_metrics_window);
    REGISTER_METHOD(show_about_window);

    REGISTER_METHOD(new_frame);
    REGISTER_METHOD(begin);
    REGISTER_METHOD(end);

    REGISTER_METHOD(get_font_size);
    REGISTER_METHOD(text_unformatted);
    REGISTER_METHOD(text);
    REGISTER_METHOD(text_colored);
    REGISTER_METHOD(text_disabled);
    REGISTER_METHOD(text_wrapped);
    REGISTER_METHOD(label_text);
    REGISTER_METHOD(bullet_text);
    REGISTER_METHOD(push_text_wrap_pos);
    REGISTER_METHOD(pop_text_wrap_pos);

    REGISTER_METHOD(button);
    REGISTER_METHOD(small_button);
    REGISTER_METHOD(arrow_button);
    REGISTER_METHOD(image);
    REGISTER_METHOD(image_button);
    REGISTER_METHOD(checkbox);
    REGISTER_METHOD(radio_button);
    REGISTER_METHOD(progressbar);
    REGISTER_METHOD(bullet);

    REGISTER_METHOD(spacing);
    REGISTER_METHOD(dummy);
    REGISTER_METHOD(newline);
    REGISTER_METHOD(align_text_to_frame_padding);
    REGISTER_METHOD(separator);
    REGISTER_METHOD(begin_combo);
    REGISTER_METHOD(end_combo);
    REGISTER_METHOD(selectable);
    REGISTER_METHOD(set_item_default_focus);

    REGISTER_METHOD(drag_float);
    REGISTER_METHOD(drag_float2);
    REGISTER_METHOD(drag_float3);
    REGISTER_METHOD(drag_int);
    REGISTER_METHOD(drag_int2);
    REGISTER_METHOD(drag_int3);

    REGISTER_METHOD(slider_float);
    REGISTER_METHOD(slider_float2);
    REGISTER_METHOD(slider_float3);
    REGISTER_METHOD(slider_angle);
    REGISTER_METHOD(slider_int);
    REGISTER_METHOD(slider_int2);
    REGISTER_METHOD(slider_int3);
    REGISTER_METHOD(v_slider_float);
    REGISTER_METHOD(v_slider_int);
    REGISTER_METHOD(input_float);
    REGISTER_METHOD(input_float2);
    REGISTER_METHOD(input_float3);
    REGISTER_METHOD(input_int);
    REGISTER_METHOD(input_int2);
    REGISTER_METHOD(input_int3);

    REGISTER_METHOD(input_text);
    REGISTER_METHOD(input_text_with_hint);
    REGISTER_METHOD(input_text_multipleline);

    REGISTER_METHOD(color_edit4);
    REGISTER_METHOD(color_picker4);
    REGISTER_METHOD(color_button);
    REGISTER_METHOD(set_color_edit_options);

    REGISTER_METHOD(tree_node);
    REGISTER_METHOD(tree_pop);
    REGISTER_METHOD(set_next_item_open);
    REGISTER_METHOD(get_tree_node_to_label_spacing);
    REGISTER_METHOD(collapsing_header);

    REGISTER_METHOD(listbox_header);
    REGISTER_METHOD(listbox_footer);

    REGISTER_METHOD(plot_histogram);
    REGISTER_METHOD(plot_lines);

    REGISTER_METHOD(begin_main_menu_bar);
    REGISTER_METHOD(end_main_menu_bar);
    REGISTER_METHOD(begin_menu_bar);
    REGISTER_METHOD(end_menu_bar);
    REGISTER_METHOD(begin_menu);
    REGISTER_METHOD(end_menu);
    REGISTER_METHOD(menu_item);
    REGISTER_METHOD(begin_tab_item);
    REGISTER_METHOD(end_tab_item);
    REGISTER_METHOD(tab_item_button);
    REGISTER_METHOD(set_tab_item_closed);

    REGISTER_METHOD(begin_tab_bar);
    REGISTER_METHOD(end_tab_bar);

    REGISTER_METHOD(set_clipboard_text);

    REGISTER_METHOD(push_clip_rect);
    REGISTER_METHOD(pop_clip_rect);
    REGISTER_METHOD(calc_text_size);
    REGISTER_METHOD(is_mouse_hovering_rect);
    REGISTER_METHOD(begin_child);
    REGISTER_METHOD(end_child);
    REGISTER_METHOD(begin_child_frame);
    REGISTER_METHOD(end_child_frame);
    REGISTER_METHOD(push_button_repeat);
    REGISTER_METHOD(pop_button_repeat);

    REGISTER_METHOD(push_allow_keyboard_focus);
    REGISTER_METHOD(pop_allow_keyboard_focus);
    REGISTER_METHOD(set_window_size);
    REGISTER_METHOD(set_window_collapsed);
    REGISTER_METHOD(set_window_focus);
    REGISTER_METHOD(set_next_window_bg_alpha);
    REGISTER_METHOD(set_window_font_scale);
    REGISTER_METHOD(push_id);
    REGISTER_METHOD(pop_id);
    REGISTER_METHOD(same_line);

    REGISTER_METHOD(indent);
    REGISTER_METHOD(unindent);
    REGISTER_METHOD(set_next_item_width);
    REGISTER_METHOD(pop_item_width);
    REGISTER_METHOD(calc_item_width);
    REGISTER_METHOD(get_text_line_height);
    REGISTER_METHOD(get_text_line_height_with_spacing);
    REGISTER_METHOD(get_frame_height);
    REGISTER_METHOD(get_frame_height_with_spacing);
    REGISTER_METHOD(begin_group);
    REGISTER_METHOD(end_group);
    REGISTER_METHOD(is_popup_open);
    REGISTER_METHOD(open_popup);

    REGISTER_METHOD(close_current_popup);
    REGISTER_METHOD(begin_popup);
    REGISTER_METHOD(begin_popup_modal);
    REGISTER_METHOD(end_popup);
    REGISTER_METHOD(open_popup_on_item_click);
    REGISTER_METHOD(begin_popup_context_item);
    REGISTER_METHOD(begin_popup_context_window);
    REGISTER_METHOD(begin_popup_context_void);
    REGISTER_METHOD(log_text);
    REGISTER_METHOD(log_to_tty);
    REGISTER_METHOD(log_to_file);
    REGISTER_METHOD(log_to_clipboard);
    REGISTER_METHOD(log_finish);
    REGISTER_METHOD(log_buttons);

    REGISTER_METHOD(begin_tooltip);
    REGISTER_METHOD(end_tooltip);

    REGISTER_METHOD(is_item_hovered);

    REGISTER_METHOD(set_next_window_pos);
    REGISTER_METHOD(set_next_window_size);
    REGISTER_METHOD(get_version);
    REGISTER_METHOD(push_item_width);
    REGISTER_METHOD(begin_table);
    REGISTER_METHOD(end_table);
    REGISTER_METHOD(table_next_column);
    REGISTER_METHOD(table_setup_column);
    REGISTER_METHOD(table_setup_scroll_freeze);
    REGISTER_METHOD(table_get_row_index);
    REGISTER_METHOD(table_header);
    REGISTER_METHOD(table_headers_row);
    REGISTER_METHOD(table_next_row);
    REGISTER_METHOD(table_set_bg_color);
    REGISTER_METHOD(table_set_column_index);
    REGISTER_METHOD(push_style_color);
    REGISTER_METHOD(pop_style_color);
    REGISTER_METHOD(set_tooltip);
}

GDImGui::GDImGui()
{
    // init imgui
    IMGUI_CHECKVERSION();

    // TODO: share font between instance?
    _imgui_ctx = ImGui::CreateContext();

    ImGui::SetCurrentContext(_imgui_ctx);

    gen_font_tex();

    init_imgui();
}

GDImGui::~GDImGui()
{
    // add your cleanup here
    ImGui::DestroyContext(_imgui_ctx);
    _imgui_ctx = nullptr;

    _textures.clear();
}

void GDImGui::_init()
{
}

void GDImGui::_input(Ref<InputEvent> event)
{
    ImGuiIO &io = ImGui::GetIO();

    InputEventMouseMotion *motion_evt = cast_to<InputEventMouseMotion>(event.ptr());

    SceneTree *tree = get_tree();

    if (motion_evt != nullptr)
    {
        io.MousePos = to_imgui_vec2(motion_evt->get_position());

        if (io.WantCaptureMouse)
        {
            tree->set_input_as_handled();
        }

        return;
    }

    InputEventMouseButton *mouse_btn_event = cast_to<InputEventMouseButton>(event.ptr());

    if (mouse_btn_event != nullptr)
    {
        switch (mouse_btn_event->get_button_index())
        {
        case GlobalConstants::BUTTON_LEFT: // left button
        {
            io.MouseDown[ImGuiMouseButton_Left] = mouse_btn_event->is_pressed();
            break;
        }
        case GlobalConstants::BUTTON_RIGHT: // right button
        {
            io.MouseDown[ImGuiMouseButton_Right] = mouse_btn_event->is_pressed();
            break;
        }
        case GlobalConstants::BUTTON_MIDDLE: // middle button
        {
            io.MouseDown[ImGuiMouseButton_Middle] = mouse_btn_event->is_pressed();
            break;
        }
        case GlobalConstants::BUTTON_WHEEL_UP: // wheel up
        {
            io.MouseWheel = mouse_btn_event->get_factor() * 1.0f;
            break;
        }
        case GlobalConstants::BUTTON_WHEEL_DOWN: // wheel down
        {
            io.MouseWheel = mouse_btn_event->get_factor() * -1.0f;
            break;
        }
        case GlobalConstants::BUTTON_WHEEL_LEFT: // wheel left
        {
            io.MouseWheel = mouse_btn_event->get_factor() * -1.0f;
            break;
        }
        case GlobalConstants::BUTTON_WHEEL_RIGHT: // wheel right
        {
            io.MouseWheel = mouse_btn_event->get_factor() * 1.0f;
            break;
        }
        default:
            break;
        }

        if (io.WantCaptureMouse)
        {
            tree->set_input_as_handled();
        }

        return;
    }

    InputEventKey *key_event = cast_to<InputEventKey>(event.ptr());

    if (key_event != nullptr)
    {
        int key = 0;
        int64_t lkey = key_event->get_scancode();

        if (lkey < 256)
        {
            key = (int)lkey;
        }
        else
        {
            key = 256 + (int)((unsigned int)lkey & 0xFF);
        }

        io.KeyShift = key_event->get_shift();
        io.KeyAlt = key_event->get_alt();
        io.KeyCtrl = key_event->get_control();
        io.KeySuper = key_event->get_command();

        io.KeysDown[key] = key_event->is_pressed();

        if (key_event->is_pressed())
        {
            io.AddInputCharacter(key_event->get_unicode());
        }

        if (io.WantCaptureKeyboard || io.WantTextInput)
        {
            tree->set_input_as_handled();
        }

        return;
    }
}

void GDImGui::_process(float delta)
{
    ImGuiIO &io = ImGui::GetIO();

    io.DisplaySize = to_imgui_vec2(get_tree()->get_root()->get_size());
    io.DeltaTime = delta;
}

void GDImGui::render()
{
    // https://github.com/pkdawson/imgui-godot/blob/master/addons/imgui-godot/ImGuiGD.cs

    if (!is_visible())
    {
        return;
    }

    ImGui::Render();

    ImDrawData *draw_data = ImGui::GetDrawData();

    int node_number = 0;

    for (auto i = 0; i < draw_data->CmdListsCount; i++)
    {
        node_number += draw_data->CmdLists[i]->CmdBuffer.size();
    }

    while (get_child_count() < node_number)
    {
        MeshInstance2D *meshinst = MeshInstance2D::_new();
        // meshinst->set_texture(_font_tex);

        add_child(meshinst, true);
    }

    while (get_child_count() > node_number)
    {
        Node *node = get_child(get_child_count() - 1);

        remove_child(node);
    }

    int nodeN = 0;
    // VisualServer *vs = VisualServer::get_singleton();

    for (int n = 0; n < draw_data->CmdListsCount; n++)
    {
        ImDrawList *cmdList = draw_data->CmdLists[n];

        int idxOffset = 0;

        int nVert = cmdList->VtxBuffer.Size;

        PoolVector2Array vertices;
        PoolColorArray colors;
        PoolVector2Array uvs;

        for (int i = 0; i < cmdList->VtxBuffer.Size; i++)
        {
            ImDrawVert vert = cmdList->VtxBuffer[i];

            vertices.append(Vector2(vert.pos.x, vert.pos.y));

            ImVec4 fc = ImGui::ColorConvertU32ToFloat4(vert.col);

            colors.append(Color(fc.x, fc.y, fc.z, fc.w));

            uvs.append(Vector2(vert.uv.x, vert.uv.y));
        }

        for (int cmdi = 0; cmdi < cmdList->CmdBuffer.Size; cmdi++, nodeN++)
        {
            ImDrawCmd &draw_cmd = cmdList->CmdBuffer[cmdi];

            PoolIntArray indices;

            for (int i = idxOffset, j = 0; i < idxOffset + draw_cmd.ElemCount; i++, j++)
            {
                indices.append(cmdList->IdxBuffer[i]);
            }

            MeshInstance2D *child = cast_to<MeshInstance2D>(get_child(nodeN));

            Ref<ArrayMesh> mesh = ArrayMesh::_new();

            Array arrays;

            arrays.resize(ArrayMesh::ArrayType::ARRAY_MAX);
            arrays[ArrayMesh::ArrayType::ARRAY_VERTEX] = vertices;
            arrays[ArrayMesh::ArrayType::ARRAY_COLOR] = colors;
            arrays[ArrayMesh::ArrayType::ARRAY_TEX_UV] = uvs;
            arrays[ArrayMesh::ArrayType::ARRAY_INDEX] = indices;

            mesh->add_surface_from_arrays(Mesh::PRIMITIVE_TRIANGLES, arrays);

            child->set_mesh(mesh);

            Texture *tex = get_texture(draw_cmd.TextureId);

            if (tex != nullptr)
            {
                child->set_texture(tex);
            }

            // vs->canvas_item_set_clip(child->get_canvas_item(), true);
            // vs->canvas_item_set_custom_rect(child->get_canvas_item(), true, Rect2(draw_cmd.ClipRect.x, draw_cmd.ClipRect.y, draw_cmd.ClipRect.z - draw_cmd.ClipRect.x, draw_cmd.ClipRect.w - draw_cmd.ClipRect.y));

            idxOffset += draw_cmd.ElemCount;
        }
    }
}

void GDImGui::gen_font_tex()
{
    unsigned char *tex_pixels = nullptr;
    int tex_w, tex_h;
    ImGuiIO &io = ImGui::GetIO();

    io.Fonts->GetTexDataAsRGBA32(&tex_pixels, &tex_w, &tex_h);

    Ref<Image> img = Image::_new();

    img->create(tex_w, tex_h, false, Image::Format::FORMAT_RGBA8);

    img->lock();
    for (int r = 0; r < tex_w; r++)
    {
        for (int c = 0; c < tex_h; c++)
        {
            int index = c * tex_w * 4 + r * 4;
            img->set_pixel(r, c, Color::Color(tex_pixels[index] / 255, tex_pixels[index + 1] / 255, tex_pixels[index + 2] / 255, tex_pixels[index + 3] / 255));
        }
    }
    img->unlock();

    ImageTexture *img_tex = ImageTexture::_new();
    img_tex->create_from_image(img, 0);

    int tex_id = add_texture(img_tex);

    io.Fonts->SetTexID(tex_id);
    io.Fonts->ClearTexData();
}

int GDImGui::add_texture(Texture *tex)
{
    int id = texture_id++;

    _textures[id] = tex;

    return id;
}

Texture *GDImGui::get_texture(int id)
{
    auto pair = _textures.find(id);

    if (pair == _textures.end())
    {
        return nullptr;
    }

    return pair->second;
}

void GDImGui::remove_texture(int id)
{
    _textures.erase(id);
}

void GDImGui::init_imgui()
{
    ImGuiIO &io = ImGui::GetIO();

    ImGui::StyleColorsDark();

    io.BackendPlatformName = "imgui_impl_godot";

    // we followed the solution from github.com/pkdawson to remap the key code less than 512
    int KEYOFFSET = 256;
    int KEY_TAB = KEYOFFSET + 0x02;
    int KEY_LEFT = KEYOFFSET + 0x0F;
    int KEY_UP = KEYOFFSET + 0x10;
    int KEY_RIGHT = KEYOFFSET + 0x11;
    int KEY_DOWN = KEYOFFSET + 0x12;
    int KEY_PAGEUP = KEYOFFSET + 0x13;
    int KEY_PAGEDOWN = KEYOFFSET + 0x14;
    int KEY_HOME = KEYOFFSET + 0x0D;
    int KEY_END = KEYOFFSET + 0x0E;
    int KEY_INSERT = KEYOFFSET + 0x07;
    int KEY_DELETE = KEYOFFSET + 0x08;
    int KEY_BACKSPACE = KEYOFFSET + 0x04;
    int KEY_ESCAPE = KEYOFFSET + 0x01;
    int KEY_ENTER = KEYOFFSET + 0x05;
    int KEY_KP_ENTER = KEYOFFSET + 0x06;

    int Key_A = 0x0041;                 // for text edit CTRL+A: select all
    int Key_C = 0x0043;                 // for text edit CTRL+C: copy
    int Key_V = 0x0056;                 // for text edit CTRL+V: paste
    int Key_X = 0x0058;                 // for text edit CTRL+X: cut
    int Key_Y = 0x0059;                 // for text edit CTRL+Y: redo
    int Key_Z = 0x005A;                 // for text edit CTRL+Z: undo
    // keyboard mapping
    io.KeyMap[ImGuiKey_Tab] = KEY_TAB;
    io.KeyMap[ImGuiKey_LeftArrow] = KEY_LEFT;
    io.KeyMap[ImGuiKey_RightArrow] = KEY_RIGHT;
    io.KeyMap[ImGuiKey_UpArrow] = KEY_UP;
    io.KeyMap[ImGuiKey_DownArrow] = KEY_DOWN;
    io.KeyMap[ImGuiKey_PageUp] = KEY_PAGEUP;
    io.KeyMap[ImGuiKey_PageDown] = KEY_PAGEDOWN;
    io.KeyMap[ImGuiKey_Home] = KEY_HOME;
    io.KeyMap[ImGuiKey_End] = KEY_END;
    io.KeyMap[ImGuiKey_Insert] = KEY_INSERT;
    io.KeyMap[ImGuiKey_Delete] = KEY_DELETE;
    io.KeyMap[ImGuiKey_Backspace] = KEY_BACKSPACE;
    io.KeyMap[ImGuiKey_Enter] = KEY_ENTER;
    io.KeyMap[ImGuiKey_Escape] = KEY_ESCAPE;
    io.KeyMap[ImGuiKey_KeyPadEnter] = KEY_KP_ENTER;
    io.KeyMap[ImGuiKey_A] = Key_A;
    io.KeyMap[ImGuiKey_C] = Key_C;
    io.KeyMap[ImGuiKey_V] = Key_V;
    io.KeyMap[ImGuiKey_X] = Key_X;
    io.KeyMap[ImGuiKey_Y] = Key_Y;
    io.KeyMap[ImGuiKey_Z] = Key_Z;
}

int GDImGui::add_image(Ref<Texture> tex)
{
    return add_texture(tex.ptr());
}

void GDImGui::set_as_current_context()
{
    ImGui::SetCurrentContext(_imgui_ctx);
}

String GDImGui::get_version()
{
    return String(IMGUI_VERSION);
}

void GDImGui::style_color_dark()
{
    ImGui::StyleColorsDark();
}

void GDImGui::style_color_light()
{
    ImGui::StyleColorsLight();
}
void GDImGui::style_color_classic()
{
    ImGui::StyleColorsClassic();
}

// region demo
bool GDImGui::show_demo_window(bool opened)
{
    ImGui::ShowDemoWindow(&opened);

    return opened;
}

bool GDImGui::show_metrics_window(bool opened)
{
    ImGui::ShowMetricsWindow(&opened);

    return opened;
}

bool GDImGui::show_about_window(bool opened)
{
    ImGui::ShowAboutWindow(&opened);

    return opened;
}

void GDImGui::new_frame()
{
    ImGui::NewFrame();
}

#define ALLOC_STRING(name, value) \
    char *name = ##value.alloc_c_string();

#define FREE_STRING(name) \
    api->godot_free(name);

bool GDImGui::begin(String name, bool open, int flags)
{
    ALLOC_STRING(c_name, name)

    bool visible = ImGui::Begin(c_name, &open, flags);

    FREE_STRING(c_name)

    return visible;
}

void GDImGui::end()
{
    ImGui::End();
}

// region: texts
void GDImGui::text_unformatted(String text)
{
    ALLOC_STRING(c_text, text)

    ImGui::TextUnformatted(c_text);

    FREE_STRING(c_text)
}

void GDImGui::text(String text)
{
    ALLOC_STRING(c_text, text)

    ImGui::Text(c_text);

    FREE_STRING(c_text)
}

void GDImGui::text_colored(Color color, String text)
{
    ALLOC_STRING(c_text, text)

    ImGui::TextColored(ImColor(color.r, color.g, color.b, color.a), c_text);

    FREE_STRING(c_text)
}

void GDImGui::text_disabled(String text)
{
    ALLOC_STRING(c_text, text)

    ImGui::TextDisabled(c_text);

    FREE_STRING(c_text)
}

void GDImGui::text_wrapped(String text)
{
    ALLOC_STRING(c_text, text)

    ImGui::TextWrapped(c_text);

    FREE_STRING(c_text)
}

void GDImGui::label_text(String label, String text)
{
    ALLOC_STRING(c_label, label)
    ALLOC_STRING(c_text, text)

    ImGui::LabelText(c_label, c_text);

    FREE_STRING(c_label)
    FREE_STRING(c_text)
}

void GDImGui::bullet_text(String text)
{
    ALLOC_STRING(c_text, text)

    ImGui::BulletText(c_text);

    FREE_STRING(c_text)
}

// region: buttons
bool GDImGui::button(String label, Vector2 size)
{
    ALLOC_STRING(c_label, label)

    bool clicked = ImGui::Button(c_label, to_imgui_vec2(size));

    FREE_STRING(c_label)

    return clicked;
}

bool GDImGui::small_button(String label)
{
    ALLOC_STRING(c_label, label)

    bool clicked = ImGui::SmallButton(c_label);

    FREE_STRING(c_label)

    return clicked;
}

bool GDImGui::arrow_button(String id, int dir)
{
    ALLOC_STRING(c_id, id)

    bool clicked = ImGui::ArrowButton(id.alloc_c_string(), dir);

    FREE_STRING(c_id)

    return clicked;
}

void GDImGui::image(int tex_id, Vector2 size, Vector2 uv0, Vector2 uv1, Color tint_color, Color border_color)
{
    ImGui::Image(tex_id, to_imgui_vec2(size), to_imgui_vec2(uv0), to_imgui_vec2(uv1), to_imgui_color(tint_color), to_imgui_color(border_color));
}

void GDImGui::image_button(int tex_id, Vector2 size, Vector2 uv0, Vector2 uv1, Color bg_color, Color tint_color, int frame_padding)
{
    ImGui::ImageButton(tex_id, to_imgui_vec2(size), to_imgui_vec2(uv0), to_imgui_vec2(uv1), frame_padding, to_imgui_color(bg_color), to_imgui_color(tint_color));
}

bool GDImGui::checkbox(String label, bool checked)
{
    ALLOC_STRING(c_label, label)

    ImGui::Checkbox(c_label, &checked);

    FREE_STRING(c_label)

    return checked;
}

bool GDImGui::radio_button(String label, bool activated)
{
    ALLOC_STRING(c_label, label)

    bool clicked = ImGui::RadioButton(c_label, activated);

    FREE_STRING(c_label)

    return clicked;
}

void GDImGui::progressbar(float fraction, Vector2 size, String overlay)
{
    ALLOC_STRING(c_overlay, overlay)

    ImGui::ProgressBar(fraction, to_imgui_vec2(size), c_overlay);

    FREE_STRING(c_overlay)
}

void GDImGui::bullet()
{
    ImGui::Bullet();
}

void GDImGui::spacing()
{
    ImGui::Spacing();
}

void GDImGui::dummy(Vector2 size)
{
    ImGui::Dummy(to_imgui_vec2(size));
}

void GDImGui::newline()
{
    ImGui::NewLine();
}

void GDImGui::align_text_to_frame_padding()
{
    ImGui::AlignTextToFramePadding();
}

void GDImGui::separator()
{
    ImGui::Separator();
}

bool GDImGui::begin_combo(String label, String preview_value, int flag)
{
    ALLOC_STRING(c_label, label)
    ALLOC_STRING(c_preview_value, preview_value)

    bool clicked = ImGui::BeginCombo(c_label, c_preview_value, flag);

    FREE_STRING(c_label)
    FREE_STRING(c_preview_value)

    return clicked;
}

void GDImGui::end_combo()
{
    ImGui::EndCombo();
}

bool GDImGui::selectable(String label, bool is_selected, int flags, Vector2 size)
{
    ALLOC_STRING(c_label, label)

    bool clicked = ImGui::Selectable(c_label, is_selected, flags, to_imgui_vec2(size));

    FREE_STRING(c_label)

    return clicked;
}

void GDImGui::set_item_default_focus()
{
    ImGui::SetItemDefaultFocus();
}

#define GET_FROM_VECTOR2()  \
    v[0] = default_value.x; \
    v[1] = default_value.y;

#define SET_TO_VECTOR2()    \
    default_value.x = v[0]; \
    default_value.y = v[1];

#define GET_FROM_VECTOR3() \
    GET_FROM_VECTOR2()     \
    v[2] = default_value.z;

#define SET_TO_VECTOR3() \
    SET_TO_VECTOR2()     \
    default_value.z = v[2];

#define GET_FROM_ARRAY2()    \
    v[0] = default_value[0]; \
    v[1] = default_value[1];

#define SET_TO_ARRAY2()         \
    default_value.set(0, v[0]); \
    default_value.set(1, v[1]);

#define GET_FROM_ARRAY3() \
    GET_FROM_ARRAY2()     \
    v[2] = default_value[2];

#define SET_TO_ARRAY3() \
    SET_TO_ARRAY2()     \
    default_value.set(2, v[2]);

#define ALLOC_FORMAT(name, value) \
    char *name = ##value.empty() ? nullptr : ##value.alloc_c_string();

#define FREE_FORMAT(name) \
    if (name != nullptr)  \
    {                     \
        FREE_STRING(name) \
    };

float GDImGui::drag_float(String label, float default_value, float speed, float v_min, float v_max, String format, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_FORMAT(c_format, format)

    float v = default_value;

    ImGui::DragFloat(c_label, &v, speed, v_min, v_max, c_format, flags);

    FREE_STRING(c_label)
    FREE_FORMAT(c_format)

    return v;
}

Vector2 GDImGui::drag_float2(String label, Vector2 default_value, float speed, float v_min, float v_max, String format, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_FORMAT(c_format, format)

    float v[2];

    GET_FROM_VECTOR2()

    ImGui::DragFloat2(c_label, v, speed, v_min, v_max, c_format, flags);

    SET_TO_VECTOR2()

    FREE_STRING(c_label)
    FREE_FORMAT(c_format)

    return default_value;
}

Vector3 GDImGui::drag_float3(String label, Vector3 default_value, float speed, float v_min, float v_max, String format, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_FORMAT(c_format, format)

    float v[3];

    GET_FROM_VECTOR3()

    ImGui::DragFloat3(c_label, v, speed, v_min, v_max, c_format, flags);

    SET_TO_VECTOR3()

    FREE_STRING(c_label)
    FREE_FORMAT(c_format)

    return default_value;
}

int GDImGui::drag_int(String label, int default_value, float speed, int v_min, int v_max, String format, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_FORMAT(c_format, format)

    int v = default_value;

    ImGui::DragInt(c_label, &v, speed, v_min, v_max, c_format, flags);

    FREE_STRING(c_label)
    FREE_FORMAT(c_format)

    return v;
}

PoolIntArray GDImGui::drag_int2(String label, PoolIntArray default_value, float speed, int v_min, int v_max, String format, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_FORMAT(c_format, format)

    int v[2];

    GET_FROM_ARRAY2()

    ImGui::DragInt2(c_label, v, speed, v_min, v_max, c_format, flags);

    SET_TO_ARRAY2()

    FREE_STRING(c_label)
    FREE_FORMAT(c_format)

    return default_value;
}

PoolIntArray GDImGui::drag_int3(String label, PoolIntArray default_value, float speed, int v_min, int v_max, String format, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_FORMAT(c_format, format)

    int v[3];

    GET_FROM_ARRAY3()

    ImGui::DragInt3(c_label, v, speed, v_min, v_max, c_format, flags);

    SET_TO_ARRAY3()

    FREE_STRING(c_label)
    FREE_FORMAT(c_format)

    return default_value;
}

float GDImGui::slider_float(String label, float default_value, float v_min, float v_max, String format, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_FORMAT(c_format, format)

    ImGui::SliderFloat(c_label, &default_value, v_min, v_max, c_format, flags);

    FREE_STRING(c_label)
    FREE_FORMAT(c_format)

    return default_value;
}

Vector2 GDImGui::slider_float2(String label, Vector2 default_value, float v_min, float v_max, String format, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_FORMAT(c_format, format)

    float v[2];

    GET_FROM_VECTOR2()

    ImGui::SliderFloat2(c_label, v, v_min, v_max, c_format, flags);

    SET_TO_VECTOR2()

    FREE_STRING(c_label)
    FREE_FORMAT(c_format)

    return default_value;
}

Vector3 GDImGui::slider_float3(String label, Vector3 default_value, float v_min, float v_max, String format, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_FORMAT(c_format, format)

    float v[3];

    GET_FROM_VECTOR3()

    ImGui::SliderFloat3(c_label, v, v_min, v_max, c_format, flags);

    SET_TO_VECTOR3()

    FREE_STRING(c_label)
    FREE_FORMAT(c_format)

    return default_value;
}

float GDImGui::slider_angle(String label, float default_value, float v_min, float v_max, String format, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_FORMAT(c_format, format)

    ImGui::SliderAngle(c_label, &default_value, v_min, v_max, c_format, flags);

    FREE_STRING(c_label)
    FREE_FORMAT(c_format)

    return default_value;
}

int GDImGui::slider_int(String label, int default_value, int v_min, int v_max, String format, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_FORMAT(c_format, format)

    ImGui::SliderInt(c_label, &default_value, v_min, v_max, c_format, flags);

    FREE_STRING(c_label)
    FREE_FORMAT(c_format)

    return default_value;
}

PoolIntArray GDImGui::slider_int2(String label, PoolIntArray default_value, int v_min, int v_max, String format, int flags)
{
    ALLOC_FORMAT(c_format, format)
    ALLOC_STRING(c_label, label)

    int v[2];

    GET_FROM_ARRAY2()

    ImGui::SliderInt2(c_label, v, v_min, v_max, c_format, flags);

    SET_TO_ARRAY2()

    FREE_FORMAT(c_format)
    FREE_STRING(c_label)

    return default_value;
}

PoolIntArray GDImGui::slider_int3(String label, PoolIntArray default_value, int v_min, int v_max, String format, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_FORMAT(c_format, format)

    int v[3];

    GET_FROM_ARRAY3()

    ImGui::SliderInt3(c_label, v, v_min, v_max, c_format, flags);

    SET_TO_ARRAY3()

    FREE_STRING(c_label)
    FREE_FORMAT(c_format)

    return default_value;
}

float GDImGui::v_slider_float(String label, Vector2 size, float default_value, float v_min, float v_max, String format, int flags)
{
    ALLOC_STRING(c_lable, label)
    ALLOC_FORMAT(c_format, format)

    ImGui::VSliderFloat(c_lable, to_imgui_vec2(size), &default_value, v_min, v_max, c_format, flags);

    FREE_FORMAT(c_format)
    FREE_STRING(c_lable)

    return default_value;
}

int GDImGui::v_slider_int(String label, Vector2 size, int default_value, int v_min, int v_max, String format, int flags)
{
    ALLOC_FORMAT(c_format, format)
    ALLOC_STRING(c_label, label)

    ImGui::VSliderInt(c_label, to_imgui_vec2(size), &default_value, v_min, v_max, c_format, flags);

    FREE_STRING(c_label)
    FREE_FORMAT(c_format)

    return default_value;
}

float GDImGui::input_float(String label, float default_value, float step, float step_fast, String format, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_FORMAT(c_format, format)

    ImGui::InputFloat(c_label, &default_value, step, step_fast, c_format, flags);

    FREE_FORMAT(c_format)
    FREE_STRING(c_label)

    return default_value;
}

Vector2 GDImGui::input_float2(String label, Vector2 default_value, String format, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_FORMAT(c_format, format)

    float v[2];

    GET_FROM_VECTOR2()

    ImGui::InputFloat2(c_label, v, c_format, flags);

    SET_TO_VECTOR2()

    FREE_STRING(c_label)
    FREE_FORMAT(c_format)

    return default_value;
}

Vector3 GDImGui::input_float3(String label, Vector3 default_value, String format, int flags)
{
    ALLOC_FORMAT(c_format, format)
    ALLOC_STRING(c_label, label)

    float v[3];

    GET_FROM_VECTOR3()

    ImGui::InputFloat3(c_label, v, c_format, flags);

    SET_TO_VECTOR3()

    FREE_FORMAT(c_format)
    FREE_STRING(c_label)

    return default_value;
}

int GDImGui::input_int(String label, int default_value, int step, int step_fast, int flags)
{
    ALLOC_STRING(c_label, label)

    ImGui::InputInt(c_label, &default_value, step, step_fast, flags);

    FREE_STRING(c_label)

    return default_value;
}

PoolIntArray GDImGui::input_int2(String label, PoolIntArray default_value, int flags)
{
    ALLOC_STRING(c_label, label)

    int v[2];

    GET_FROM_ARRAY2()

    ImGui::InputInt2(c_label, v, flags);

    SET_TO_ARRAY2()

    FREE_STRING(c_label)

    return default_value;
}

PoolIntArray GDImGui::input_int3(String label, PoolIntArray default_value, int flags)
{
    ALLOC_STRING(c_label, label)

    int v[3];

    GET_FROM_ARRAY3()

    ImGui::InputInt3(c_label, v, flags);

    SET_TO_ARRAY3()

    FREE_STRING(c_label)

    return default_value;
}

String GDImGui::input_text(String label, String value, int max_length, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_STRING(c_value, value)

    char *buffer = (char *)api->godot_alloc(max_length + 1);

    memset(buffer, 0, max_length + 1);

    if (!value.empty())
    {
        memcpy(buffer, c_value, value.length() + 1);
    }

    ImGui::InputText(c_label, buffer, max_length + 1, flags);

    String result(buffer);

    api->godot_free(buffer);

    FREE_STRING(c_label)
    FREE_STRING(c_value)

    return result;
}

String GDImGui::input_text_with_hint(String label, String hint, String value, int max_length, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_STRING(c_value, value)
    ALLOC_STRING(c_hint, hint)

    char *buffer = (char *)api->godot_alloc(max_length + 1);

    memset(buffer, 0, max_length + 1);

    if (!value.empty())
    {
        memcpy(buffer, c_value, value.length() + 1);
    }

    ImGui::InputTextWithHint(c_label, c_hint, buffer, max_length + 1, flags);

    String result(buffer);

    api->godot_free(buffer);

    FREE_STRING(c_label)
    FREE_STRING(c_value)
    FREE_STRING(c_hint)

    return result;
}


String GDImGui::input_text_multipleline(String label, String value, int max_length, Vector2 size, int flags)
{
    ALLOC_STRING(c_label, label)
    ALLOC_STRING(c_value, value)

    char *buffer = (char *)api->godot_alloc(max_length + 1);

    memset(buffer, 0, max_length + 1);

    if (!value.empty())
    {
        memcpy(buffer, c_value, value.length() + 1);
    }

    ImGui::InputTextMultiline(c_label, buffer, max_length + 1, to_imgui_vec2(size), flags);

    String result(buffer);

    api->godot_free(buffer);

    FREE_STRING(c_label)
    FREE_STRING(c_value)

    return result;
}

#define GET_FROM_COLOR() \
    v[0] = color.r;      \
    v[1] = color.g;      \
    v[2] = color.b;      \
    v[3] = color.a;

#define SET_TO_COLOR() \
    color.a = v[0];    \
    color.g = v[1];    \
    color.b = v[2];    \
    color.a = v[3];

Color GDImGui::color_edit4(String label, Color color, int flags)
{
    ALLOC_STRING(c_label, label)

    float v[4];

    GET_FROM_COLOR()

    ImGui::ColorEdit4(c_label, v, flags);

    SET_TO_COLOR()

    FREE_STRING(c_label)

    return color;
}

Color GDImGui::color_picker4(String label, Color color, int flags)
{
    ALLOC_STRING(c_label, label)

    float v[4];

    GET_FROM_COLOR()

    ImGui::ColorPicker4(c_label, v, flags);

    SET_TO_COLOR()

    FREE_STRING(c_label)

    return color;
}

bool GDImGui::color_button(String desc_id, Color color, int flags, Vector2 size)
{

    ALLOC_STRING(c_desc_id, desc_id)

    bool clicked = ImGui::ColorButton(c_desc_id, to_imgui_color(color), flags, to_imgui_vec2(size));

    FREE_STRING(c_desc_id)

    return clicked;
}

void GDImGui::set_color_edit_options(int flags)
{
    ImGui::SetColorEditOptions(flags);
}

bool GDImGui::tree_node(String label)
{
    ALLOC_STRING(c_label, label)

    bool opened = ImGui::TreeNode(c_label);

    FREE_STRING(c_label)

    return opened;
}

void GDImGui::tree_pop()
{
    ImGui::TreePop();
}

float GDImGui::get_tree_node_to_label_spacing()
{
    return ImGui::GetTreeNodeToLabelSpacing();
}

void GDImGui::set_next_item_open(bool is_open, int condition)
{
    ImGui::SetNextItemOpen(is_open, condition);
}

bool GDImGui::collapsing_header(String label, int flags)
{
    ALLOC_STRING(c_label, label)

    bool opened = ImGui::CollapsingHeader(c_label, flags);

    FREE_STRING(c_label)

    return opened;
}

bool GDImGui::listbox_header(String label, Vector2 size)
{
    ALLOC_STRING(c_label, label)

    bool v = ImGui::ListBoxHeader(c_label, to_imgui_vec2(size));

    FREE_STRING(c_label);

    return v;
}

void GDImGui::listbox_footer()
{
    ImGui::ListBoxFooter();
}

void GDImGui::plot_lines(String label, PoolRealArray values, int value_offset, String overlay,
                         float scale_min, float scale_max, Vector2 size, int stride)
{
    ALLOC_STRING(c_label, label)
    ALLOC_STRING(c_overlay, overlay)

    float *c_values = (float *)api->godot_alloc(values.size() * sizeof(float));

    for (int i = 0; i < values.size(); i++)
    {
        c_values[i] = values[i];
    }

    ImGui::PlotLines(c_label, c_values, values.size(), value_offset, c_overlay, scale_min, scale_max, to_imgui_vec2(size), stride);

    FREE_STRING(c_label)
    FREE_STRING(c_overlay)

    api->godot_free(c_values);
}

void GDImGui::plot_histogram(String label, PoolRealArray values, int value_offset, String overlay,
                             float scale_min, float scale_max, Vector2 size, int stride)
{
    ALLOC_STRING(c_label, label)
    ALLOC_STRING(c_overlay, overlay)

    float *c_values = (float *)api->godot_alloc(values.size() * sizeof(float));

    for (int i = 0; i < values.size(); i++)
    {
        c_values[i] = values[i];
    }

    ImGui::PlotHistogram(c_label, c_values, values.size(), value_offset, c_overlay, scale_min, scale_max, to_imgui_vec2(size), stride);

    FREE_STRING(c_label)
    FREE_STRING(c_overlay)

    api->godot_free(c_values);
}

bool GDImGui::begin_menu_bar()
{
    return ImGui::BeginMenuBar();
}

void GDImGui::end_menu_bar()
{
    ImGui::EndMenuBar();
}

bool GDImGui::begin_main_menu_bar()
{
    return ImGui::BeginMainMenuBar();
}

void GDImGui::end_main_menu_bar()
{
    ImGui::EndMainMenuBar();
}

bool GDImGui::begin_menu(String label, bool enabled)
{
    ALLOC_STRING(c_label, label)

    bool clicked = ImGui::BeginMenu(c_label, enabled);

    FREE_STRING(c_label)

    return clicked;
}

void GDImGui::end_menu()
{
    ImGui::EndMenu();
}

bool GDImGui::menu_item(String label, String shortcut, bool selected, bool enabled)
{
    ALLOC_STRING(c_label, label)
    ALLOC_STRING(c_shortcut, shortcut)

    bool clicked = ImGui::MenuItem(c_label, c_shortcut, selected, enabled);

    FREE_STRING(c_label)
    FREE_STRING(c_shortcut)

    return clicked;
}

bool GDImGui::begin_tab_bar(String id, int flags)
{
    ALLOC_STRING(c_id, id)

    bool v = ImGui::BeginTabBar(c_id, flags);

    FREE_STRING(c_id)

    return v;
}

void GDImGui::end_tab_bar()
{
    ImGui::EndTabBar();
}

bool GDImGui::begin_tab_item(String label, bool open, int flags)
{
    ALLOC_STRING(c_label, label)

    bool v = ImGui::BeginTabItem(c_label, &open, flags);

    FREE_STRING(c_label)

    return v;
}

void GDImGui::end_tab_item()
{
    ImGui::EndTabItem();
}

bool GDImGui::tab_item_button(String label, int flags)
{
    ALLOC_STRING(c_label, label)

    bool clicked = ImGui::TabItemButton(c_label, flags);

    FREE_STRING(c_label)

    return clicked;
}

void GDImGui::set_tab_item_closed(String label)
{
    ALLOC_STRING(c_label, label)

    ImGui::SetTabItemClosed(c_label);

    FREE_STRING(c_label)
}

void GDImGui::set_clipboard_text(String text)
{
    ALLOC_STRING(c_text, text)

    ImGui::SetClipboardText(c_text);

    FREE_STRING(c_text);
}

void GDImGui::begin_tooltip()
{
    // ImGui::inputTe
    ImGui::BeginTooltip();
}

void GDImGui::end_tooltip()
{
    ImGui::EndTooltip();
}

void GDImGui::push_text_wrap_pos(float pos_x)
{
    ImGui::PushTextWrapPos(pos_x);
}

void GDImGui::pop_text_wrap_pos()
{
    ImGui::PopTextWrapPos();
}

float GDImGui::get_font_size()
{
    return ImGui::GetFontSize();
}

bool GDImGui::is_item_hovered()
{
    return ImGui::IsItemHovered();
}

void GDImGui::push_clip_rect(Vector2 rect_min, Vector2 rect_max, bool intersect_with_current_clip_rect)
{
    ImGui::PushClipRect(to_imgui_vec2(rect_min), to_imgui_vec2(rect_max), intersect_with_current_clip_rect);
}

void GDImGui::pop_clip_rect()
{
    ImGui::PopClipRect();
}

Vector2 GDImGui::calc_text_size(String text, String text_end, bool hide_text_after_double_has, float wrap_width)
{
    ALLOC_STRING(c_text, text)
    ALLOC_FORMAT(c_end, text_end)

    ImVec2 &size = ImGui::CalcTextSize(c_text, c_end, hide_text_after_double_has, wrap_width);

    FREE_STRING(c_text)
    FREE_FORMAT(c_end)

    return Vector2(size.x, size.y);
}

bool GDImGui::is_mouse_hovering_rect(Vector2 r_min, Vector2 r_max, bool clip)
{
    return ImGui::IsMouseHoveringRect(to_imgui_vec2(r_min), to_imgui_vec2(r_max), clip);
}

bool GDImGui::begin_child(String id, Vector2 size, bool border, int flags)
{
    ALLOC_STRING(c_id, id)

    bool v = ImGui::BeginChild(c_id, to_imgui_vec2(size), border, flags);

    FREE_STRING(c_id)

    return v;
}

void GDImGui::end_child()
{
    ImGui::EndChild();
}

bool GDImGui::begin_child_frame(unsigned int id, Vector2 size, int flags)
{
    return ImGui::BeginChildFrame(id, to_imgui_vec2(size), flags);
}

void GDImGui::end_child_frame()
{
    ImGui::EndChildFrame();
}

void GDImGui::push_button_repeat(bool repeat)
{
    ImGui::PushButtonRepeat(repeat);
}

void GDImGui::pop_button_repeat()
{
    ImGui::PopButtonRepeat();
}

void GDImGui::push_allow_keyboard_focus(bool allow_keyboard_focus)
{
    ImGui::PushAllowKeyboardFocus(allow_keyboard_focus);
}

void GDImGui::pop_allow_keyboard_focus()
{
    ImGui::PopAllowKeyboardFocus();
}

void GDImGui::set_window_size(String name, Vector2 size, int condition)
{
    ALLOC_STRING(c_name, name)

    ImGui::SetWindowSize(c_name, to_imgui_vec2(size), condition);

    FREE_STRING(c_name)
}

void GDImGui::set_window_collapsed(String name, bool collapsed, int condition)
{
    ALLOC_STRING(c_name, name)

    ImGui::SetWindowCollapsed(c_name, collapsed, condition);

    FREE_STRING(c_name)
}

void GDImGui::set_window_focus(String name)
{
    ALLOC_STRING(c_name, name)

    ImGui::SetWindowFocus(c_name);

    FREE_STRING(c_name)
}

void GDImGui::set_next_window_pos(Vector2 pos, int condition, Vector2 pivot)
{
    ImGui::SetNextWindowPos(to_imgui_vec2(pos), condition, to_imgui_vec2(pivot));
}

void GDImGui::set_next_window_size(Vector2 size, int condition)
{
    ImGui::SetNextWindowSize(to_imgui_vec2(size), condition);
}

void GDImGui::set_next_window_bg_alpha(float alpha)
{
    ImGui::SetNextWindowBgAlpha(alpha);
}

void GDImGui::set_window_font_scale(float scale)
{
    ImGui::SetWindowFontScale(scale);
}

void GDImGui::push_id(int id)
{
    ImGui::PushID(id);
}

void GDImGui::pop_id()
{
    ImGui::PopID();
}

void GDImGui::same_line(float offset_from_start_x, float spacing_w)
{
    ImGui::SameLine(offset_from_start_x, spacing_w);
}

void GDImGui::indent(float indent_w)
{
    ImGui::Indent(indent_w);
}

void GDImGui::unindent(float indent_w)
{
    ImGui::Unindent(indent_w);
}

void GDImGui::set_next_item_width(float item_width)
{
    ImGui::SetNextItemWidth(item_width);
}

void GDImGui::push_item_width(float item_width)
{
    ImGui::PushItemWidth(item_width);
}

void GDImGui::pop_item_width()
{
    ImGui::PopItemWidth();
}

float GDImGui::calc_item_width()
{
    return ImGui::CalcItemWidth();
}

float GDImGui::get_text_line_height()
{
    return ImGui::GetTextLineHeight();
}

float GDImGui::get_text_line_height_with_spacing()
{
    return ImGui::GetTextLineHeightWithSpacing();
}

float GDImGui::get_frame_height()
{
    return ImGui::GetFrameHeight();
}

float GDImGui::get_frame_height_with_spacing()
{
    return ImGui::GetFrameHeightWithSpacing();
}

void GDImGui::begin_group()
{
    ImGui::BeginGroup();
}

void GDImGui::end_group()
{
    ImGui::EndGroup();
}

bool GDImGui::is_popup_open(String id, int flags)
{
    ALLOC_STRING(c_id, id)

    bool v = ImGui::IsPopupOpen(c_id, flags);

    FREE_STRING(c_id)

    return v;
}

void GDImGui::open_popup(String id, int flags)
{
    ALLOC_STRING(c_id, id)

    ImGui::OpenPopup(c_id, flags);

    FREE_STRING(c_id)
}

void GDImGui::close_current_popup()
{
    ImGui::CloseCurrentPopup();
}

bool GDImGui::begin_popup(String id, int flags)
{
    ALLOC_STRING(c_id, id)

    bool v = ImGui::BeginPopup(c_id, flags);

    FREE_STRING(c_id)

    return v;
}

bool GDImGui::begin_popup_modal(String name, bool open, int flags)
{
    ALLOC_STRING(c_name, name)

    bool v = ImGui::BeginPopupModal(c_name, &open, flags);

    FREE_STRING(c_name)

    return open;
}

void GDImGui::end_popup()
{
    ImGui::EndPopup();
}

void GDImGui::open_popup_on_item_click(String id, int flags)
{
    ALLOC_STRING(c_id, id)

    ImGui::OpenPopupOnItemClick(c_id, flags);

    FREE_STRING(c_id)
}

bool GDImGui::begin_popup_context_item(String id, int flags)
{
    ALLOC_STRING(c_id, id)

    bool v = ImGui::BeginPopupContextItem(c_id, flags);

    FREE_STRING(c_id)

    return v;
}

bool GDImGui::begin_popup_context_window(String id, int flags)
{
    ALLOC_STRING(c_id, id)

    bool v = ImGui::BeginPopupContextWindow(c_id, flags);

    FREE_STRING(c_id)

    return v;
}

bool GDImGui::begin_popup_context_void(String id, int flags)
{
    ALLOC_STRING(c_id, id)

    bool v = ImGui::BeginPopupContextVoid(c_id, flags);

    FREE_STRING(c_id)

    return v;
}

void GDImGui::log_text(String text)
{
    ALLOC_STRING(c_text, text)

    ImGui::LogText(c_text);

    FREE_STRING(c_text)
}

void GDImGui::log_to_tty(int auto_open_depth)
{
    ImGui::LogToTTY(auto_open_depth);
}

void GDImGui::log_to_file(int auto_open_depth, String file_name)
{
    ALLOC_STRING(c_file, file_name)

    ImGui::LogToFile(auto_open_depth, c_file);

    FREE_STRING(c_file)
}

void GDImGui::log_to_clipboard(int auto_open_depth)
{
    ImGui::LogToClipboard(auto_open_depth);
}

void GDImGui::log_finish()
{
    ImGui::LogFinish();
}

void GDImGui::log_buttons()
{
    ImGui::LogButtons();
}

bool GDImGui::begin_table(String id, int columns_count, int flags, Vector2 outer_size, float inner_width)
{
    ALLOC_STRING(c_id, id)

    bool v = ImGui::BeginTable(c_id, columns_count, flags, to_imgui_vec2(outer_size), inner_width);

    FREE_STRING(c_id)

    return v;
}

void GDImGui::end_table()
{
    ImGui::EndTable();
}

void GDImGui::table_setup_column(String label, int flags, float init_width_or_weight, unsigned int user_id)
{
    ALLOC_STRING(c_label, label)

    ImGui::TableSetupColumn(c_label, flags, init_width_or_weight, user_id);

    FREE_STRING(c_label)
}

void GDImGui::table_setup_scroll_freeze(int columns, int rows)
{
    ImGui::TableSetupScrollFreeze(columns, rows);
}

void GDImGui::table_set_bg_color(int target, Color color, int column_n)
{
    ImGui::TableSetBgColor(target, ImGui::ColorConvertFloat4ToU32(to_imgui_color(color)), column_n);
}

int GDImGui::table_get_row_index()
{
    return ImGui::TableGetRowIndex();
}

void GDImGui::table_next_row(int row_flags, float row_min_height)
{
    ImGui::TableNextRow(row_flags, row_min_height);
}

bool GDImGui::table_set_column_index(int column_n)
{
    return ImGui::TableSetColumnIndex(column_n);
}

bool GDImGui::table_next_column()
{
    return ImGui::TableNextColumn();
}

void GDImGui::table_headers_row()
{
    ImGui::TableHeadersRow();
}

void GDImGui::table_header(String label)
{
    ALLOC_STRING(c_label, label)

    ImGui::TableHeader(c_label);

    FREE_STRING(c_label)
}

int GDImGui::get_column_index()
{
    return ImGui::GetColumnIndex();
}

int GDImGui::get_columns_count()
{
    return ImGui::GetColumnsCount();
}

float GDImGui::get_column_offset(int column_index)
{
    return ImGui::GetColumnOffset(column_index);
}

float GDImGui::get_column_width(int column_index)
{
    return ImGui::GetColumnWidth(column_index);
}

void GDImGui::set_column_width(int column_index, float width)
{
    ImGui::SetColumnWidth(column_index, width);
}

void GDImGui::set_column_offset(int column_index, float offset)
{
    ImGui::SetColumnOffset(column_index, offset);
}

Vector2 GDImGui::get_content_region_avail()
{
    ImVec2 &v = ImGui::GetContentRegionAvail();

    return Vector2(v.x, v.y);
}

void GDImGui::next_column()
{
    ImGui::NextColumn();
}

void GDImGui::columns(int columns_count, String id, bool border)
{
    ALLOC_STRING(c_id, id)

    ImGui::Columns(columns_count, c_id, border);

    FREE_STRING(c_id)
}

void GDImGui::push_style_color(int idx, Color color)
{
    ImGui::PushStyleColor(idx, to_imgui_color(color));
}

void GDImGui::pop_style_color(int count)
{
    ImGui::PopStyleColor(count);
}

void GDImGui::set_tooltip(String text)
{
    ALLOC_STRING(c_text, text)

    ImGui::SetTooltip(c_text);

    FREE_STRING(c_text)
}