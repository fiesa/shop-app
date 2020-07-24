import 'package:flutter/material.dart';
import 'package:shop/providers/auth.dart';
import './screens/auth_screen.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './screens/cart_screens.dart';
import './screens/edit_product_screen.dart';
import './screens/product_detail_screen.dart';

import 'package:provider/provider.dart';
import 'providers/products.dart';
import './screens/orders_screen.dart';
import './screens/user_product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      //value: Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: AuthScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreens.routeName: (ctx) => CartScreens(),
          OrdersScreen.routeName: (ctx)=>OrdersScreen(),
          UserProductScreen.routeName: (ctx)=>UserProductScreen(),
          EditProductScreen.routeName: (ctx) =>EditProductScreen(),
        },
      ),
    );
  }
}
