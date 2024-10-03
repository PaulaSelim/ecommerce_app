import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/cart.dart';
import '../modules/shoe.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({
    super.key,
    required this.shoe,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItem(widget.shoe);

    //alert the user that the item was successfully deleted from the cart
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey[500],
        content: Text('${widget.shoe.name} removed from cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(widget.shoe.imagePath),
      title: Text(widget.shoe.name),
      subtitle: Text(widget.shoe.price),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: removeItemFromCart,
      ),
    );
  }
}
