
import 'package:flutter/material.dart';
import 'package:platform_integ/home_vm.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends ViewModelBuilderWidget<HomeVuModel> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeVuModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(onPressed: (){
          viewModel.onOpenNativeActivity();
          debugPrint("button pressed");
        }, child: const Text("Go To Android"),),
      ),
    );
  }

  @override
  HomeVuModel viewModelBuilder(BuildContext context) {
    return HomeVuModel();
  }
}