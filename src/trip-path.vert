attribute vec3 position;
attribute vec3 color;
attribute float startTime;
attribute float duration;

varying vec4 fragColor;

uniform mat4 projection;
uniform mat4 view;
uniform float elapsed;
uniform float arcHeight;
uniform float pathAlpha;

void main() {
  float middle = startTime + duration / 2.0;
  float endTime = startTime + duration;
  float buf = 200.0;
  float t;
  if (elapsed < middle) {
    t = smoothstep(startTime - buf / 2.0, middle, elapsed);
  } else {
    t = 1.0 - smoothstep(middle, endTime + buf, elapsed);
  }
  float w = 1.0;
  if (t == 0.0) {
    w = 0.0;
  }
  float z = position.z * arcHeight;
  fragColor = vec4(color.rgb, t / 1.3 * pathAlpha);
  gl_Position = projection * view * vec4(position.xy, z, w);
}
