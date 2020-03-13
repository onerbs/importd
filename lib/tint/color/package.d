module lib.tint.color;

import lib.tint.color.mode;
import lib.tint.color.value;

/// The Color class.
class Color {

  /// The foreground Value of this Color.
  Value fg;

  /// The background Value of this Color.
  Value bg;

  /// The default constructor.
  this() { this(-1); }

  /// The parametrized constructor.
  this(int code) {
    fg = new Value(38);
    bg = new Value(48);
    for (int i = 0; i < MAX_MODES; i++) {
      modes[i] = new Mode(Modes.NONE);
    }
    const int uCode = unit(code);
    switch (tent(code)) {
      case 30: case  90: fg.set(uCode); break;
      case 40: case 100: bg.set(uCode); break;
      default: if (uCode >= 0 && uCode <= 7) fg.set(uCode); break;
    }
  }

  /// Adds the `bold` mod to the modlist. (increased intensity)
  Color bold()      { _toggle_(Modes.BOLD);      return this; }

  /// Adds the `faint` mod to the modlist. (decreased intensity)
  Color faint()     { _toggle_(Modes.FAINT);     return this; }

  /// Adds the `italic` mod to the modlist.
  Color italic()    { _toggle_(Modes.ITALIC);    return this; }

  /// Adds the `underline` mod to the modlist.
  Color underline() { _toggle_(Modes.UNDERLINE); return this; }

  /// Adds the `blink` mod to the modlist.
  Color blink()     { _toggle_(Modes.BLINK);     return this; }

  /// Adds the `invert` mod to the modlist.
  Color invert()    { _toggle_(Modes.INVERT);    return this; }

  /// Adds the `hidden` mod to the modlist.
  Color hidden()    { _toggle_(Modes.HIDDEN);    return this; }

  /// Reset this Color.
  Color clean() {
    fg.set(8);
    bg.set(8);
    for (int i = 0; i < MAX_MODES; i++) modes[i].set(6);
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
    if (fg.toString() != "") parts ~= fg.toString();
    if (bg.toString() != "") parts ~= bg.toString();
    return parts.join(";");
  }

  private {
    /// The maximum number of Modes this Color can handle. (7)
    static const ubyte MAX_MODES = 7;

    /// The modes of this Color.
    // bold / dim / italic / ...
    Mode[MAX_MODES] modes;

    /// Toggles the specified mod
    void _toggle_(int code) {
      switch (code) {
        case 1: _toggleAt(0, 1); break;
        case 2: _toggleAt(1, 2); break;
        case 3: _toggleAt(2, 3); break;
        case 4: _toggleAt(3, 4); break;
        case 5: _toggleAt(4, 5); break;
        case 7: _toggleAt(5, 7); break;
        case 8: _toggleAt(6, 8); break;
        default: break;
      }
    }

    /// i: index; c: new code
    void _toggleAt(int i, int c) {
      if (modes[i].eq(6)) modes[i].set(c);
      else                modes[i].set(6);
    }
  }
}

private static:
  /// returns the units of number. 37 ret 7
  int unit(int N) {
    while (N > 10) N -= 10;
    return N;
  }
  /// returns the tens of number. 37 ret 30
  int tent(int N) {
    if (N < 10) return 0;
    return N - unit(N);
  }
