package com.example.platform_integ

import android.content.Intent
import android.os.Bundle
import android.os.PersistableBundle
import androidx.appcompat.app.AppCompatActivity
import com.example.platform_integ.databinding.ActivitySecondBinding

class SecondActivity : AppCompatActivity() {
    private lateinit var binding : ActivitySecondBinding
    private   var num : Int =0
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySecondBinding.inflate(layoutInflater)
        setContentView(binding.root)
        num  = intent.getIntExtra("sendingNum", num)
        binding.txt.text = num.toString()
        onIncrement()
        binding.backBtn.setOnClickListener {
            intent.putExtra("num", num)
            setResult(RESULT_OK, intent)
            onBackPressed()
        }
    }

    private fun onIncrement(){
        binding.addBtn.setOnClickListener {
            num++
            binding.txt.text = num.toString()
        }
    }
}