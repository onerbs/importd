module lib.tint.color.mode;

/// The Mode Type.
class Mode {

  /// The code of this Mode.
  private int code;

  /// The default constructor.
  this(int k) { code = k; }

  /// Change the Mode's code.
  void set(int k) { code = k; }

  /// Check if the value of this Mode is the provided value.
  bool eq(int k) { return code == k; }

  /// The string representation of this Mode.
  /// It will return an empty string if the code is not 0-5, 7 or 8.
  override string toString() const {
    import std.string : fmt = format;
    return (code == 6 || code < 1 || code > 8) ? "" : fmt("0%d", code);
  }

}

/// The Modes enumeration.
enum Modes : int {
  /// 1: bold
  BOLD      = 1,
  /// 2: faint
  FAINT     = 2,
  /// 3: italic
  ITALIC    = 3,
  /// 4: underline
  UNDERLINE = 4,
  /// 5: blink
  BLINK     = 5,
  /// 6: none
  NONE      = 6,
  /// 7: invert
  INVERT    = 7,
  /// 8: hidden
  HIDDEN    = 8,
}
