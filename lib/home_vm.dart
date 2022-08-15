import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class HomeVuModel extends BaseViewModel{
  static const  CHANNEL = "com.example.platform_integ/channels";
  static const platform = MethodChannel(CHANNEL);
   onOpenNativeActivity() async {
     print("Not invoked yet");
     await platform.invokeMethod("goToSecondScreen");
     print("invoked");
   }
}