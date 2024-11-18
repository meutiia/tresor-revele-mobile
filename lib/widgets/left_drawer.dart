import 'package:flutter/material.dart';
import 'package:tresor_revele/screens/list_goodsentry.dart';
import 'package:tresor_revele/screens/menu.dart';
import 'package:tresor_revele/screens/goodsentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'Trésor Révélé',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Step into our collections!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
            ListTile(
            leading: const Icon(Icons.other_houses_outlined),
            title: const Text('Home Page'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.wallet_giftcard_outlined),
            title: const Text('Add New Goods'),
            // Bagian redirection ke MoodEntryFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GoodsEntryFormPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_mall_outlined),
            title: const Text('Goods Catalogue'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GoodsEntryPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}