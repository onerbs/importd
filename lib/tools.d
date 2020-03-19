module lib.tools;

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
