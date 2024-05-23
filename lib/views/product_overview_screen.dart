import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_grid.dart';
import '../providers/products.dart';

enum FilterOptions{
  Favorite,
  All,
}

class ProductOverviewScreen extends StatefulWidget {

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {

    final Products products = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title:
              const Text('Minha Loja', style: TextStyle(color: Colors.white)),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          actions: [
            PopupMenuButton(
                icon: Icon(Icons.more_horiz),
                onSelected: (FilterOptions selected){
                  setState(() {
                    _showFavoriteOnly = selected == FilterOptions.Favorite;
                  });
                },
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text("Somente favoritos"),
                        value: FilterOptions.Favorite,
                      ),
                      PopupMenuItem(
                        child: Text("Todos"),
                        value: FilterOptions.All,
                      ),
                    ]),
          ],
        ),
        body: ProductGrid(_showFavoriteOnly));
  }
}
