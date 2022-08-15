package com.example.platform_integ

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
    }

    private fun onIncrement(){
        binding.addBtn.setOnClickListener {
            binding.txt.text = num.toString()
            num++
        }
    }
}