import 'package:first_app/model/catelog.dart';
import 'package:first_app/widgets/drawer.dart';
import 'package:first_app/widgets/item_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Devlopment";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData() async{
    await Future.delayed(Duration(seconds: 2));
     final  catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
     final  decodecData = jsonDecode(catalogJson);
     var productData = decodecData["products"];
     CatalogModel.items = List.from(productData)
         .map<Item>((item) => Item.fromMap(item))
         .toList();
        setState(() {});

  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child:(CatalogModel.items != null && CatalogModel.items.isNotEmpty )?
        // ListView.builder(
        //     itemCount: CatalogModel.items.length,
        //     itemBuilder: (context,index){
        //     return ItemWidgets(
        //       // item: CatalogModel.items[index],
        //       item: CatalogModel.items[index],
        //     );
        //     },
        // )
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             mainAxisSpacing: 16,
              crossAxisSpacing: 16
            ),
            itemBuilder: (context,index){
              final item = CatalogModel.items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: GridTile(
                  header: Container(
                      child: Text(item.name,
                        style: TextStyle(color: Colors.white),
                      ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                             color: Colors.deepPurple,
                    ),
                  ),
                  child: Image.network(
                    item.image,
                   ),
                  footer: Container(
                    child: Text(item.price.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                 
                ),
              );
            },
            itemCount: CatalogModel.items.length,
        )
        :Center(
          child: CircularProgressIndicator(),
        )
      ),
      drawer: MyDrawer(

      ),
    );
  }
}
