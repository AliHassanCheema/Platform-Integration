import 'package:flutter/material.dart';
import 'package:platform_integ/main_test_vm.dart';
import 'package:stacked/stacked.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  runApp( const WakeLockTestScreen());
}

class WakeLockTestScreen extends ViewModelBuilderWidget<WakeLockViewModel>{
  const WakeLockTestScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, WakeLockViewModel viewModel, Widget? child) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wakelock example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Spacer(
                flex: 3,
              ),
              OutlinedButton(
                onPressed: () {
                    viewModel.onEnable();

                },
                child: const Text('Enable wakelock'),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                    viewModel.onDisable()         ;
                },
                child: const Text('Disable wakelock'),
              ),
              const Spacer(
                flex: 2,
              ),
              FutureBuilder(
                future: Wakelock.enabled,
                builder: (context, AsyncSnapshot<bool> snapshot) {
                  final data = snapshot.data;
                  if (data == null) {
                    return Container();
                  }

                  return Text('The wakelock is currently '
                      '${data ? 'enabled' : 'disabled'}.');
                },
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  WakeLockViewModel viewModelBuilder(BuildContext context) {
    return WakeLockViewModel();
  }
}
