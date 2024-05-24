import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/app_routes.dart';
import 'views/product_overview_screen.dart';
import 'views/product_detail_screen.dart';
import 'views/cart_screen.dart';
import 'providers/products.dart';
import 'providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Minha Loja',
        theme: ThemeData(
          primaryColor: Colors.lightBlue,
          hintColor: Colors.deepOrange,
          fontFamily: 'Lato',

        ),
        home: ProductOverviewScreen(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
          AppRoutes.CART: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
