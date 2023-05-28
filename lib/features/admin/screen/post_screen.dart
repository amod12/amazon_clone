import 'package:amozon_clone/features/account/widgets/single_product.dart';
import 'package:amozon_clone/features/admin/screen/add_product_screen.dart';
import 'package:amozon_clone/features/admin/screen/loader.dart';
import 'package:amozon_clone/features/admin/servixes/admin_servixes.dart';
import 'package:amozon_clone/model/product.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  // making list nullable to put loading indicator
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    // fetchAllProducts is async taken from adminservies an int state cant be async
    // so new fetchAllProducts function is created below making it async
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  void deleteProduct(Product product, int index) {
    //product is also send as to know the info of deleted product in server side
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
          // index comes from grade view builder which tells which item[index]
          // should be deleted in screen side
          setState(() {});
        });
  }

// fetching all products and putting them in a customCard like format
  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
              // GridView.builder is used as we dont know how many items we have
              // in products
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              //gridDelegate tells how much items or product to show in row
              itemBuilder: (context, index) {
                final productData = products![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: SingleProduct(image: productData.images[0]),
                    ),
                    Row(children: [
                      Expanded(
                          child: Text(
                        productData.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )),
                      IconButton(
                          onPressed: () => deleteProduct(productData, index),
                          icon: const Icon(Icons.delete_outline))
                    ]),
                  ],
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: navigateToAddProduct,
              tooltip: 'ADD product',
            ),
          );
  }
}
