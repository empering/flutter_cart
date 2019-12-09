import 'package:flutter/cupertino.dart';

import '../item.dart';
import 'package:rxdart/rxdart.dart';

enum CartEventType {
  add, remove
}

class CartEvent{
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);

}

class CartBloc{
  final itemList = [
    Item('맥북',200000),
    Item('안드로이드',30000),
    Item('플로터',15000),
    Item('생존코딩',10000),
    Item('새우깡',2000),
  ];

  final _cartList = List<Item>();

  final _cartListSubject = BehaviorSubject<List<Item>>.seeded([]);

  Stream<List<Item>> get cartList => _cartListSubject.stream;


  void add(CartEvent event){
    switch(event.type){
      case CartEventType.add:
        _cartList.add(event.item);
        break;
      case CartEventType.remove:
        _cartList.remove(event.item);
        break;
    }

    _cartListSubject.add(_cartList);

  }

}