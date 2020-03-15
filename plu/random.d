module plu.random;

import std.random : uniform;

/// returns a random number [N, M]
int _int(int N, int M) {
  return uniform!"[]"(N, M);
}

/// returns a random number [0, N]
int _int(int N) {
  return _int(0, N);
}
