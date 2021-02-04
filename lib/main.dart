// /// Flutter code sample for Scaffold.of
//
// // Typical usage of the [Scaffold.of] function is to call it from within the
// // `build` method of a child of a [Scaffold].
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Code Sample for Scaffold.of.',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: Scaffold(
//         body: MyScaffoldBody(),
//         appBar: AppBar(title: Text('Scaffold.of Example')),
//       ),
//       color: Colors.white,
//     );
//   }
// }
//
// class MyScaffoldBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         child: Text('SHOW A SNACKBAR'),
//         onPressed: () {
//           Scaffold.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Hello!'),
//                 duration:  Duration(minutes: 5),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:first_app/Pages/Login_Page.dart';
import 'package:flutter/material.dart';
import 'Pages/Home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
          themeMode: ThemeMode.light,
          theme: ThemeData(
            primarySwatch: Colors.deepPurple
          ),
          darkTheme: ThemeData(
          brightness: Brightness.dark
      ),
      initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/Login" :(context) => LoginPage()
      },
    );
  }
}
