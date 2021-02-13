import 'package:first_app/model/catelog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemWidgets extends StatelessWidget {
   final Item item;

  const ItemWidgets({Key key, @required this.item})
      : assert(item != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 0.0,
      child: ListTile(
        onTap: (){
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
    );
  }
}
