import 'package:first_app/model/catelog.dart';
import 'package:first_app/widgets/drawer.dart';
import 'package:first_app/widgets/item_widgets.dart';
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
     final  catalogjson =
        await rootBundle.loadString("assets/files/catalog.jason");
     final  decodecData = jsonDecode(catalogjson);
     var productData = decodecData["products"];
     

  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return  Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          // itemCount: CatalogModel.items.length,
            itemCount: dummyList.length,
            itemBuilder: (context,index){
            return ItemWidgets(
              // item: CatalogModel.items[index],
              item: dummyList[index],
            );
            }),
      ),
      drawer: MyDrawer(

      ),
    );
  }
}
