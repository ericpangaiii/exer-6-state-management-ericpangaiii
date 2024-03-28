import 'package:flutter/material.dart';
import '../model/Item.dart';

// ShoppingCart class manages the state of a shopping cart, including the items in the cart
// and the total cost. It uses ChangeNotifier to notify listeners about changes in the cart's state.
class ShoppingCart with ChangeNotifier {
  // A private list to store items added to the shopping cart.
  final List<Item> _shoppingList = [];
  
  // Tracks the total cost of all items in the shopping cart.
  double cartTotal = 0;
  
  // Public getter to access the list of items in the shopping cart.
  List<Item> get cart => _shoppingList;

  // Adds an item to the shopping cart and updates the total cost.
  // Notifies listeners about the change.
  void addItem(Item item) {
    _shoppingList.add(item);
    cartTotal += item.price; // Update the total cost.
    notifyListeners(); // Notify all listening widgets of the update.
  }

  // Removes all items from the shopping cart and resets the total cost.
  // Notifies listeners about the change.
  void removeAll() {
    _shoppingList.clear();
    cartTotal = 0; // Reset the total cost.
    notifyListeners(); // Notify all listening widgets of the update.
  }

  // Removes a specific item from the shopping cart by name and updates the total cost.
  // Notifies listeners about the change.
  void removeItem(String name) {
    for (int i = 0; i < _shoppingList.length; i++) {
      if (_shoppingList[i].name == name) {
        cartTotal -= _shoppingList[i].price; // Update the total cost.
        _shoppingList.removeAt(i); // Remove the item from the cart.
        break; // Exit the loop once the item is found and removed.
      }
    }
    notifyListeners(); // Notify all listening widgets of the update.
  }
}