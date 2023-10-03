package com.example.al_takamul_alteqani_test_plugin

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import okhttp3.Call
import okhttp3.Callback
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Response
import java.io.IOException


class AlTakamulAlteqaniTestPluinPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "al_takamul_alteqani_test_plugin")
    channel.setMethodCallHandler(this)
  }

  private val client = OkHttpClient()

  override fun onMethodCall(call: MethodCall, result: Result) {

    if (call.method == "callAPI") {
      val request = Request.Builder()
        .url("https://api.stackexchange.com/2.3/questions/76792158?order=desc&sort=activity&site=stackoverflow")
        .build()

      client.newCall(request).enqueue(object : Callback {
        override fun onFailure(call: Call, e: IOException) {
          result.success(false)
          e.printStackTrace()
        }

        override fun onResponse(call: Call, response: Response) {
          response.use {
            if (!response.isSuccessful){
              result.success(false)
            }else{
              result.success(true)
            }

            println(response.body!!.string())
          }
        }
      })
    } else {

      result.notImplemented()

    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
