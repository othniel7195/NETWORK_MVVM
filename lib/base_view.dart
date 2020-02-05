import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum _ProviderType { WithoutConsumer, WithConsumer }

class ViewModelProvider<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final Function(T) onModelReady;
  final Widget Function(BuildContext, T, Widget) builder;
  final T viewModel;
  final _ProviderType providerType;

  ViewModelProvider.withoutConsumer({
    @required this.builder,
    @required this.viewModel,
    this.onModelReady,
  })  : providerType = _ProviderType.WithoutConsumer,
        child = null;

  ViewModelProvider.withConsumer({
    @required this.viewModel,
    @required this.builder,
    this.child,
    this.onModelReady,
  }) : providerType = _ProviderType.WithConsumer;

  @override
  _ViewModelProviderState<T> createState() => _ViewModelProviderState<T>();
}

class _ViewModelProviderState<T extends ChangeNotifier>
    extends State<ViewModelProvider<T>> {
  T _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel;

    if (widget.onModelReady != null) {
      widget.onModelReady(_viewModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.providerType == _ProviderType.WithoutConsumer) {
      return ChangeNotifierProvider(
        builder: (context) => _viewModel,
        child: widget.builder(context, _viewModel, null),
      );
    }

    return ChangeNotifierProvider(
      builder: (context) => _viewModel,
      child: Consumer(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}