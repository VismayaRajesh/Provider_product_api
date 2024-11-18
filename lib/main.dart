import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_product_api/service/productProvider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ProductProvider>(create: (_) => ProductProvider()..fetch()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var list = context.watch<ProductProvider>().plist;
    return Scaffold(
      body: context.watch<ProductProvider>().isloading ? Center(child: CircularProgressIndicator(),) : ListView.builder(
          itemCount: list!.length, itemBuilder: (BuildContext context, int index) { 
            return ListTile(
              leading: CircleAvatar(child: Text("${list[index].id}"),),
              title: Text("${list[index].brand}"),
            );
      },
          ),
      
    );
  }
}
