package com.example.firebaseauth

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.databinding.DataBindingUtil
import com.example.firebaseauth.databinding.ActivityMainBinding
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.ktx.auth
import com.google.firebase.ktx.Firebase

class MainActivity : AppCompatActivity() {
    private lateinit var auth: FirebaseAuth
    private lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        binding = DataBindingUtil.setContentView(this,R.layout.activity_main)
        auth = Firebase.auth
        binding.createUserButton.setOnClickListener {
            auth.createUserWithEmailAndPassword("mm@gmail.com","Mm12#elr")
                .addOnCompleteListener {
                    if(it.isSuccessful){
                        binding.textView.text = "Logged: "+ auth.currentUser?.email
                    }else{
                        binding.textView.text = "Could not create user"
                    }
                }
        }
        binding.loginButton.setOnClickListener {
            if(auth.currentUser != null){
                auth.signOut()
                binding.loginButton.text = "Login"
                binding.textView.text = "No user logged"
                return@setOnClickListener
            }
            auth.signInWithEmailAndPassword("mm@gmail.com","Mm12#elr")
                .addOnCompleteListener {
                    if(it.isSuccessful){
                        binding.textView.text = "Logged: "+ auth.currentUser?.email
                        binding.createUserButton.isEnabled = false
                        binding.loginButton.text = "Logout"
                    }else{
                        binding.textView.text = "Could not create user"
                    }
                }
        }
    }

    override fun onResume() {
        super.onResume()
        if(auth.currentUser != null){
            binding.textView.text = "Logged: "+ auth.currentUser?.email
            binding.createUserButton.isEnabled = false
            binding.loginButton.text = "Logout"
        }else{
            binding.textView.text = "No user logged"
        }
    }
}