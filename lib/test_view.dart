import 'dart:math';

import 'package:flutter/material.dart';
import 'package:network_mvvm/base_view.dart';
import 'package:network_mvvm/base_view_model.dart';

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestViewModel vm = TestViewModel.WithTag("TestView");
    return ViewModelProvider<TestViewModel>.withConsumer(
        viewModel: vm,
        onModelReady: (vm) {
          vm.queryData();
        },
        builder: (context, vm, child) {
          return Center(
            child: Column(children: [
              SizedBox(height: 50),
              Text(vm.gkey()),
              SizedBox(height: 20),
              Text(vm.gValue()),
              SizedBox(height: 100),
              FloatingActionButton(
                onPressed: () {
                  List values = ["100亿", "1000亿", "10000亿"];
                  String v = values[Random().nextInt(values.length)];
                  vm.setkv(v);
                },
                child: Icon(Icons.add_alarm),
                backgroundColor: Colors.red,
              ),
              SizedBox(
                height: 40,
              ),
              FloatingActionButton(
                onPressed: () { vm.changeData();},
                child: Icon(Icons.add_alert),
                backgroundColor: Colors.red,
                heroTag: "second",
              )
            ]),
          );
        });
  }
}
