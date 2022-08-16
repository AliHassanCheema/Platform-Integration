import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class HomeVuModel extends BaseViewModel{
  int? n;
  static const  CHANNEL = "com.example.platform_integ/channels";
  static const platform = MethodChannel(CHANNEL);
  var controller = TextEditingController();
   onOpenNativeActivity() async {
     print("Not invoked yet");
     int value = int.parse(controller.value.text);
     await platform.invokeMethod("goToSecondScreen" , {"number": value}).then((v) {
       print("value back from activity : $v");
       n = v;
     });
     print("invoked");
   }
}