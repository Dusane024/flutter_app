import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/catalog.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/widget.dart';
import 'package:flutter_app/Details.dart';

import 'drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = <Item>[];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var jsonData = await rootBundle.loadString("Assets/product.json");
    final decodeData = jsonDecode(jsonData);
    var productData = decodeData["product"];
    setState(() {
      items = List.from(productData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.search_rounded), onPressed: () {})
        ],
        centerTitle: true,
        title: Container(
          clipBehavior: Clip.antiAlias,
          child: Text(
            "MyShop",
            style: TextStyle(
              fontSize: 30,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [Colors.black, Colors.white],
              )),
        ),
      ),
      body: Card(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Image.network(
                        "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-12-3.jpg",
                        height: 200,
                        width: 200,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-12-pro-max-2.jpg",
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                ),

                Container(
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                    textScaleFactor: 1.6,
                  ),
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.grey, Colors.black]),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detail(
                                      item: item,
                                    ))),
                        child: GridTile(
                          child:
                              Image.network(item.image, height: 30, width: 30),
                          header: Container(
                            child: Text(
                              item.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                          ),
                          footer: Container(
                            child: Row(
                              children: [
                                Text(
                                  "\$" + item.price.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Buy"),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    shape: MaterialStateProperty.all(
                                        StadiumBorder()),
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: items.length,
                )
                // ListView.builder(
                //     itemCount: items.length,
                //     shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     itemBuilder: (context, index) {
                //       return ItemWidget(
                //         item: items[index],
                //       );
                //     })
              ],
            ),
          ),
        ),
      ),
      drawer: Dr(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoute.home);
        },
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
