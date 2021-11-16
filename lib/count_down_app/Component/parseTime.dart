String intToTimeLeft(int value) {
  int m, s;
  m = value  ~/ 60;

  s = value - (m * 60);

  String result = "$m:$s";

  return result;
}