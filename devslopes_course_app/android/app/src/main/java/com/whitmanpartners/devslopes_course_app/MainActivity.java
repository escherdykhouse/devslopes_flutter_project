package com.whitmanpartners.devslopes_course_app;

import android.content.Context;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.util.Log;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;


public class MainActivity extends FlutterActivity {

  public String getLocalIpAddress(){
    Context context = this;
    WifiManager wifiMan = (WifiManager) context.getSystemService(Context.WIFI_SERVICE);
    WifiInfo wifiInf = wifiMan.getConnectionInfo();
    int ipAddress = wifiInf.getIpAddress();
    String ip = String.format("%d.%d.%d.%d", (ipAddress & 0xff),(ipAddress >> 8 & 0xff),(ipAddress >> 16 & 0xff),(ipAddress >> 24 & 0xff));
    return ip;
  }

  private static final String CHANNEL = "pupbook.native/";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
            new MethodCallHandler() {
              @java.lang.Override
              public void onMethodCall(MethodCall methodCall, Result result) {
                if (methodCall.method.equals("getIpAddress")) {
                  String ip = getIpAddress();
                  if (ip != null) {
                    result.success(ip);
                  } else {
                    result.error("Couldn't get IP",null,null);
                  }
                } else {
                  result.notImplemented();
                }
              }
            }
    );
  }

  private String getIpAddress() {
    String IPAddress = getLocalIpAddress();

    return IPAddress;
  }
}
