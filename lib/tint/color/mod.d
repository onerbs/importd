module lib.tint.color.mod;

import std.string : fmt = format;

/// The Mod Type.
class Mod {

  /// The code of this Mod.
  private int code;

  /// Default constructor.
  this(int c) { code = c; }

  /// Change the Mod's code.
  void set(int c) { code = c; }

  /// Check wether this Mod is N od not.
  bool eq(int n) { return code == n; }

  /// The string representation of this Mod.
  override string toString() const {
    return (code == 6 || code < 1 || code > 8) ? "" : fmt("0%d", code);
  }

}
