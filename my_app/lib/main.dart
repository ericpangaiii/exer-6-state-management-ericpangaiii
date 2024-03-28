import 'package:flutter/material.dart';
import 'package:my_app/screen/MyCart.dart';
import 'package:my_app/screen/MyCatalog.dart';
import 'package:my_app/screen/Checkout.dart';
import 'package:provider/provider.dart';
import 'provider/shoppingcart_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // Initializes a ChangeNotifierProvider for ShoppingCart.
      // This allows ShoppingCart to be accessed anywhere in the app.
      ChangeNotifierProvider(create: (context) => ShoppingCart())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/", // Sets the initial route of the app to MyCatalog.
      routes: {
        // Defines the app's navigation routes.
        "/cart": (context) => const MyCart(), // Route to the MyCart screen.
        "/products": (context) => const MyCatalog(), // Route to the MyCatalog screen.
        "/checkout": (context) => Checkout(), // Route to the Checkout screen.
      },
      home: const MyCatalog(), // Sets the default home screen of the app.
    );
  }
}