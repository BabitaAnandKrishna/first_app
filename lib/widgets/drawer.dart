import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://image.freepik.com/free-vector/businesswoman-cartoon-character-making-presentations_1284-44025.jpg";
    return Drawer(
        child: Container(
          color: Colors.deepPurple,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(

                padding: EdgeInsets.zero,
                  child: UserAccountsDrawerHeader
                    (
                    margin: EdgeInsets.zero,
                    // decoration: BoxDecoration(
                    //   color: Colors.red,
                    // ),
                    accountName: Text("Babita Ku7mari"),
                    accountEmail: Text("abc@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    ),

                  ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.home,color: Colors.white,),
                title:Text("Home",
                textScaleFactor: 1,
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,),
                title:Text("Profile",
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.mail,color: Colors.white,),
                title:Text("Email me",
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
