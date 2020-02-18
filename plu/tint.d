module plu.tint;

import lib.tint.color;

/// The Tint class.
struct Tint {

  /// Set this Tinted text to black foreground color.
  Tint black() {   color.fg.set(0); return this; }

  /// Set this Tinted text to red foreground color.
  Tint red() {     color.fg.set(1); return this; }

  /// Set this Tinted text to green foreground color.
  Tint green() {   color.fg.set(2); return this; }

  /// Set this Tinted text to yellow foreground color.
  Tint yellow() {  color.fg.set(3); return this; }

  /// Set this Tinted text to blue foreground color.
  Tint blue() {    color.fg.set(4); return this; }

  /// Set this Tinted text to magenta foreground color.
  Tint magenta() { color.fg.set(5); return this; }

  /// Set this Tinted text to cyan foreground color.
  Tint cyan() {    color.fg.set(6); return this; }

  /// Set this Tinted text to gray foreground color.
  Tint gray() {    color.fg.set(7); return this; }


  /// Set this Tinted text to black foreground color.
  Tint bright_black() {   color.fg.bright(0); return this; }

  /// Set this Tinted text to red foreground color.
  Tint bright_red() {     color.fg.bright(1); return this; }

  /// Set this Tinted text to green foreground color.
  Tint bright_green() {   color.fg.bright(2); return this; }

  /// Set this Tinted text to yellow foreground color.
  Tint bright_yellow() {  color.fg.bright(3); return this; }

  /// Set this Tinted text to blue foreground color.
  Tint bright_blue() {    color.fg.bright(4); return this; }

  /// Set this Tinted text to magenta foreground color.
  Tint bright_magenta() { color.fg.bright(5); return this; }

  /// Set this Tinted text to cyan foreground color.
  Tint bright_cyan() {    color.fg.bright(6); return this; }

  /// Set this Tinted text to gray foreground color.
  Tint bright_gray() {    color.fg.bright(7); return this; }


  /// Set this Tinted text to black background color.
  Tint on_black() {   color.bg.set(0); return this; }

  /// Set this Tinted text to red background color.
  Tint on_red() {     color.bg.set(1); return this; }

  /// Set this Tinted text to green background color.
  Tint on_green() {   color.bg.set(2); return this; }

  /// Set this Tinted text to yellow background color.
  Tint on_yellow() {  color.bg.set(3); return this; }

  /// Set this Tinted text to blue background color.
  Tint on_blue() {    color.bg.set(4); return this; }

  /// Set this Tinted text to magenta background color.
  Tint on_magenta() { color.bg.set(5); return this; }

  /// Set this Tinted text to cyan background color.
  Tint on_cyan() {    color.bg.set(6); return this; }

  /// Set this Tinted text to gray background color.
  Tint on_gray() {    color.bg.set(7); return this; }


  /// Set this Tinted text to black background color.
  Tint on_bright_black() {   color.bg.bright(0); return this; }

  /// Set this Tinted text to red background color.
  Tint on_bright_red() {     color.bg.bright(1); return this; }

  /// Set this Tinted text to green background color.
  Tint on_bright_green() {   color.bg.bright(2); return this; }

  /// Set this Tinted text to yellow background color.
  Tint on_bright_yellow() {  color.bg.bright(3); return this; }

  /// Set this Tinted text to blue background color.
  Tint on_bright_blue() {    color.bg.bright(4); return this; }

  /// Set this Tinted text to magenta background color.
  Tint on_bright_magenta() { color.bg.bright(5); return this; }

  /// Set this Tinted text to cyan background color.
  Tint on_bright_cyan() {    color.bg.bright(6); return this; }

  /// Set this Tinted text to gray background color.
  Tint on_bright_gray() {    color.bg.bright(7); return this; }


  /// Apply the bold modifier to this Tint.
  Tint bold()      { color.bold();      return this; }

  /// Apply the faint modifier to this Tint.
  Tint faint()     { color.faint();     return this; }

  /// Apply the italic modifier to this Tint.
  Tint italic()    { color.italic();    return this; }

  /// Apply the underline modifier to this Tint.
  Tint underline() { color.underline(); return this; }

  /// Apply the blink modifier to this Tint.
  Tint blink()     { color.blink();     return this; }

  /// Apply the invert modifier to this Tint.
  Tint invert()    { color.invert();    return this; }

  /// Apply the hidden modifier to this Tint.
  Tint hidden()    { color.hidden();    return this; }


  /// The string representation of this Tint.
  string toString() const {
    import std.string : fmt = format;
    return fmt("\033[%sm%s\033[0m", color, text);
  }

  /// Create a new Tint.
  this(string _text) {
    color = new Color();
    text = _text;
  }

  /// The tinted text.
  private string text;

  /// The Color of this Tint.
  private Color color;

}
