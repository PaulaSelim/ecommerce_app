import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/shoe_tile.dart';
import '../modules/cart.dart';
import '../modules/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //search bar
          Container(
            margin: const EdgeInsets.all(13),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.search,
                ),
              ],
            ),
          ),

          //message
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'every one flies.. some fly longer than others',
              style: TextStyle(color: Colors.grey),
            ),
          ),

          //hot picks
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hot Picks 🔥',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          //list of shoes for sale
          SizedBox(
            // height: 350,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Expanded(
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // get a shoe from shop list
                  Shoe shoe = value.getShoeList()[index];

                  //return the shoe
                  return ShoeTile(
                    shoe: shoe,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
