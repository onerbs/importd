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
      case 30: case  40:
      case 90: case 100: base = tent(value); break;
      default:           base = 30;          break;
    }
  }

  /// Set the Value's code to the provided one.
  Value set(int code) {
    this.base = tent(code);
    this.code = unit(code);
    return this;
  }
  /// the set test
  unittest {
    auto test = new Value();
    test.set(45);
    assert(test.value == 45);
    test.set(36);
    assert(test.value == 36);
  }

  /// Set the Value's code to the bright version of itself.
  Value bright() {
    if (base < 60) base += 60;
    return this;
  }
  /// the bright test
  unittest {
    auto test = new Value(33);
    test.bright();
    assert(test.value == 93);
  }

  /// Set the Value's code to the bright version of the provided code.
  Value bright(int code) {
    return set(code).bright();
  }
  /// the bright code test
  unittest {
    auto test = new Value();
    test.bright(33);
    assert(test.value == 93);
  }

  /// Set the Value's code to the dim version of itself.
  Value dim() {
    if (base > 60) base -= 60;
    return this;
  }
  /// the dim test
  unittest {
    auto test = new Value(103);
    test.dim();
    assert(test.value == 43);
  }

  /// Set the Value's code to the dim version of the provided code.
  Value dim(int code) {
    return set(code).dim();
  }
  /// the dim code test
  unittest {
    auto test = new Value();
    test.dim(103);
    assert(test.value == 43);
  }

  /// returns the value of this value
  int value() const @property {
    return base + code;
  }
  /// the value test
  unittest {
    auto test = new Value(33);
    assert(test.value == 33);
  }

  /// -v- true if code is between 0 and 7.
  private bool hasValidCode() const {
    return (code >= 0 && code <= 7);
  }
  /// the hasValidCode test
  unittest {
    auto test = new Value(58);
    assert(!test.hasValidCode);
  }

  /// The string representation of this Value.
  override string toString() const {
    if (!hasValidCode()) return "";
    import std.string : fmt = format;
    return fmt("%s", value);
  }
  /// the toString test
  unittest {
    auto test = new Value(48);
    assert(test.toString() == "");
    test.set(35);
    assert(test.toString() == "35");
  }

}

private static:

  /// returns the units of number. 37 ret 7
  int unit(int N) {
    while (N >= 10) N -= 10;
    return N;
  }
  /// the unit test
  unittest {
    assert(unit(105) == 5);
  }

  /// returns the tens of number. 37 ret 30
  int tent(int N) {
    if (N < 10) return 0;
    return N - unit(N);
  }
  /// the tent test
  unittest {
    assert(tent(105) == 100);
  }
