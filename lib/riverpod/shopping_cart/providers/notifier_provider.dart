
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/riverpod/shopping_cart/models/product.dart';

part 'notifier_provider.g.dart';

@riverpod
class CartChangeNotifier extends _$CartChangeNotifier{

// class CartChangeNotifier extends Notifier<Set<Product>>{  // w/o generator

  @override
  Set<Product> build() {
    return
   const { 
    Product(id: "1", title: "bag", price: 1000, image: "assets/products/backpack.png"),
      };
  }

  // adding product to the cart
  void addProdToCart(Product product){
  if(!state.contains(product)){
    state={...state,product};  // adding product to the existing state
  }
}

void removeFromCart(Product product){
  if(state.contains(product)){            // checjk if state contains the product
    state=state.where((e)=> e.id !=product.id).toSet();  // keep all products except the one with provided id
  }
}
  void blahBlah(Product item){
    if(state.contains(item)) { state={...state,state.first};}
     else { state={...state,item}; }
  }


}

// // notifier provider to change the state and notify the consumers about he change
// final cartChangeNotifierProvider = NotifierProvider<CartChangeNotifier,Set<Product>>((){
//   return CartChangeNotifier();
// });

@riverpod
int cartotal(ref){
 final cartItems= ref.watch(cartChangeNotifierProvider);
var total=0;

 for(Product product in cartItems){
 total=total+product.price;
 }
 return total;
}