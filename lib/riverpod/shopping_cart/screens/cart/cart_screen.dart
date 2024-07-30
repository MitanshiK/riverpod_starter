import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/riverpod/shopping_cart/providers/notifier_provider.dart';
import 'package:riverpod_files/riverpod/shopping_cart/providers/products_provider.dart';

class CartScreen extends ConsumerStatefulWidget {   // statefulwidget to consumerStatefulwidget
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();    // state to consumerState
}

class _CartScreenState extends ConsumerState<CartScreen> {   // state to consumerState
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
  final cartProducts= ref.watch(cartChangeNotifierProvider);   // we automatically get reference to ref  unlike consumerWidget
  final cartValue=ref.watch(cartotalProvider); 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child:  Column(
          children: [
            Column(
              children:cartProducts.map((e) {
               return ListTile(
                leading: Image(image: AssetImage(e.image), width: 50,height: 50,),
                title: Text(e.title),
                trailing: Text("Rs ${e.price.toString()}"),
               );
              }).toList()
            ),
            Center(
           child: Text("Total is ${cartValue}"),
            
            )

            // output totals here
          ],
        ),
      ),
    );
  }
}

