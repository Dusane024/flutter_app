// import 'dart:html';

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/routes.dart';

import 'home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(MaterialApp(
    title: "Shop",
    theme: ThemeData(
      appBarTheme: AppBarTheme(

          color: Colors.black,

          iconTheme: IconThemeData(
            color: Colors.white,
          )),
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: MyRoute.home,
    routes: {
      MyRoute.login: (context) => Login(),
      MyRoute.home: (context) => Home(),
    },
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool button=false;
  final user= TextEditingController();
  final password = TextEditingController();
   moveToHome(BuildContext context)async {
     if (_key.currentState.validate()) {
       setState(() {


         button = true;
         user.clear();
         password.clear();
       });
       await Future.delayed(Duration(seconds: 1));
       await Navigator.pushNamed(context, MyRoute.home);
  setState(() {
    button=false;
  });
     }
   }
  final _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "MyShop",
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.search_rounded),
              onPressed: () {},
            )
          ],
          leading: Icon(Icons.login),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),

            // top: Radius.circular(392)
          )),
        ),
        body: Card(
          child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _key,
              child: Column(
                children: <Widget>[
                  Image.network(
                      "https://i.pinimg.com/736x/3f/94/70/3f9470b34a8e3f526dbdb022f9f19cf7.jpg",height: 150,width: 150,),
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),

                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: user,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)

                      ),
                      prefix: Icon(Icons.person),
                      hintText: "Enter Id",

                    ),
                    validator: (value){
                      if(value.isEmpty)
                        {
                          return "Please Enter-id";
                        }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),

                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: password,

                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      suffixIcon: Icon(Icons.visibility_off),

                      hintText: "Enter Password",

                    ),
                    validator: (value){
                      if(value.isEmpty)
                      {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  Material(
                    shadowColor: Colors.white,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(button?50:9),

                    child: InkWell(
                      onTap: ()=>moveToHome(context),
                        child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        alignment: Alignment.center,
                        // color: Colors.black,
                        height: 50,
                        width: button?50:100,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(9),
                      //   color: Colors.black,
                      //   ),

                      child:button?Icon(Icons.done,color: Colors.white,): Text("Login",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: button?15:30,
                        color: Colors.white,
                      ),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
        )
    );
  }
}
