import 'package:flutter/material.dart';
import '../model/Item.dart';
import "package:provider/provider.dart";
import '../provider/shoppingcart_provider.dart';

// MyCatalog is a StatefulWidget that displays a list of products.
class MyCatalog extends StatefulWidget {
  const MyCatalog({super.key});

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  // List of products available in the catalog.
  List<Item> productsCatalog = [
    Item("Shampoo", 10.00, 2),
    Item("Soap", 12, 3),
    Item("Toothpaste", 40, 3),
  ];

  @override
  Widget build(BuildContext context) {
    // Builds the UI elements of the MyCatalog screen.
    return Scaffold(
        appBar: AppBar(title: const Text("My Catalog")), // Displays the app bar with a title.
        body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              // Builds each product as a ListTile in the ListView.
              return ListTile(
                leading: const Icon(Icons.star), // Icon representing the product.
                title: Text("${productsCatalog[index].name} - \$${productsCatalog[index].price}"),
                // Displays product name and price.
                trailing: TextButton(
                  child: const Text("Add"),
                  onPressed: () {
                    // Adds the product to the shopping cart when the button is pressed.
                    context.read<ShoppingCart>().addItem(productsCatalog[index]);
                    // Shows a Snackbar notification when a product is added.
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${productsCatalog[index].name} added!"),
                      duration: const Duration(seconds: 1, milliseconds: 100),
                    ));
                  },
                ),
              );
            },
            itemCount: productsCatalog.length), // The number of items in the product list.
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          onPressed: () {
            // Navigates to the MyCart screen when the floating action button is pressed.
            Navigator.pushNamed(context, "/cart");
          },
        ));
  }
}