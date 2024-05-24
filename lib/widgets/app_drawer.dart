import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            AppBar(
              title: const Text('Bem Vindo Usuário!', style: TextStyle(color: Colors.white)),
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).primaryColor,

            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.shop),
              title: const Text('Loja'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Pedidos'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
              },
            ),
          ],
        ),
      ),
    );
  }
}
