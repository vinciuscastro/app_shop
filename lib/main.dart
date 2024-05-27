import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/app_routes.dart';
import 'views/product_overview_screen.dart';
import 'views/product_detail_screen.dart';
import 'views/cart_screen.dart';
import 'views/orders_screen.dart';
import 'providers/products.dart';
import 'providers/cart.dart';
import 'providers/orders.dart';
import 'providers/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Orders()),
        ChangeNotifierProvider(create: (_) => Settings()),
      ],
      child: Consumer<Settings>(
        builder: (ctx, settings, _) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: Colors.purple,
              hintColor: Colors.deepOrange,
              fontFamily: 'Lato',
              textTheme: ThemeData.light().textTheme.copyWith(
                    titleMedium: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    titleSmall: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    titleLarge: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
            ),
            darkTheme: ThemeData(
              primaryColor: Colors.purple,
              hintColor: Colors.deepOrange,
              fontFamily: 'Lato',
              brightness: Brightness.dark,
              textTheme: ThemeData.light().textTheme.copyWith(
                  titleMedium: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  titleSmall: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  titleLarge: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
            ),
            themeMode: settings.isDark ? ThemeMode.dark : ThemeMode.light,
            title: 'Minha Loja',
            routes: {
              AppRoutes.HOME: (ctx) => ProductOverviewScreen(),
              AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
              AppRoutes.CART: (ctx) => const CartScreen(),
              AppRoutes.ORDERS: (ctx) => const OrdersScreen(),
            },
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
