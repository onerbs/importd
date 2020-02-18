module lib.tint.color;

import lib.tint.color.mod;
import lib.tint.color.value;

/// The Color class.
class Color {

  /// The foreground Value of this Color.
  Value fg;

  /// The background Value of this Color.
  Value bg;

  /// Default constructor
  this() { this(-1); }

  /// The constructor.
  this(int code) {
    fg = new Value(38);
    bg = new Value(48);
    for (int i = 0; i < MAX_MODS; i++) {
      _mods_[i] = new Mod(MOD_NONE);
    }
    const int uCode = unit(code);
    switch (tent(code)) {
      case 30: case  90: fg.set(uCode); break;
      case 40: case 100: bg.set(uCode); break;
      default: if (uCode >= 0 && uCode <= 7) fg.set(uCode); break;
    }
  }

  /// Adds the `bold` mod to the modlist. (increased intensity)
  Color bold()      { _toggle_(MOD_BOLD);      return this; }

  /// Adds the `faint` mod to the modlist. (decreased intensity)
  Color faint()     { _toggle_(MOD_FAINT);     return this; }

  /// Adds the `italic` mod to the modlist.
  Color italic()    { _toggle_(MOD_ITALIC);    return this; }

  /// Adds the `underline` mod to the modlist.
  Color underline() { _toggle_(MOD_UNDERLINE); return this; }

  /// Adds the `blink` mod to the modlist.
  Color blink()     { _toggle_(MOD_BLINK);     return this; }

  /// Adds the `invert` mod to the modlist.
  Color invert()    { _toggle_(MOD_INVERT);    return this; }

  /// Adds the `hidden` mod to the modlist.
  Color hidden()    { _toggle_(MOD_HIDDEN);    return this; }

  /// Reset this Color.
  Color clean() {
    fg.set(8);
    bg.set(8);
    for (int i = 0; i < MAX_MODS; i++) _mods_[i].set(6);
    return this;
  }


  /// Returns the string representation of this Color.
  // ! Color.toString() call {Mod, Value}.toString()
  override string toString() const {
    string[] parts;
    foreach (mod; _mods_) {
      if (mod.toString() == "") continue;
      else parts ~= mod.toString();
    }
    if (fg.toString() != "") parts ~= fg.toString();
    if (bg.toString() != "") parts ~= bg.toString();
    return join(parts, ";");
  }

  private {
    /// The maximim number of Mods can handle. (7)
    static const ubyte MAX_MODS = 7;

    /// The modifiers of this Color.
    // bold / dim / italic / ...
    Mod[MAX_MODS] _mods_;

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
      if (_mods_[i].eq(6)) _mods_[i].set(c);
      else                 _mods_[i].set(6);
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
  string join(string[] array, string joiner) {
    string result;
    for (int i = 0; i < array.length; i++)
      result ~= array[i] ~ ((i + 1 < array.length) ? joiner : "");
    return result;
  }
  const:
    /// 1: bold
    int MOD_BOLD      = 1;
    /// 2: faint
    int MOD_FAINT     = 2;
    /// 3: italic
    int MOD_ITALIC    = 3;
    /// 4: underline
    int MOD_UNDERLINE = 4;
    /// 5: blink
    int MOD_BLINK     = 5;
    /// 6: none
    int MOD_NONE      = 6;
    /// 7: invert
    int MOD_INVERT    = 7;
    /// 8: hidden
    int MOD_HIDDEN    = 8;
