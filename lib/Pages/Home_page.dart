import 'package:first_app/model/catelog.dart';
import 'package:first_app/widgets/drawer.dart';
import 'package:first_app/widgets/item_widgets.dart';
import 'package:first_app/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: MyTheme.creamColor,
      body:SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatelogHeader(),
              if(CatalogModel.items!= null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      )
    );
  }
}


class CatelogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
      "Trending Products".text.xl2.make(),
    ],
    );
  }
}


class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return CatalogItem(catalog: catalog);
        },
    );
  }
}


class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key,@required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
              image: catalog.image
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                     "\$${catalog.price}".text.bold.xl.make(),
                      ElevatedButton(
                          onPressed: (){},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                MyTheme.darkBluishColor
                            ),

                            shape: MaterialStateProperty.all(StadiumBorder())
                          ),
                          child: "Buy".text.make()
                      )
                    ],
                  ).pOnly(right: 8.0)
                ],
              )
          )
        ],
      )
    ).white.roundedLg.square(150).make().py16();
  }
}


class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key,@required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.py8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
