import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/cart.dart';
import '../modules/shoe.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  Shoe shoe;
  CartItem({
    super.key,
    required this.shoe,
  });

  // remove item from cart
  void removeItemFromCart(BuildContext context) {
    Provider.of<Cart>(context, listen: false).removeItem(shoe);

    //alert the user that the item was successfully deleted from the cart
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey[500],
        content: Text('${shoe.name} removed from cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(shoe.imagePath),
      title: Text(shoe.name),
      subtitle: Text('\$${shoe.price}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => removeItemFromCart(context),
      ),
    );
  }
}
