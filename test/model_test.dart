import 'package:flutter_test/flutter_test.dart';
import 'package:network_mvvm/base_model.dart';
import 'package:network_mvvm/base_view_model.dart';
import 'package:network_mvvm/main.dart';

void main(){
  test("测试基础json是否可以正常转换model", (){
    final jsonString = {"key": "liulishuo", "value": "100亿"};
    TestModel testM = TestModel().decode(jsonString); 
    print("key: ${testM.key} -> value: ${testM.value}");
    
    TestViewModel testVM = TestViewModel("tvm", testM);
    print("tvm: ${testVM.tag} --> ${testVM.gValue}");
    testVM.setkv("1000亿");
    print("tvm: ${testVM.tag} --> ${testVM.gValue}");
  });
}