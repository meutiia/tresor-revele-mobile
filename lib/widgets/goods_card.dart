import 'package:flutter/material.dart';
import 'package:tresor_revele/screens/goodsentry_form.dart';

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
    return Material(
      color: item.color, // Menggunakan warna dari item
      borderRadius: BorderRadius.circular(12),
      
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );

          if (item.name == "Add Goods") {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GoodsEntryFormPage()));
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