// MyCart is a StatelessWidget that displays the shopping cart screen.
import 'package:flutter/material.dart';
import '../model/Item.dart';
import "package:provider/provider.dart";
import "../provider/shoppingcart_provider.dart";

class MyCart extends StatelessWidget {
  // Constructor for MyCart widget.
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    // Builds the UI elements of the MyCart screen.
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Centers the column's children vertically.
        children: [
          Expanded(
            // Occupies available space and displays the list of items in the cart.
            child: getItems(context),
          ),
          Expanded(
            child: computeCost(context), // Displays the total cost of items in the cart.
          ),
          // A row that contains Checkout and Reset buttons.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly spaces the buttons horizontally.
            children: [
              ElevatedButton(
                // Navigates to the Checkout screen when pressed.
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                child: const Text("Checkout"),
              ),
              ElevatedButton(
                // Clears all items in the shopping cart when pressed.
                onPressed: () {
                  context.read<ShoppingCart>().removeAll();
                },
                child: const Text("Reset"),
              ),
            ]
          ),
          TextButton(
            // Navigates back to the product catalog screen when pressed.
            child: const Text("Go back to Product Catalog"),
            onPressed: () {
              Navigator.pushNamed(context, "/products");
            },
          ),
        ],
      ),
    );
  }

  // getItems returns a widget displaying the list of items in the shopping cart.
  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    // Checks if the cart is empty and returns a message if true.
    // Otherwise, it builds a list of ListTile widgets for each item in the cart.
    return products.isEmpty
        ? const Expanded(
            child: Text('No items yet!')
          )
        : Expanded(
            child:ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final item = products[index];
                // Each ListTile displays the name of the item and an icon button to remove it.
                return ListTile(
                  leading: const Icon(Icons.food_bank),
                  title: Text(item.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<ShoppingCart>().removeItem(item.name);
                    },
                  ),
                );
              },
            )
          );
  }

  // computeCost returns a widget that displays the total cost of items in the cart.
  Widget computeCost(BuildContext context) {
    // Uses a Consumer widget to listen for changes to ShoppingCart's state.
    return Consumer<ShoppingCart>(
      builder: (context, cart, child) {
        // Displays the total cost with padding for visual separation.
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Total: \$${cart.cartTotal}"),
        );
      },
    );
  }
}