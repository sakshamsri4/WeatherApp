class City {
  City._privateConstructor();
  static City _ob = City._privateConstructor();
  String data;

  static City getInstance() {
    return _ob;
  }

  void setIData(String d) {
    data = d;
  }

  String getIData() {
    return data;
  }
}
