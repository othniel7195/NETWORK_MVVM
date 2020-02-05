
abstract class BaseModel<T> {
  T decode(Map<String, Object> json);
  Map<String, Object> encode();
}

class TestModel implements BaseModel<TestModel> {
  
  String key;
  String value;
  TestModel({this.key, this.value});

  @override
  TestModel decode(Map<String, Object> json) {
    String k = json["key"];
    String v = json["value"];
    return TestModel(key: k, value: v);
  }

  @override
  Map<String, Object> encode() {
    // TODO: implement encode
    return null;
  }
  
}

