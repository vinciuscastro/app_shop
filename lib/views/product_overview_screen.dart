import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Text('Minha Loja', style: TextStyle(color: Colors.white)),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        body: ProductGrid());
  }
}
