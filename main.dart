import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/column.dart';
import 'package:untitled/avatar_stack.dart';
import 'dart:io';

import 'package:untitled/container.dart';
//import 'package:my_flutter_app/exercise1.dart';
import 'package:untitled/expanded.dart';
import 'package:untitled/list.dart';
//import 'package:my_flutter_app/list_builder.dart';
//import 'package:my_flutter_app/list_column.dart';
import 'package:untitled/list_horizontall.dart';
import 'package:untitled/pokemon/index.dart';
//import 'packagemy_flutter_app/question.dart';
import 'package:untitled/row.dart';
import 'package:untitled/stack.dart';
//import 'package:my_flutter_app/stateful_counter.dart';
//import 'package:my_flutter_app/stateful_row.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My New App',
      home: PokemonsListPage(),
      //home : HomePage(),

    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('My Title'),
      ),
      drawer: Drawer(
        child: SafeArea(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close the drawer!'),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Compose'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 100,
        ),
        color: Theme.of(context).colorScheme.primary,
      ),
      body: MyBody(),
    );
  }
}

class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    // return Center(
    // child: Image.network(
    //   "https://static.thenounproject.com/png/105260-200.png",
    //   width: 300, // Adjust width as needed
    //   height: 300, // Adjust height as needed
    // ),
    //child: CachedNetworkImage(
    // imageUrl: 'https://images.news18.com/ibnlive/uploads/2024/06/virat-kohli-rohit-sharma-hug-x-feature-2024-06-67f67e42fc1e73f303947a4c84feb877.png',
    //  errorWidget: (context,url,error){
    //    return Text('Problem loading image',
    //    style: TextStyle(fontSize: 40,color: Colors.red),
    //    );
    //  },
    //  ),
    // );
    //return Center(
    //child: TextButton.icon(
    //onPressed: () {
    //print('Textbutton pressed');
    //},
    //label: const Text('Click me',
    //style: TextStyle(
    //  fontSize: 50,
    //),
    //),
    //icon: const Icon(
    //Icons.add,
    //size:50,
    //color: Colors.red,
    //)
    //),
    //);
    // return Center(
    //   child: CircularProgressIndicator(
    //     backgroundColor: Colors.grey,
    //     color: Colors.red,
    //     strokeWidth: 15,
    //     strokeAlign: 10,
    //   ),
    // );
    // return Center(
    //   child: CupertinoActivityIndicator(radius: 50, color: Colors.amber),
    // );
    // return Center(
    //   child:LinearProgressIndicator(
    //     color:Color.fromARGB(255, 27, 183, 165),
    //     backgroundColor: Color.fromARGB(255, 205, 46, 25),
    //     minHeight: 20,
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(10)),
    //   )
    // );
    //return PESUContainer();
    //return PESURow();
    //return PESUColumn();
    //return PESUExpanded();
    //return PESUStack();
    //return PESUQuestion240();
    //return AvatarStack(n : 6);
    //return PESUList(n: 100,);
    //return PokemonsListPage();
    return PracAvatarStack(n: 4);

       }
}