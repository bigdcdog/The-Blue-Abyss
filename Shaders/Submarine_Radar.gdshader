shader_type spatial;
render_mode unshaded;

uniform vec2 radar_points[32];
uniform int point_count = 0;

uniform vec3 dot_color : source_color = vec3(0.1, 1.0, 0.3);

uniform float dot_radius = 0.015;
uniform float flicker_speed = 8.0;

void fragment() {
	float brightness = 0.0;
	
	for (int i = 0; i < 32; i++) {
		if (i >= point_count) {
			break;
		}
		float d = distance(UV, radar_points[i]);
		
		float dot = 1.0 - smoothstep(dot_radius * 0.6,dot_radius,d);
		
		float flicker = 0.2 + 0.8 * step(0.35,fract(TIME * flicker_speed + float(i) * 0.37));
		brightness = max(brightness, dot * flicker);
		
	ALBEDO = dot_color * brightness;
	EMISSION = dot_color * brightness;
	}
}