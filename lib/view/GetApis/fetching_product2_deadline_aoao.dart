// array => object => array => object (best for complex structure)

//when data starts without array
//if data starts with object then use this example
//this json data created by you, you can check end of this page webhook can be disable maybe that is why

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/models/GetApisModels/product2.dart';

class FetchingProductTwoScreen extends StatefulWidget {
  const FetchingProductTwoScreen({super.key});

  @override
  State<FetchingProductTwoScreen> createState() =>
      _FetchingProductTwoScreenState();
}

class _FetchingProductTwoScreenState extends State<FetchingProductTwoScreen> {
  late List<ProductsModelTwo> productsList;

  Future<List<ProductsModelTwo>> getapi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/47e618e9-b362-45f1-98ac-88daedfa672d'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body.toString());

      productsList = [];
      for (var item in jsonData) {
        productsList.add(ProductsModelTwo.fromJson(item));
      }
      return productsList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text('Fetching Product'),
      ),
      body: FutureBuilder(
        future: getapi(),
        builder: (context, AsyncSnapshot<List<ProductsModelTwo>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * .2,
                  height: MediaQuery.of(context).size.height * .5,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: productsList[index].data!.length,
                    itemBuilder: (context, dataIndex) {
                      return SizedBox(
                          width: MediaQuery.of(context).size.width * .2,
                          height: MediaQuery.of(context).size.height * .3,
                          child: Center(
                              child: Image(
                                  image: NetworkImage(
                            productsList[index]
                                .data![dataIndex]
                                .images![dataIndex]
                                .url
                                .toString(),
                          ))));
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

// json data for testing // paste in https://webhook.site/ for checking
/*
[{ "success" : true, "message" : "All data" , "data" : [ { "_id" : "asdf231asdfadsfsad2438rjsd" , "on_sale" : true, "sale_percent" : 20, "sold" : 20, "slider_new" : false, "slider_recent" : false, "slider_sold" : false, "date" : "2023-01-05T07: 56: 19.219Z" , "title" :"TMTS121-50199" , "categories" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" : "clothes" , "image" : "https: //images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "subcat" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" }, "shop" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "is_active" : false, "created_At" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" , "description" : "This is enderobe brand" , "shopemail" : "adenreobe@gmail.com" , "shopaddress" : "Islamabad F8" , "shopcity" : "Islamabad" , "userid" : "23asdfasfdsfd" , "image" : "https://images.pexels.com/photos/5531004/pexels-photo-5531004.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "price" : "2500" , "sale_title" : "Winter Sale" , "sale_price" : "2300" , "description" : "22% off all the sales " , "color" : "#FF6347,#CD5C5C" , "size" : "S,M,L,XL,XXL" , "in_wishlist" : true, "images" : [ { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/336372/pexels-photo-336372.jpeg?auto=compress&cs=tinysrgb&w=1200" } ] }, { "_id" : "asdf231asdfadsfsad2438rjsd" , "on_sale" : true, "sale_percent" : 20, "sold" : 20, "slider_new" : false, "slider_recent" : false, "slider_sold" : false, "date" : "2023-01-05T07: 56: 19.219Z" , "title" :"TMTS121-50199" , "categories" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" : "clothes" , "image" : "https: //images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "subcat" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" }, "shop" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "is_active" : false, "created_At" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" , "description" : "This is enderobe brand" , "shopemail" : "adenreobe@gmail.com" , "shopaddress" : "Islamabad F8" , "shopcity" : "Islamabad" , "userid" : "23asdfasfdsfd" , "image" : "https://images.pexels.com/photos/5531004/pexels-photo-5531004.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "price" : "2500" , "sale_title" : "Winter Sale" , "sale_price" : "2300" , "description" : "22% off all the sales " , "color" : "#FF6347,#CD5C5C" , "size" : "S,M,L,XL,XXL" , "in_wishlist" : true, "images" : [ { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/336372/pexels-photo-336372.jpeg?auto=compress&cs=tinysrgb&w=1200" } ] }, { "_id" : "asdf231asdfadsfsad2438rjsd" , "on_sale" : true, "sale_percent" : 20, "sold" : 20, "slider_new" : false, "slider_recent" : false, "slider_sold" : false, "date" : "2023-01-05T07: 56: 19.219Z" , "title" :"TMTS121-50199" , "categories" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" : "clothes" , "image" : "https: //images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "subcat" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" }, "shop" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "is_active" : false, "created_At" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" , "description" : "This is enderobe brand" , "shopemail" : "adenreobe@gmail.com" , "shopaddress" : "Islamabad F8" , "shopcity" : "Islamabad" , "userid" : "23asdfasfdsfd" , "image" : "https://images.pexels.com/photos/5531004/pexels-photo-5531004.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "price" : "2500" , "sale_title" : "Winter Sale" , "sale_price" : "2300" , "description" : "22% off all the sales " , "color" : "#FF6347,#CD5C5C" , "size" : "S,M,L,XL,XXL" , "in_wishlist" : true, "images" : [ { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/336372/pexels-photo-336372.jpeg?auto=compress&cs=tinysrgb&w=1200" } ] } ] } ]
 */
