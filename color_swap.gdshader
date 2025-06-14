shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture;
uniform int mode = 0;

void fragment() {
    vec4 px = texture(screen_texture, SCREEN_UV);

    // Change white (pure white or near white) to yellow
    if (px.r > 0.95 && px.g > 0.95 && px.b > 0.95) {
        px.rgb = vec3(1.0, 1.0, 0.0); // Yellow
    }

    // Apply mode-based color manipulation
    if (mode == 1) { px = px.gbra; }
    if (mode == 2) { px = px.brga; }
    if (mode == 3) { px = px.bgra; }

    COLOR = vec4(px.rgb, 1.0);
}
