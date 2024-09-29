import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  //list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom Freak',
      price: '224.99',
      description: 'The forward-thinking design of his latest signature shoe.',
      imagePath: 'lib/images/pngwing.com-3.png',
    ),
    Shoe(
      name: "Air Jordan's",
      price: '239.99',
      description:
          "Greatness needs a lot of things, But it doesn't need an audience. Just do it.",
      imagePath: 'lib/images/pngwing.com-3.png',
    ),
    Shoe(
      name: "Dunk's",
      price: '164.99',
      imagePath: 'lib/images/pngwing.com-4.png',
      description: "The only one who can tell you "
          "You can't"
          " is you. And you don't have to listen.",
    ),
    Shoe(
      name: "Air Max",
      price: '119.99',
      imagePath: 'lib/images/pngwing.com-5.png',
      description: "A step ahead of the pack.",
    ),
  ];

  //list of shoes in the users cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getCart() {
    return userCart;
  }

  // get items in cart
  int getCartCount() {
    return userCart.length;
  }

  //add item to cart
  void addItem(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItem(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
