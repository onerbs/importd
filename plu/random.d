module plu.random;

/// returns a random number [N, M]
int _int(int N, int M) {
  import std.random : uniform;
  return uniform!"[]"(N, M);
}

/// returns a random number [0, N]
int _int(int N) {
  return _int(0, N);
}
