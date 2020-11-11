module lib.tint.color;
import lib.tint.value;

/// The Color class.
class Color {
  /// The foreground Value of this Color.
  Value fg;

  /// The background Value of this Color.
  Value bg;

  /// The default constructor.
  this() {
    fg = new Value(3, 9);
    bg = new Value(4, 9);
    for (int i = 0; i < NOF_MODES; i++) {
      modes[i] = false;
    }
  }

  /// Toggles the `bold` mode.
  void bold() {
    toggleMode(0);
  }

  /// Toggles the `faint` mode.
  void faint() {
    toggleMode(1);
  }

  /// Toggles the `italic` mode.
  void italic() {
    toggleMode(2);
  }

  /// Toggles the `underline` mode.
  void underline() {
    toggleMode(3);
  }

  /// Toggles the `blink` mode.
  void blink() {
    toggleMode(4);
  }

  /// Toggles the `rapid_blink` mode.
  void rapid_blink() {
    toggleMode(5);
  }

  /// Toggles the `invert` mode.
  void invert() {
    toggleMode(6);
  }

  /// Toggles the `hidden` mode.
  void hidden() {
    toggleMode(7);
  }

  /// Toggles the `strike` mode.
  void strike() {
    toggleMode(8);
  }

  /// Returns the string representation of this Color.
  override string toString() const {
    import std.array : join;
    import std.conv : to;

    string[] parts;
    for (int i = 0; i < NOF_MODES; i++) {
      if (modes[i]) {
        parts ~= to!string(i);
      }
    }
    if (fg.unit < 9) {
      parts ~= fg.toString();
    }
    if (bg.unit < 9) {
      parts ~= bg.toString();
    }
    return parts.join(";");
  }

private:
  /// The maximum number of Modes this Color can handle. (9)
  static const ubyte NOF_MODES = 9;

  /// The modes of this Color.
  //// bold / dim / italic / ...
  bool[NOF_MODES] modes;

  /// Toggles the specified mode.
  void toggleMode(int mode) {
    modes[mode] = !modes[mode];
  }
}
