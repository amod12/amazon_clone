import 'dart:io';

import 'package:amozon_clone/common/custom_button.dart';
import 'package:amozon_clone/common/text.dart';
import 'package:amozon_clone/constant/uti.dart';
import 'package:amozon_clone/features/admin/servixes/admin_servixes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';

import '../../../constant/const.dart';

class AddProductScreen extends StatefulWidget { 
  static const String routeName = '/add-product';
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNamedController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final AdminServices adminServices = AdminServices();

  String category = 'Mobiles';
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    productNamedController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Books',
    'Appliances',
    'Fashion',
  ];

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          name: productNamedController.text,
          description: descriptionController.text,
          price: double.parse(priceController.text),
          quantity: double.parse(quantityController.text),
          category: category,
          images: images);
    }
  }

  void selectImages() async {
    var result = await pickImages();
    setState(() {
      images = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: const Text(
              'Add Product',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )),
      body: SingleChildScrollView(
          child: Form(
              key: _addProductFormKey,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    images.isNotEmpty
                        // shows images
                        ? CarouselSlider(
                            items: images.map(
                              (i) {
                                return Builder(
                                    builder: (BuildContext context) =>
                                        Image.file(
                                          i,
                                          fit: BoxFit.cover,
                                          height: 200,
                                        ));
                              },
                            ).toList(),
                            options: CarouselOptions(
                              viewportFraction: 1,
                              height: 200,
                            ),
                          )
                        : GestureDetector(
                            onTap: selectImages,
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(10),
                                dashPattern: const [10, 4],
                                strokeCap: StrokeCap.round,
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.folder_open,
                                        size: 40,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Put Image',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey.shade400,
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                        controller: productNamedController,
                        hintText: 'Product Name'),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: descriptionController,
                      hintText: 'Description',
                      maxlines: 7,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        controller: priceController, hintText: 'Price'),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        controller: quantityController, hintText: 'Quantity'),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: DropdownButton(
                        value: category,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                        ),
                        items: productCategories.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            category = newVal!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(text: 'Sell', onPressed: sellProduct)
                  ],
                ),
              ))),
    );
  }
}
