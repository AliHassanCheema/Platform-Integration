import 'package:stacked/stacked.dart';
import 'package:wakelock/wakelock.dart';

class WakeLockViewModel extends BaseViewModel{
  onDisable(){
    Wakelock.disable();
    notifyListeners();
  }
  onEnable(){
    Wakelock.enable();
    notifyListeners();
  }
}