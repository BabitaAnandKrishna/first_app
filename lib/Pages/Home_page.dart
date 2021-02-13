import 'package:first_app/model/catelog.dart';
import 'package:first_app/widgets/drawer.dart';
import 'package:first_app/widgets/item_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Devlopment";
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
