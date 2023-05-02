import 'dart:convert';

import 'datamodel.dart';
import 'package:http/http.dart' as http;

class DataManager {
  List<Category> _menu;
  List<ItemInCart> cart = [];

  FetchMenu() async {
    try {

      const url = "https://dl.dropboxusercontent.com/s/r0s8gput7d24c1y/menu.json?dl=0";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _menu = [];
        var body = response.body;
        var decodeData = jsonDecode(body) as List<dynamic>;
        for (var json in decodeData) {
          _menu.add(Category.fromJson(json));
        }
      } else {
        throw Exception("Error Loading Data");
      }
    } catch (e) {
      throw Exception("Error Loading Data");
    }
  }

  Future<List<Category>> getMenu() async {
    if (_menu == null) {
      await FetchMenu();
    }
    return _menu;
  }

  cartAdd(Product p) {
    bool found = false;
    for (var item in cart) {
      if (item.product.id == p.id) {
        item.quantity++;
        found = true;
        // loop all the items in cart to check if the newly added
        // item id match existing items in the cart.if yes, this will
        // only increase item quantity.
      }
    }
    if (!found) {
      // If found value to false here, no existing item in cart.
      // Thus add new item to cart with quantity value 1
      cart.add(ItemInCart(product: p, quantity: 1));
    }
  }

  cartRemove(Product p) {
    cart.removeWhere((item) => item.product.id == p.id);
  }

  cartClear(Product p) {
    cart.clear();
  }

  double cartTotal() {
    // total has to be 0.0 or type has to be double
    var total = 0.0;
    for (var item in cart) {
      total += item.quantity * item.product.price;
    }
    return total;
  }
}
