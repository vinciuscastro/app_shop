import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/dummy_data.dart';
import '../widgets/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  const ProductOverviewScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body:   GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: DUMMY_DATA.length,
        itemBuilder: (ctx, i) => ProductItem(DUMMY_DATA[i]),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
