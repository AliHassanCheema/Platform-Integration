import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class HomeVuModel extends BaseViewModel {
  int? n;
  int? result;
  static const CHANNEL = "com.example.platform_integ/channels";
  static const platform = MethodChannel(CHANNEL);
  TextEditingController? controller = TextEditingController();

  HomeVuModel() {
    debugPrint('back to HOme');
  }

  onOpenNativeActivity(context) async {
    debugPrint("Not invoked yet");
    if (controller!.value.text != '') {
      n = int.parse(controller!.value.text);
      result = await platform.invokeMethod("goToSecondScreen", {"number": n});
      n = result;
      controller!.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Field should have a number'), duration: Duration(milliseconds: 4000)));
    }
    notifyListeners();
    debugPrint("invokedddddddddddd   Value $n");
  }
}
