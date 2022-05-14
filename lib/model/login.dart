import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:point_of_sale/views/AdminPage.dart';
import 'package:point_of_sale/views/CustomerPage.dart';
import 'package:point_of_sale/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:point_of_sale/menu_utama.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.deepOrangeAccent),
    home: LoginUser(),
  ));
}

class LoginUser extends StatefulWidget {
  @override
  _LoginUserState createState() => _LoginUserState();
}

enum LoginStatus { notSignIn, signIn, signUser }

class _LoginUserState extends State<LoginUser> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String? username;
  String? password;
  final _key = new GlobalKey<FormState>();
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      login();
    } else {
      setState(() {
        AutovalidateMode.values;
      });
    }
  }

  login() async {
    final response = await http.post(Uri.parse(BaseUrl.urlLogin),
        body: {"username": username, "password": password.toString()});
    final data = jsonDecode(response.body);
    int value = data['success'];

    String pesan = data['message'];
    //user
    String usernameAPI = data['username'];
    //String namaAPI = data['nama'];
    String userLevel = data['level'];
    if (value == 1) {
      if (userLevel == "1") {
        setState(() {
          _loginStatus = LoginStatus.signIn;
          savePref(value, usernameAPI, '', userLevel);
        });
      } else {
        setState(() {
          _loginStatus = LoginStatus.signUser;
          savePref(value, usernameAPI, '', userLevel);
        });
      }

      print(pesan);
    } else {
      print(pesan);
    }
  }

  savePref(int val, String usernameAPI, String namaAPI, userLevel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", val);
      preferences.setString("username", usernameAPI);
      //preferences.setString("nama", namaAPI);
      preferences.setString("level", userLevel);
      preferences.commit();
    });
  }

  var value;
  var level;
  var nama;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
      level = preferences.getString("level");
      nama = preferences.getString("nama");

      if (value == 1) {
        if (level == "1") {
          _loginStatus = LoginStatus.signIn;
        } else {
          _loginStatus = LoginStatus.signUser;
        }
      } else {
        _loginStatus = LoginStatus.notSignIn;
      }
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", 0);
      preferences.setString("username", '');
      preferences.setString("nama", '');
      preferences.setString("level", '');
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  // login page
  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        // ignore: unnecessary_new
        return new Scaffold(
          body: Form(
            key: _key,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              padding: EdgeInsets.only(top: 90.0, left: 20.0, right: 20.0),
              children: <Widget>[
                Image.asset('assets/logo.png', height: 60, width: 60),
                Text(
                  "Globalshop v0.1",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.2,
                ),
                TextFormField(
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Silahkan isi username";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (e) => username = e!,
                  decoration: InputDecoration(
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  obscureText: _secureText,
                  onSaved: (e) => password = e!,
                  decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                          icon: Icon(_secureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: showHide)),
                ),
                MaterialButton(
                  padding: EdgeInsets.all(25.0),
                  color: Colors.blue,
                  onPressed: () {
                    check();
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        );
        break;
      case LoginStatus.signUser:
        return menu_utama();
        break;
      case LoginStatus.signIn:
        return CustomerPage(signOut);
        break;
    }
  }
}
