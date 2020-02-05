import 'package:flutter/foundation.dart';
import 'package:network_mvvm/base_model.dart';
import 'package:network_mvvm/network.dart';


class BaseViewModel<T> extends ChangeNotifier {
  NetWork _netWork = NetWork.getInstance();
  bool _isDisposed = false;
  T _model;
  String _tag;
  BaseViewModel({String tag, T model}) : _tag = tag, _model = model;
  bool get isDisposed => this._isDisposed;
  String get tag =>  _tag ?? this.runtimeType.toString();
  
  @override
  void notifyListeners() {
    if (!isDisposed) {
        super.notifyListeners();
    } else {
        print('notifyListeners: Notify listeners called after '
            '${_tag ?? this.runtimeType.toString()} has been disposed');
    }
  }

  @override
  void dispose() {
    print("${_tag ?? this.runtimeType.toString()} dispose");
    _isDisposed = true;
    super.dispose();
  }
}

class TestViewModel extends BaseViewModel<TestModel> {

  TestViewModel(String tag, TestModel model) : super(tag: tag, model: model);
  TestViewModel.WithTag(String tag) : super(tag: tag);
  void setkv(String tmp) {
    _model.value = tmp;
    notifyListeners();
  }

  String gValue() {
    return _model.value;
  }
  String gkey(){
    return _model.key;
  }

  void queryData() {
    final jsonString = {"key": "liulishuo", "value": "100亿"};
    TestModel testM = TestModel().decode(jsonString);
    _model = testM;
  }

  void changeData() {
    _netWork.get("url").then((result){
      print("change data: ${result}");
      _model = _model.decode(result);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    print("TestViewModel dispose");
    super.dispose();
  }
}

