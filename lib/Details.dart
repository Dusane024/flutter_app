// import 'dart:html';

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/catalog.dart';

class Detail extends StatefulWidget {
  final Item item;

  const Detail({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomAppBar(
                      child: Container(
                        color: Colors.grey,
                        child: Row(
                          children: [
                            Text(

              "\$" + widget.item.price.toString(),
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),

                            ElevatedButton(onPressed: (){}, child: Text("Buy",style: TextStyle(
                              fontSize: 25,
                            ),),style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.black),
                              shape: MaterialStateProperty.all(StadiumBorder()),
                              alignment: Alignment.center,


                            ),

                            ),

                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
          ),






      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "MyApp",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              widget.item.image,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            Expanded(

                child: Container(
              color: Colors.transparent,
                  width: 400,
                  child: Column(
                    children: <Widget>[
                      Text(widget.item.name,textScaleFactor: 2.1,),
                      Text(widget.item.desc,textScaleFactor: 1.5,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("The iPhone is a smartphone made by Apple that combines a computer, iPod, digital camera and cellular phone into one device with a touchscreen interface. The iPhone runs the iOS operating system (OS), and as of 2017, there were 2.2 million apps available for it through the Apple App Store, according to Statista."),
                      ),
                    ],
                  ),
            ))
          ],
        ),
      ),
    );
  }
}
