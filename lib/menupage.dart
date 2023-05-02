import 'package:coffee_masters/datamanager.dart';
import 'package:coffee_masters/datamodel.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager;
  const MenuPage({Key key, @required this.dataManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var p = Product(id: 1, name: "Noodle", price: 10, image: "");
    // var p1 = Product(id: 1, name: "Black Coffee", price: 20, image: "");
    return FutureBuilder(
      future: dataManager.getMenu(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          // var categories = snapshot.data as List<Category>;
          // return Text("There are ${categories.length}");
          var categories = snapshot.data as List<Category>;
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(categories[index].name),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: categories[index].products.length,
                    itemBuilder: (context, prodIndex) {
                      var product = categories[index].products[prodIndex];
                      return ProductItem(
                          product: product,
                          onAdd: (addedProduct) {
                            dataManager.cartAdd(addedProduct);
                          });
                    },
                  )
                ],
              );
            }),
          );
        } else {
          if (snapshot.hasError) {
            return const Text("Error fetching Data");
          } else {
            return const CircularProgressIndicator();
          }
        }
      }),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  // onAdd function, callback function, Widget will lift up value here upon trigger
  final Function onAdd;

  const ProductItem({
    Key key,
    @required this.product,
    @required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  product.imageUrl,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(product.name),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("\$${product.price} MMK"),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          onAdd(product);
                        },
                        child: const Text("Add"),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
