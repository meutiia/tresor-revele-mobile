import 'package:flutter/material.dart';
import 'package:tresor_revele/screens/goodsentry_form.dart';
import 'package:tresor_revele/screens/list_goodsentry.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:tresor_revele/screens/login.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color; // Menambahkan properti warna

  ItemHomepage(this.name, this.icon, this.color); // Mengubah constructor
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          if (item.name == "Add Goods") {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Kamu telah menekan tombol ${item.name}!")
                )
              );
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GoodsEntryFormPage()));
          }
          else if (item.name == "See Goods") {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Kamu telah menekan tombol ${item.name}!")
                )
              );
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GoodsEntryPage()));
          }
          else if (item.name == "Logout") {
            final response = await request.logout(
              "http://localhost:8000/auth/logout/");
            String message = response["message"];
            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message See you, $uname!"),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              }
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: const Color.fromARGB(255, 59, 59, 59),
                  size: 35.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 59, 59, 59),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}