module plu.tint;
import lib.tint.color;

/// The Tint class.
struct Tint {

  /// Tint the foreground in black.
  Tint black() {
    color.fg.black();
    return this;
  }

  /// Tint the foreground in red.
  Tint red() {
    color.fg.red();
    return this;
  }

  /// Tint the foreground in green.
  Tint green() {
    color.fg.green();
    return this;
  }

  /// Tint the foreground in yellow.
  Tint yellow() {
    color.fg.yellow();
    return this;
  }

  /// Tint the foreground in cyan.
  Tint cyan() {
    color.fg.cyan();
    return this;
  }

  /// Tint the foreground in magenta.
  Tint magenta() {
    color.fg.magenta();
    return this;
  }

  /// Tint the foreground in blue.
  Tint blue() {
    color.fg.blue();
    return this;
  }

  /// Tint the foreground in white.
  Tint white() {
    color.fg.white();
    return this;
  }

  /// Tint the foreground in random color.
  Tint random() {
    color.fg.random();
    return this;
  }


  /// Tint the background in black.
  Tint over_black() {
    color.bg.black();
    return this;
  }

  /// Tint the background in red.
  Tint over_red() {
    color.bg.red();
    return this;
  }

  /// Tint the background in green.
  Tint over_green() {
    color.bg.green();
    return this;
  }

  /// Tint the background in yellow.
  Tint over_yellow() {
    color.bg.yellow();
    return this;
  }

  /// Tint the background in blue.
  Tint over_blue() {
    color.bg.blue();
    return this;
  }

  /// Tint the background in magenta.
  Tint over_magenta() {
    color.bg.magenta();
    return this;
  }

  /// Tint the background in cyan.
  Tint over_cyan() {
    color.bg.cyan();
    return this;
  }

  /// Tint the background in white.
  Tint over_white() {
    color.bg.white();
    return this;
  }

  /// Tint the background in random color.
  Tint over_random() {
    color.bg.random();
    return this;
  }


  /// Apply the bold modifier to this Tint.
  Tint bold() {
    color.bold();
    return this;
  }

  /// Apply the faint modifier to this Tint.
  Tint faint() {
    color.faint();
    return this;
  }

  /// Apply the italic modifier to this Tint.
  Tint italic() {
    color.italic();
    return this;
  }

  /// Apply the underline modifier to this Tint.
  Tint underline() {
    color.underline();
    return this;
  }

  /// Apply the blink modifier to this Tint.
  Tint blink() {
    color.blink();
    return this;
  }

  /// Apply the rapid_blink modifier to this Tint.
  Tint rapid_blink() {
    color.rapid_blink();
    return this;
  }

  /// Apply the invert modifier to this Tint.
  Tint invert() {
    color.invert();
    return this;
  }

  /// Apply the hidden modifier to this Tint.
  Tint hidden() {
    color.hidden();
    return this;
  }

  /// Apply the strike modifier to this Tint.
  Tint strike() {
    color.strike();
    return this;
  }

  /// Set the tinted text.
  /// text: The text to be tinted.
  Tint set(string text) {
    this.text = text;
    return this;
  }
  /// The set unittest.
  unittest {
    auto test = Tint();
    test.set("ABCDE");
    assert(test.text == "ABCDE");
  }

  /// Append the specified text to the begining of the tinted text.
  Tint pre(string text) {
    return set(text ~ this.text);
  }
  /// The pre unittest.
  unittest {
    auto test = Tint("CDE");
    test.pre("AB");
    assert(test.text == "ABCDE");
  }

  /// Append the specified text to the end of the tinted text.
  Tint add(string text) {
    return set(this.text ~ text);
  }
  /// The add unittest.
  unittest {
    auto test = Tint("AB");
    test.add("CDE");
    assert(test.text == "ABCDE");
  }

  /// Initialize from string.
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
