module lib.tint.color.value;

// import the needed tools.
import lib.tools : unit, tent;

/// The Value Type.
class Value {

  /// This Value's code. [0-7]
  //0:black, 1:red,     2:green, 3:yellow,
  //4:blue,  5:magenta, 6:cyan,  7:gray
  private val code = val(8).data([0, 7]).type(0);

  /// This Value's base.
  //30:fore,  90:bright fore,
  //40:back, 100:bright back
  private val base = val(0).data([30, 40, 60, 100]).type(1);

  /// Default constructor
  this() { this(8); }

  /// Initialize parsing provided value.
  this(int value) {
    if (tent(value) > 0) base.v(tent(value));
    code.v(unit(value));
  }

  /// Set the Value's code to the provided one.
  Value set(int value) {
    if (tent(value) > 0) base.v(tent(value));
    code.v(unit(value));
    return this;
  }
  unittest {
    auto test = new Value();
    test.set(45); assert(test.value == 45);
    test.set(6);  assert(test.value == 46);
    test.set(33); assert(test.value == 33);
    test.set(24); assert(test.value == 24);
  }

  /// Set the Value's code to the bright version of itself.
  Value bright() {
    if (base < 60) base += 60;
    return this;
  }
  unittest {
    auto test = new Value(33);
    test.bright(); assert(test.value == 93);
  }

  /// Set the Value's code to the bright version of the provided code.
  Value bright(int code) {
    return set(code).bright();
  }
  unittest {
    auto test = new Value();
    test.bright(33); assert(test.value == 93);
  }

  /// Set the Value's code to the dim version of itself.
  Value dim() {
    if (base > 60) base -= 60;
    return this;
  }
  unittest {
    auto test = new Value(103);
    test.dim(); assert(test.value == 43);
  }

  /// Set the Value's code to the dim version of the provided code.
  Value dim(int code) {
    return set(code).dim();
  }
  unittest {
    auto test = new Value();
    test.dim(103); assert(test.value == 43);
  }

  /// returns the value of this value
  int value() const @property {
    return base + code;
  }
  unittest {
    auto test = new Value(33);
    assert(test.value == 33);
  }

  /// The string representation of this Value.
  override string toString() const {
    import std.string : fmt = format;
    return isValidCode(value) ? fmt("%d", value) : "";
  }
  unittest {
    auto test = new Value(48);
    assert(test.toString() == "");
    test.set(35);
    assert(test.toString() == "35");
  }

}

private {
  struct val {

    /// the measurement data
    private int[] _data = [0, 0];

    /// 0: range; other: defined;
    private ubyte _type = 0;

    /// the value
    private int _val = -1;

    /// let val act as an int
    alias _val this;

    this(int value) { _val = value; }

    /// change the val's value
    val v(int value) { _val = value; return this; }
    unittest {
      val test = val(5);
      assert(test == 5);
      test.v(4);
      assert(test == 4);
    }

    /// change the val's data
    val data(int[] data) { _data = data; return this; }
    unittest {
      val test = val(5).data([3, 6, 9]);
      assert(test._data == [3, 6, 9]);
    }

    /// change the val's type
    val type(ubyte type) { _type = type; return this; }
    unittest {
      val test = val(5).data([3, 6, 9]).type(1);
      assert(test._type == 1);
    }

    /// check if this val is valid according to the rules
    bool isValid() {
      switch (_type) {
        case 0:
          return (_data[0] <= this && this <= _data[1]);
        default:
          foreach (option; _data)
            if (this == option)
              return true;
          return false;
      }
    }
    unittest {
      val test = val(5).data([3, 6, 9]).type(1);
      assert(test.isValid() == false);
      assert(test.v(6).isValid() == true);
    }

  }

  val unit_v = val(8).data([0, 7]).type(0);
  val tent_v = val(0).data([30, 40, 60, 100]).type(1);

  /// handy comparator
  bool isValidCode(int code) {
    return (unit_v.v(unit(code)).isValid()
        &&  tent_v.v(tent(code)).isValid());
  }
  unittest {
    assert(!isValidCode(23));
    assert( isValidCode(35));
    assert( isValidCode(45));
    assert(!isValidCode(53));
    assert( isValidCode(95));
    assert( isValidCode(105));
    assert(!isValidCode(123));
  }
}