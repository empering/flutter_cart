import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart/bloc/cart_bloc.dart';
import 'package:flutter_cart/catalog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _cartBloc = CartBloc();

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (BuildContext context) => _cartBloc,
     child: BlocBuilder(bloc: _cartBloc, builder: (BuildContext context, List state){
       return MaterialApp(
         title: 'flutter demo',
         theme: ThemeData(
           primaryColor: Colors.blue,
         ),
         home: LoginScreen(),
       );
     },),
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



