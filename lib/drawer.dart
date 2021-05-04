import 'package:flutter/material.dart';
class Dr extends StatefulWidget {
  @override
  _DrState createState() => _DrState();
}

class _DrState extends State<Dr> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: Text("RD"), accountEmail: Text("RD@123"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("Assets/icon.JPG"),

            ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Name"),
              subtitle: Text("Surname"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            )

          ],
        ),
      );
  }
}
