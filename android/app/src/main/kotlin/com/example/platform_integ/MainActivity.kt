package com.example.platform_integ

import android.content.Intent
import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.util.GeneratedPluginRegister
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private  val CHANNEL = "com.example.platform_integ/channels"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        GeneratedPluginRegister.registerGeneratedPlugins(FlutterEngine(this@MainActivity))
        MethodChannel(flutterEngine?.dartExecutor!!, CHANNEL).setMethodCallHandler{ call, _ ->

            if(call.method.equals("goToSecondScreen")){
                goTOSecond()
            }
        }
    }

    fun goTOSecond(){
        startActivity(Intent(this@MainActivity, SecondActivity::class.java))
    }
}
