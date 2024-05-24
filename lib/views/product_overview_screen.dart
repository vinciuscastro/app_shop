import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_routes.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge_widget.dart';
import '../providers/products.dart';
import '../providers/cart.dart';

enum FilterOptions {
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
                icon: const Icon(Icons.more_horiz),
                onSelected: (FilterOptions selected) {
                  setState(() {
                    _showFavoriteOnly = selected == FilterOptions.Favorite;
                  });
                },
                itemBuilder: (_) => [
                      const PopupMenuItem(
                        child: Text("Somente favoritos"),
                        value: FilterOptions.Favorite,
                      ),
                      const PopupMenuItem(
                        child: Text("Todos"),
                        value: FilterOptions.All,
                      ),
                    ]),
            Consumer<Cart>(
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CART);
                },
              ),
              builder: (_, cart, child) => BadgeWidget(
                value: cart.itemCount.toString(),
                color: Theme.of(context).hintColor,
                child: child!,
              ),
            )]
        ),
        body: ProductGrid(_showFavoriteOnly));
  }
}
