import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';
import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// this selected index is to control the bottom navigation bar
  int _selectedIndex = 0;

//this is a method to navigate the bottom navigation bar
  void navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = <Widget>[
    // shop page
    const ShopPage(),

    // cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomNavBar(index),
      ),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.black,
              padding: const EdgeInsets.only(left: 16),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawerScrimColor: Colors.grey.withOpacity(0.55),
      drawer: Drawer(
        backgroundColor: Colors.grey[300],
        // width: MediaQuery.of(context).size.width * 0.85,
        width: MediaQuery.of(context).size.width < 600
            ? MediaQuery.of(context).size.width * 0.85
            : 500,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.065,
                  ),
                  ListTile(
                    leading: const Icon(Icons.close),
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text('Cart'),
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  const ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.065,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
