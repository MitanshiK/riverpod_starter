
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/riverpod/shopping_cart/models/product.dart';

// part 'products_provider.g.dart';   // indicates that thius file is a part of genrated file for products provider

final List<Product> allProducts= [
Product(id: "1", title: "bag", price: 1000, image: "assets/products/backpack.png"),
Product(id: "2", title: "drum", price: 10000, image: "assets/products/drum.png"),
Product(id: "3", title: "guitar", price: 20000, image: "assets/products/guitar.png"),
Product(id: "4", title: "jeans", price: 2000, image: "assets/products/jeans.png"),
Product(id: "4", title: "karati", price: 2000, image: "assets/products/karati.png"),
Product(id: "4", title: "shorts", price: 1000, image: "assets/products/shorts.png"),
Product(id: "4", title: "skates", price: 6000, image: "assets/products/skates.png"),
Product(id: "4", title: "suitcase", price: 4000, image: "assets/products/suitcase.png"),
];

enum sortType{
 name,
 price 
}

final sortTypeProvider=StateProvider<sortType>((ref){  // state provider
  return sortType.name;
});

// final productsProvider=Provider<List<Product>>((ref){   // read only provider[Provider]
// return allProducts;
// });

final productsProvider = Provider<List<Product>>((ref) {                        
  final sortby= ref.watch(sortTypeProvider);                  // for sorrting products
  switch (sortby) {
      case sortType.name :
     {
       allProducts.sort((a, b) => a.title.compareTo(b.title));
       return allProducts;
     }
      case sortType.price :
      allProducts.sort((a, b) => a.price.compareTo(b.price));
      return allProducts;
    
  }
});


final reducedProductsProvider =Provider((ref){     // read only provider with filtering 
      return allProducts.where((p)=>p.price< 4000).toList(); 
});

// @riverpod
// List<Product> products(ref){             // create a provider by suffixing function name with Provider eg productsProvider
//   final sortby= ref.watch(sortTypeProvider);
//   switch (sortby) {
//       case sortType.name :
//      {
//        allProducts.sort((a, b) => a.title.compareTo(b.title));
//        return allProducts;
//      }
//       case sortType.price :
//       { allProducts.sort((a, b) => a.price.compareTo(b.price));
//        return allProducts;
//       }
      
//   } 
// }