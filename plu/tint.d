module plu.tint;

import lib.tint.color;
import plu.random;

/// The Tint class.
struct Tint {

  /// Set this Tinted text to black foreground color.
  Tint black() {   color.fore.set(0); return this; }

  /// Set this Tinted text to red foreground color.
  Tint red() {     color.fore.set(1); return this; }

  /// Set this Tinted text to green foreground color.
  Tint green() {   color.fore.set(2); return this; }

  /// Set this Tinted text to yellow foreground color.
  Tint yellow() {  color.fore.set(3); return this; }

  /// Set this Tinted text to blue foreground color.
  Tint blue() {    color.fore.set(4); return this; }

  /// Set this Tinted text to magenta foreground color.
  Tint magenta() { color.fore.set(5); return this; }

  /// Set this Tinted text to cyan foreground color.
  Tint cyan() {    color.fore.set(6); return this; }

  /// Set this Tinted text to gray foreground color.
  Tint gray() {    color.fore.set(7); return this; }

  /// Set this Tinted text to gray foreground color.
  Tint random() {  color.fore.set(_int(7)); return this; }


  /// Set this Tinted text to black foreground color.
  Tint bright_black() {   color.fore.bright(0); return this; }

  /// Set this Tinted text to red foreground color.
  Tint bright_red() {     color.fore.bright(1); return this; }

  /// Set this Tinted text to green foreground color.
  Tint bright_green() {   color.fore.bright(2); return this; }

  /// Set this Tinted text to yellow foreground color.
  Tint bright_yellow() {  color.fore.bright(3); return this; }

  /// Set this Tinted text to blue foreground color.
  Tint bright_blue() {    color.fore.bright(4); return this; }

  /// Set this Tinted text to magenta foreground color.
  Tint bright_magenta() { color.fore.bright(5); return this; }

  /// Set this Tinted text to cyan foreground color.
  Tint bright_cyan() {    color.fore.bright(6); return this; }

  /// Set this Tinted text to gray foreground color.
  Tint bright_gray() {    color.fore.bright(7); return this; }

  /// Set this Tinted text to gray foreground color.
  Tint bright_random() {  color.fore.bright(_int(7)); return this; }


  /// Set this Tinted text to black background color.
  Tint on_black() {   color.back.set(0); return this; }

  /// Set this Tinted text to red background color.
  Tint on_red() {     color.back.set(1); return this; }

  /// Set this Tinted text to green background color.
  Tint on_green() {   color.back.set(2); return this; }

  /// Set this Tinted text to yellow background color.
  Tint on_yellow() {  color.back.set(3); return this; }

  /// Set this Tinted text to blue background color.
  Tint on_blue() {    color.back.set(4); return this; }

  /// Set this Tinted text to magenta background color.
  Tint on_magenta() { color.back.set(5); return this; }

  /// Set this Tinted text to cyan background color.
  Tint on_cyan() {    color.back.set(6); return this; }

  /// Set this Tinted text to gray background color.
  Tint on_gray() {    color.back.set(7); return this; }

  /// Set this Tinted text to gray background color.
  Tint on_random() {  color.back.set(_int(7)); return this; }


  /// Set this Tinted text to black background color.
  Tint on_bright_black() {   color.back.bright(0); return this; }

  /// Set this Tinted text to red background color.
  Tint on_bright_red() {     color.back.bright(1); return this; }

  /// Set this Tinted text to green background color.
  Tint on_bright_green() {   color.back.bright(2); return this; }

  /// Set this Tinted text to yellow background color.
  Tint on_bright_yellow() {  color.back.bright(3); return this; }

  /// Set this Tinted text to blue background color.
  Tint on_bright_blue() {    color.back.bright(4); return this; }

  /// Set this Tinted text to magenta background color.
  Tint on_bright_magenta() { color.back.bright(5); return this; }

  /// Set this Tinted text to cyan background color.
  Tint on_bright_cyan() {    color.back.bright(6); return this; }

  /// Set this Tinted text to gray background color.
  Tint on_bright_gray() {    color.back.bright(7); return this; }

  /// Set this Tinted text to gray background color.
  Tint on_bright_random() {  color.back.bright(_int(7)); return this; }


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


  /// Set text
  Tint set(string text) {
    this.text = text;
    return this;
  }

  /// Append the specified text to the begining of the tinted text.
  Tint pre(string text) {
    return set(text ~ this.text);
  }

  /// Append the specified text to the begining of the tinted text.
  Tint add(string text) {
    return set(this.text ~ text);
  }


  /// Initialize from text.
  this(string text) {
    this.text = text;
    color = new Color();
  }

  /// The Color of this Tint.
  private Color color;

  /// The tinted text.
  private string text;

  /// The string representation of this Tint.
  string toString() const {
    import std.string : fmt = format;
    return fmt("\033[%sm%s\033[0m", color, text);
  }

}
