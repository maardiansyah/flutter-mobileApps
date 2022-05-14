import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:point_of_sale/views/dataBarang.dart';
import 'package:point_of_sale/views/searchList.dart';

final List<String> imgList = [
  'https://s1.bukalapak.com/uploads/content_attachment/bb166ce892f3243d157c8db5/original/jajanan_pasar.jpg',
  'https://2.bp.blogspot.com/-pFoRd1LOURY/UCSKezjt0lI/AAAAAAAAABQ/Xd6ASf0Ujkk/s1600/jajanan+pasar.jpg',
  'https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2018/03/jaj5.jpg'
];

class menu_utama extends StatelessWidget {
  menu_utama();
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    var color = Colors.purpleAccent;
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Utama - Aldi"),
      ),
      body: Column(
        children: <Widget>[
          CarouselSlider(
            items: imgList
                .map((item) => Container(
                      child: Center(
                          child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: 1000,
                      )),
                    ))
                .toList(),
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 2,
            ),
          ),
          RaisedButton(
            onPressed: () => buttonCarouselController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear),
            child: Text(
              'Next',
              style: TextStyle(color: Colors.cyan),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: <Widget>[
                Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListProduk()))
                      },
                      // child: GestureDetector(
                      //   onTap: () {
                      //     MaterialPageRoute(builder: (context) => ListProduk());

                      //     print(" lihat dat ");
                      //   },
                      child: new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.archive,
                              size: 40.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Text(
                              "Data Barang",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )),
                Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CariBarang()))
                      },
                      child: new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.purpleAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.library_books,
                              size: 40.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Text(
                              "Data Kategori",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: <Widget>[
                Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        print("Container -1 clicked");
                      },
                      child: new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.purpleAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              size: 40.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Text(
                              "Kelola User",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )),
                Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        print("Container -3 clicked");
                      },
                      child: new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.directions_car,
                              size: 40.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Text(
                              "Kelola Supplier",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
