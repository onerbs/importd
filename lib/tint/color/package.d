module lib.tint.color;

import lib.tint.color.mode;
import lib.tint.color.value;

/// The Color class.
class Color {

  /// The foreground Value of this Color.
  Value fore;

  /// The background Value of this Color.
  Value back;

  /// The default constructor.
  this() { this(-1); }

  /// The parametrized constructor.
  this(int k) {
    import lib.tools : unit, tent;
    fore = new Value(38);
    back = new Value(48);
    for (int i = 0; i < NOF_MODES; i++) {
      modes[i] = new Mode(Modes.NONE);
    }
    const int code = unit(k);
    switch (tent(k)) {
      case 30: case  90: fore.set(code); break;
      case 40: case 100: back.set(code); break;
      default: if (code >= 0 && code <= 7) fore.set(code); break;
    }
  }

  /// Toggles the `bold` mode.
  Color bold()      { toggleMode(Modes.BOLD);      return this; }

  /// Toggles the `faint` mode.
  Color faint()     { toggleMode(Modes.FAINT);     return this; }

  /// Toggles the `italic` mode.
  Color italic()    { toggleMode(Modes.ITALIC);    return this; }

  /// Toggles the `underline` mode.
  Color underline() { toggleMode(Modes.UNDERLINE); return this; }

  /// Toggles the `blink` mode.
  Color blink()     { toggleMode(Modes.BLINK);     return this; }

  /// Toggles the `invert` mode.
  Color invert()    { toggleMode(Modes.INVERT);    return this; }

  /// Toggles the `hidden` mode.
  Color hidden()    { toggleMode(Modes.HIDDEN);    return this; }

  /// Reset this Color.
  Color clean() { fore.set(8); back.set(8);
    for (int i = 0; i < NOF_MODES; i++) modes[i].set(6);
    return this;
  }

  /// Returns the string representation of this Color.
  // ! Color.toString() call {Mod, Value}.toString()
  override string toString() const {
    import std.array : join;
    string[] parts;
    foreach (mod; modes) {
      if (mod.toString() == "") continue;
      else parts ~= mod.toString();
    }
    if (fore.toString() != "") parts ~= fore.toString();
    if (back.toString() != "") parts ~= back.toString();
    return parts.join(";");
  }

private:
  /// The maximum number of Modes this Color can handle. (7)
  static const ubyte NOF_MODES = 7;

  /// The modes of this Color.
  // bold / dim / italic / ...
  Mode[NOF_MODES] modes;

  /// Toggles the specified mod
  void toggleMode(int code) {
    switch (code) {
      case 1: toggle(0, 1); break;
      case 2: toggle(1, 2); break;
      case 3: toggle(2, 3); break;
      case 4: toggle(3, 4); break;
      case 5: toggle(4, 5); break;
      case 7: toggle(5, 7); break;
      case 8: toggle(6, 8); break;
      default: break;
    }
  }

  /// i: index; c: new code
  void toggle(int i, int c) {
    if (modes[i].eq(6)) modes[i].set(c);
    else                modes[i].set(6);
  }
}
