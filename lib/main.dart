import 'package:flutter/material.dart';
import 'package:point_of_sale/menu_utama.dart';
import 'package:point_of_sale/views/dataBarang.dart';
import 'package:point_of_sale/views/searchList.dart';
import 'package:point_of_sale/model/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Point Of Sale - Cemilanku.Com',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:
          //menu_utama(),
          //ListProduk(),
          //CariBarang(),
          LoginUser(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
