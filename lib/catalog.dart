import 'package:flutter/material.dart';
import 'package:flutter_cart/bloc/cart_provider.dart';
import 'package:flutter_cart/cart.dart';
import 'bloc/cart_bloc.dart';
import 'item.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = CartProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Cart()));
              },
              icon: Icon(Icons.archive)),
        ],
      ),
      body: StreamBuilder(
        stream: cartBloc.cartList,
        builder: (context, snapshot) {
          return ListView(
            children: cartBloc.itemList
                .map((item) => _buildItem(item, snapshot.data, cartBloc))
                .toList(),
          );
        },
      ),
    );
  }

  Widget _buildItem(Item item, List<Item> state, CartBloc cartBloc) {
    final isChecked = state.contains(item);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          item.title,
          style: TextStyle(fontSize: 30.0),
        ),
        subtitle: Text(
          item.price.toString(),
          style: TextStyle(fontSize: 15.0),
        ),
        trailing: IconButton(
          icon: isChecked
              ? Icon(
                  Icons.check,
                  color: Colors.red,
                )
              : Icon(Icons.check),
          onPressed: () {
            if (isChecked) {
              cartBloc.add(CartEvent(CartEventType.remove, item));
            } else {
              cartBloc.add(CartEvent(CartEventType.add, item));
            }
          },
        ),
      ),
    );
  }
}
