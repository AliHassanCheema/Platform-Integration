package com.example.platform_integ

import android.content.Intent
import android.os.Bundle
import android.os.PersistableBundle
import android.util.Log
import android.widget.TextView
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.util.GeneratedPluginRegister
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private  val CHANNEL = "com.example.platform_integ/channels"
    private var n : Int = 0
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        GeneratedPluginRegister.registerGeneratedPlugins(FlutterEngine(this@MainActivity))
        MethodChannel(flutterEngine?.dartExecutor!!, CHANNEL).setMethodCallHandler{ call, _ ->

            if(call.method.equals("goToSecondScreen") ){
                var intent = Intent(this@MainActivity, SecondActivity::class.java)
                var numb = call.argument<Int>("number");
                Log.e("TAG", "goTOSecond: $numb")
                startActivityForResult(intent.putExtra("sendingNum" , numb), 1)
            }
        }
    }



    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if(requestCode == 1) {
            n = data!!.getIntExtra("num", 0)
            Log.e("TAG", "onActivityResult: $n", )
        }
    }
}
