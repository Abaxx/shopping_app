import 'package:flutter/material.dart';
import 'package:shopping_app/checkout.dart';
import 'package:shopping_app/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Shopping App'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

  final List _widgetOption = [Products(),Checkout()];
  int selectedIndex = 0;

  void onItemTapped(int index)
  {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            //canvasColor: Colors.black,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.deepPurple,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.list_outlined,color: Colors.black45,),
                label: 'Products',),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout,color: Colors.black45,),
                label: 'Checkout',),
            ],
            currentIndex: selectedIndex,
            onTap: onItemTapped,
          ),
        ),
      body: Container(
          child: _widgetOption.elementAt(selectedIndex),
      ),
    );
  }
}
