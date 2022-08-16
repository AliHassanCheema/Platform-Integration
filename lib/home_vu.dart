
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platform_integ/home_vm.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends ViewModelBuilderWidget<HomeVuModel> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeVuModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Form(
        child: Column(
          children: [
            Text(viewModel.n.toString()),
            TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
              ],
              controller: viewModel.controller,
            ),
            ElevatedButton(onPressed: (){
              viewModel.onOpenNativeActivity();
            }, child: const Text("Go To Android Native"),),
          ],
        ),
      ),
    );
  }

  @override
  HomeVuModel viewModelBuilder(BuildContext context) {
    return HomeVuModel();
  }
}