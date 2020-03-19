module plu.rnd;

import std.ascii;
import std.conv : to;

/// Return a random element of the int[]
T any(T)(T[] arr) {
  return arr[rnd(to!int(arr.length))];
}

/// Return a random character of the provided string
char any(string str) {
  return str[rnd(to!int(str.length))];
}

/// returns a random number [N, M]
int rnd(int N, int M) {
  import std.random : uniform;
  return uniform!"[]"(N, M);
}

/// returns a random number [0, N]
int rnd(int N) {
  return rnd(0, N);
}

/// returns a random bool [true, false]
bool decide() {
  return rnd(1) == 1;
}

/// return a random numeric character
char digit() {
  return digits.any();
}

/// return a random lowercase character
char lower() {
  return lowercase.any();
}

/// return a random uppercase character
char upper() {
  return uppercase.any();
}

/// return a random string
string str(int len, bool up = false) {
  char[] result;
  for (int i = 0; i < len; i++) {
    if (decide()) {
      result ~= digit();
    } else {
      if (up) {
        result ~= upper(); 
      } else {
        result ~= lower(); 
      }
    }
  }
  return to!string(result);
}
