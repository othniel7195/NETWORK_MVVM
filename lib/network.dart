import 'package:flutter/foundation.dart';

abstract class NetWork {
  static NetWork getInstance() {
    return _NetWorkImp();
  }

  Future<Map> get<T>(String url, {Object params, HostType type = HostType.normal});
}

class _NetWorkImp extends NetWork {
  _NetWorkImp._internal();

  static final _NetWorkImp _singleton = _NetWorkImp._internal();

  factory _NetWorkImp() {
    return _singleton;
  }

  @override
  Future<Map> get<T>(String url, {Object params, HostType type = HostType.normal}) {
    return _network(_ArgumentsInfo(url,
        method: RequestType.GET)
        .toJson());
  }

  

  Future<Map> _network<T>(Object params) {
    return callMethod("get");
  }

  Future<Map> callMethod<T>(String method, {Object params = ""}) async {
    final jsonString = {"key": "liulishuo NB", "value": "1000000亿"};
    return await Future.delayed(Duration(seconds: 3), () => jsonString);
  }
}

class _ArgumentsInfo {
  final String path;
  final RequestType method;
  _ArgumentsInfo(this.path,
                 {this.method = RequestType.GET,});

  dynamic toJson() => {
    'path': path,
    'method': describeEnum(method),
  };
}

enum HostType { normal, pay, abTest, joinCodes, hybrid }

enum RequestType { GET, POST, PATCH, PUT, DELETE }

class FlutterErrorCode {
  static const netError = "-1023";
  static const dataError = "-1024";
  static const unknown = "-1025";
}