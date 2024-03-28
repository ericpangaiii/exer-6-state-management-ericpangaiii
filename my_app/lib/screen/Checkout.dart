import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/Item.dart';
import '../provider/shoppingcart_provider.dart';

// Checkout is a StatelessWidget that displays the checkout screen.
class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accesses ShoppingCart from the Provider to get the current state of the cart.
    final cart = Provider.of<ShoppingCart>(context);
    // Checks if the cart has items.
    bool hasItems = cart.cart.isNotEmpty;

    // Builds UI based on whether there are items in the cart.
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Center(
        child: hasItems ? Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded (
              child: getItems(context)
            ), // Displays the list of items in the cart.
            Expanded (
              child: computeCost(context),
            ), // Shows the total price.
            ElevatedButton(
              onPressed: () {
                cart.removeAll(); // Clears the cart.
                // Navigates back to the product catalog screen.
                Navigator.pushNamed(context, "/products");
                // Shows a snackbar indicating the payment was successful.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Payment Successful!')),
                );
              },
              child: const Text('Pay Now'),
            ),
            TextButton(
              // Navigates back to the product catalog screen when pressed.
              child: const Text("Go back to Product Catalog"),
              onPressed: () {
                Navigator.pushNamed(context, "/products");
              },
            ),
          ],
        ) : Column(
          // Displayed when there are no items in the cart.
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('No items to checkout!'), // Indicates the cart is empty.
            TextButton(
              // Provides an option to return to the product catalog.
              child: const Text("Go back to Product Catalog"),
              onPressed: () {
                Navigator.pushNamed(context, "/products");
              },
            )
          ]
        )
      ),
    );
  }

  // getItems builds a list view of items in the cart.
  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    return products.isEmpty
        ? const Text('No Items yet!') // Displayed if the cart is empty.
        : Expanded(
            child: Column(
              children: [
                Flexible(
                  // ListView.builder used to build a list item for each product in the cart.
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Each item is represented as a ListTile.
                      return ListTile(
                        leading: const Icon(Icons.food_bank), // Icon for the item.
                        title: Text(products[index].name), // Name of the item.
                        trailing: Text('\$${products[index].price}'), // Price of the item.
                      );
                    },
                  )
                )
              ]
            ),
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