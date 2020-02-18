module lib.tint.color.value;

/// The Value Type.
class Value {

  /// This Value's factor. 30 = fore; 40 = back;
  private int base;

  /// This Value's value. [0-7]
  //0:black, 1:red,     2:green, 3:yellow,
  //4:blue,  5:magenta, 6:cyan,  7:gray
  private int code;

  /// Default constructor
  this() { this(-1); }

  /// Initialize parsing provided value.
  this(int value) {
    switch (unit(value)) {
      case  0: .. case  7: code = unit(value); break;
      default:             code = 8;           break;
    }
    switch (tent(value)) {
      case 30:    case 40: base = tent(value); break;
      default:             base = 30;          break;
    }
  }

  /// Set the Value's code to the provided one.
  Value dim() {
    if (base > 65) base -= 60;
    return this;
  }

  /// Set the Value's code to the provided one.
  Value set(int _code) {
    code = unit(_code);
    return dim();
  }

  /// Set the Value's code to the bright version of the provided one.
  Value bright() {
    if (base < 65) base += 60;
    return this;
  }

  /// Set the Value's code to the bright version of the provided one.
  Value bright(int _code) {
    code = unit(_code);
    return bright();
  }

  /// True if code is between 0 and 7.
  private bool hasValidCode() const {
    return (code >= 0 && code <= 7);
  }

  /// The string representation of this Value.
  override string toString() const {
    if (!hasValidCode()) return "";
    import std.string : format;
    return format("%d", base + code);
  }

}

private static:
  /// returns the units of number. 37 ret 7
  int unit(int N) {
    while (N >= 10) N -= 10;
    return N;
  }
  /// returns the tens of number. 37 ret 30
  int tent(int N) {
    if (N < 10) return 0;
    return N - unit(N);
  }
