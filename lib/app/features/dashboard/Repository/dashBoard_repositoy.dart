import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class DashBoardRepository{
  var client = HttpClient();
  Future<String> readDataFromServer({required String url}) async {

    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    /*This is used to determine the user's network connection status, whether they are
    connected via mobile data, Wi-Fi, or not connected to any network at all.*/

    if(connectivityResult == ConnectivityResult.none){
      //if user didn't connect any network show this error
     return "Network Error";
    }
    else{
      //If the user is connected to a network, we grant access to send requests to the server.
      HttpClientRequest request = await client.getUrl(Uri.parse(url));
      HttpClientResponse response = await request.close();
      final stringData = await response.transform(utf8.decoder).join();//this is transform the response to encoded String
      return stringData;
    }

  }
}