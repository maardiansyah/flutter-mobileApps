import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:point_of_sale/model/modelKategori.dart';
import 'dart:convert';
import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';

class CariBarang extends StatefulWidget {
  //const CariBarang({ Key? key }) : super(key: key);
  CariBarang() : super();

  final String title = "AutoComplete Search Flutter";

  @override
  State<CariBarang> createState() => _CariBarangState();
}

class _CariBarangState extends State<CariBarang> {
  AutoCompleteTextField? searchFieldText;
  GlobalKey<AutoCompleteTextFieldState<KategoriModel>> key = new GlobalKey();
  static List<KategoriModel> produk = new List<KategoriModel>.empty();
  bool loading = true;

  void getUsers() async {
    try {
      final response = await http.get(Uri.parse(
          "http://192.168.246.182/belajar/api-uts-mobile/api/kategori.php"));
      if (response.statusCode == 200) {
        produk = loadUsers(response.body);
        print('Products: ${produk.length}');
        setState(() {
          loading = false;
        });
      } else {
        print("Error getting product.");
      }
    } catch (e) {
      print("Error getting data api.");
    }
  }

  static List<KategoriModel> loadUsers(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed
        .map<KategoriModel>((json) => KategoriModel.fromJson(json))
        .toList();
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  Widget row(KategoriModel kategori) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          kategori.idKategori,
          style: TextStyle(fontSize: 16.0),
        ),
        // SizedBox(
        //   width: 10.0,
        // ),
        Text(
          kategori.kategori,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          loading
              ? CircularProgressIndicator()
              : searchFieldText = AutoCompleteTextField<KategoriModel>(
                  key: key,
                  clearOnSubmit: false,
                  suggestions: produk,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                    hintText: "Cari Product",
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  itemFilter: (item, query) {
                    return item.kategori
                        .toLowerCase()
                        .startsWith(query.toLowerCase());
                  },
                  itemSorter: (a, b) {
                    return a.kategori.compareTo(b.kategori);
                  },
                  itemSubmitted: (item) {
                    setState(() {
                      searchFieldText!.textField!.controller!.text =
                          item.kategori;
                    });
                  },
                  itemBuilder: (context, item) {
                    return row(item);
                  },
                ),
        ],
      ),
    );
  }
}
