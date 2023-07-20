import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postapicubitapp/screens/resources/URLresources.dart';
import 'dart:io' show Platform;
import '../helpers/api_handler.dart';
part 'logindata_state.dart';

class LoginDataCubit extends Cubit<LoginDataState> {
  LoginDataCubit()
      : super(LoginDataState(
            isLogin: false,
            message: '',
            password: TextEditingController(),
            username: TextEditingController()));

  checkLogin(params) async {
    var jsonParams = {
      "name": params["name"],
      "password": params["password"],
      "device_token": "12345678",
      "device_os": Platform.operatingSystem
    };

    var headers = {"Content-Type": "application/json"};

    await ApiHandler.postCall(URLResources.loginApi,
            body: jsonEncode(jsonParams), headers: headers)
        .then((json) {
      if (json["result"] == "success") {
        state.isLogin = true;
        var id = json["data"]["id"].toString();
        var name = json["data"]["name"].toString();
        var email = json["data"]["email"].toString();
        var userSessionToken = json["data"]["user_session_token"].toString();
      } else {
        state.isLogin = false;
      }
      state.message = json["message"];
    });
  }

  handleButton() async{
    var name = state.username.text.toString();
    var password=state.password.text.toString();

    var params = {
      "name":name,
      "password":password
    };
  await checkLogin(params);
    if(state.isLogin)
    {
    print("Login: ${state.message}");
    }
    else
    {
    print("Error: ${state.message}");
    }
  }
}
