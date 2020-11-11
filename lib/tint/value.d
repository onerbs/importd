module lib.tint.value;
import plu.rnd;

/// The Value Type.
class Value {
  /// This Value's base.
  /// 30: foreground
  /// 40: background
  private int tent;

  /// This Value's value. [0-7]
  /// 0: white
  /// 1: red
  /// 2: green
  /// 3: yellow
  /// 4: blue
  /// 5: magenta
  /// 6: cyan
  /// 7: black
  int unit;

  /// Initialize parsing provided value.
  this(byte tent, byte unit) {
    this.tent = tent * 10;
    this.unit = unit;
  }

  void black() {
    unit = 0;
  }

  void red() {
    unit = 1;
  }

  void green() {
    unit = 2;
  }

  void yellow() {
    unit = 3;
  }

  void blue() {
    unit = 4;
  }

  void magenta() {
    unit = 5;
  }

  void cyan() {
    unit = 6;
  }

  void white() {
    unit = 7;
  }

  void random() {
    unit = rnd(7);
  }

  /// The string representation of this Value.
  override string toString() const {
    import std.conv : to;

    return to!string(tent + unit);
  }
}
