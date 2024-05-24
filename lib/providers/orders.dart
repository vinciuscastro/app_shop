import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class Order {
    final String id;
    final double amount;
    final List<CartItem> products;
    final DateTime date;

    Order({
        required this.id,
        required this.amount,
        required this.products,
        required this.date,
    });
}

class Orders with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  int get itemCount {
    return _orders.length;
  }

  void addOrder(Cart cart) {
    _orders.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        amount: cart.totalAmount,
        date: DateTime.now(),
        products: cart.items.values.toList(),
      ),
    );
    notifyListeners();
  }
}