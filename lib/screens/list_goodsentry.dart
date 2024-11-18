import 'package:flutter/material.dart';
import 'package:tresor_revele/models/goods_entry.dart';
import 'package:tresor_revele/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:tresor_revele/screens/goods_detail.dart';

class GoodsEntryPage extends StatefulWidget {
  const GoodsEntryPage({super.key});

  @override
  State<GoodsEntryPage> createState() => _GoodsEntryPageState();
}

class _GoodsEntryPageState extends State<GoodsEntryPage> {
  Future<List<GoodsEntry>> fetchGoods(CookieRequest request) async {
    // Mengambil username dari cookie request
    final response = await request.get('http://localhost:8000/json-by-user/');
    
    // Melakukan decode response menjadi bentuk json
    var data = response;
    
    // Melakukan konversi data json menjadi object GoodsEntry
    List<GoodsEntry> listGoods = [];
    for (var d in data) {
      if (d != null) {
        listGoods.add(GoodsEntry.fromJson(d));
      }
    }
    return listGoods;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goods Catalogue'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchGoods(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    "Sorry, there's no goods for now!",
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16, 
                    vertical: 12,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailItemPage(
                            item: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data![index].fields.name}",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("Rp ${snapshot.data![index].fields.price}"),
                          const SizedBox(height: 10),
                          Text(
                            "${snapshot.data![index].fields.description}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}