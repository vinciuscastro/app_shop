import 'package:flutter/material.dart';
import '../utils/app_routes.dart';
import 'package:provider/provider.dart';
import '../providers/settings.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final stg = Provider.of<Settings>(context, listen: false);

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
            Spacer(),
            SwitchListTile(
              title: const Text('Modo Escuro'),
              value: stg.isDark,
              onChanged: (value) {
                stg.toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}
