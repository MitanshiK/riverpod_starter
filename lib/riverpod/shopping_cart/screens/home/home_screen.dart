import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_files/riverpod/shopping_cart/providers/notifier_provider.dart';
import 'package:riverpod_files/riverpod/shopping_cart/providers/products_provider.dart';
import 'package:riverpod_files/riverpod/shopping_cart/shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context ,WidgetRef ref) {
   final allProducts=ref.watch(productsProvider);    // to read the  value in provider
   final cartProducts= ref.watch(cartChangeNotifierProvider);  // to check what products are alredy in the cart
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions:  [
          DropdownButton(       // for sorting products
            value:ref.watch(sortTypeProvider),
          onChanged: (value) {
          ref.read(sortTypeProvider.notifier).state=value!;
          },
          items: const [
            DropdownMenuItem(
              value: sortType.name,
              child: Text("sort by Name"),),
              DropdownMenuItem(
              value: sortType.price,
              child: Text("sort by Price"),),
          ])
          ,CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder:(context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(
                children: [
                   Image(image: AssetImage(allProducts[index].image),width: 60,height: 60,),
                   Text(allProducts[index].title),
                    Text(allProducts[index].price.toString()),
                    if(cartProducts.contains(allProducts[index]))
                    Expanded(
                      child: TextButton(
                        onPressed: (){
                         ref.read(cartChangeNotifierProvider.notifier).removeFromCart(allProducts[index]);    
                      }, child: Text("Remove")),
                    ),
                    if(!cartProducts.contains(allProducts[index]))
                    Expanded(
                      child: TextButton(
                        onPressed: (){
                       ref.read(cartChangeNotifierProvider.notifier).addProdToCart(allProducts[index]);   
                      }, child: Text("Add to cart")),
                    ),
              ],),
            );
          },
        ),
      ),
    );
  }
}