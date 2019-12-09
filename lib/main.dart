import 'package:flutter/material.dart';
import 'package:flutter_cart/bloc/cart_provider.dart';
import 'package:flutter_cart/catalog.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return CartProvider(
     child: MaterialApp(
           title: 'flutter demo',
           theme: ThemeData(
             primaryColor: Colors.blue,
           ),
           home: LoginScreen(),
         ),
   );
  }
}


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Catalog()));

          },
          child: Text('enter!!'),
        ),
      ),
    );
  }
}



