
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platform_integ/home_vm.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends ViewModelBuilderWidget<HomeVuModel> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeVuModel viewModel, Widget? child) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.cyan[900],
        title: const Text('Home')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(viewModel.n == null  ? 'Number will be shown here ' : viewModel.n.toString(), style: TextStyle(color: Colors.cyan[900], fontSize: 24),),
                 const SizedBox(height: 24,),
                TextFormField(
                  decoration:  const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 0, 96, 100))),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 0, 96, 100))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 0, 96, 100)))
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: viewModel.controller,
                ),
                const SizedBox(height: 24,),
                ElevatedButton(onPressed: ()
                async{
                  await viewModel.onOpenNativeActivity();
                },
                style: ElevatedButton.styleFrom(
                primary: Colors.cyan[900],),
                 child: const Text("Go To Native"),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeVuModel viewModelBuilder(BuildContext context) {
    return HomeVuModel();
  }
}