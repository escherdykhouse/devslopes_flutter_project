package com.whitmanpartners.devslopes_course_app;

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
    try {
      for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces();
           en.hasMoreElements();) {
        NetworkInterface intf = en.nextElement();
        for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements();) {
          InetAddress inetAddress = enumIpAddr.nextElement();
          if (!inetAddress.isLoopbackAddress()) {
            return inetAddress.getHostAddress();
          }
        }
      }
    } catch (Exception ex) {
      Log.e("IP Address", ex.toString());
    }
    return null;
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
