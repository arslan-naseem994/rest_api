//object => array => object => array (best for complex structure)

//when data starts without array
//if data starts with object then use this example
//this json data created by you, you can check end of this page webhook can be disable maybe that is why

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/models/GetApisModels/products.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var data;

  Future<ProductModel> getapi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/852b376a-c500-455a-92d2-445fa9fdf6a7'));
    data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text('Fetching Prodcuts'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getapi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            title: Text(snapshot
                                .data!.data![index].categories!.type
                                .toString()),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(snapshot
                                  .data!.data![index].images![index].url
                                  .toString()),
                            ),
                            subtitle: Text(snapshot
                                .data!.data![index].shop!.name
                                .toString()),
                          );
                        }));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}


/*
{ "success" : true, "message" : "All data" , "data" : [ { "_id" : "asdf231asdfadsfsad2438rjsd" , "on_sale" : true, "sale_percent" : 20, "sold" : 20, "slider_new" : false, "slider_recent" : false, "slider_sold" : false, "date" : "2023-01-05T07: 56: 19.219Z" , "title" :"TMTS121-50199" , "categories" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" : "clothes" , "image" : "https: //images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "subcat" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" }, "shop" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "is_active" : false, "created_At" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" , "description" : "This is enderobe brand" , "shopemail" : "adenreobe@gmail.com" , "shopaddress" : "Islamabad F8" , "shopcity" : "Islamabad" , "userid" : "23asdfasfdsfd" , "image" : "https://images.pexels.com/photos/5531004/pexels-photo-5531004.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "price" : "2500" , "sale_title" : "Winter Sale" , "sale_price" : "2300" , "description" : "22% off all the sales " , "color" : "#FF6347,#CD5C5C" , "size" : "S,M,L,XL,XXL" , "in_wishlist" : true, "images" : [ { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/336372/pexels-photo-336372.jpeg?auto=compress&cs=tinysrgb&w=1200" } ] }, { "_id" : "asdf231asdfadsfsad2438rjsd" , "on_sale" : true, "sale_percent" : 20, "sold" : 20, "slider_new" : false, "slider_recent" : false, "slider_sold" : false, "date" : "2023-01-05T07: 56: 19.219Z" , "title" :"TMTS121-50199" , "categories" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" : "clothes" , "image" : "https: //images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "subcat" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" }, "shop" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "is_active" : false, "created_At" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" , "description" : "This is enderobe brand" , "shopemail" : "adenreobe@gmail.com" , "shopaddress" : "Islamabad F8" , "shopcity" : "Islamabad" , "userid" : "23asdfasfdsfd" , "image" : "https://images.pexels.com/photos/5531004/pexels-photo-5531004.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "price" : "2500" , "sale_title" : "Winter Sale" , "sale_price" : "2300" , "description" : "22% off all the sales " , "color" : "#FF6347,#CD5C5C" , "size" : "S,M,L,XL,XXL" , "in_wishlist" : true, "images" : [ { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/336372/pexels-photo-336372.jpeg?auto=compress&cs=tinysrgb&w=1200" } ] }, { "_id" : "asdf231asdfadsfsad2438rjsd" , "on_sale" : true, "sale_percent" : 20, "sold" : 20, "slider_new" : false, "slider_recent" : false, "slider_sold" : false, "date" : "2023-01-05T07: 56: 19.219Z" , "title" :"TMTS121-50199" , "categories" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" : "clothes" , "image" : "https: //images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "subcat" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" }, "shop" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "is_active" : false, "created_At" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" , "description" : "This is enderobe brand" , "shopemail" : "adenreobe@gmail.com" , "shopaddress" : "Islamabad F8" , "shopcity" : "Islamabad" , "userid" : "23asdfasfdsfd" , "image" : "https://images.pexels.com/photos/5531004/pexels-photo-5531004.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "price" : "2500" , "sale_title" : "Winter Sale" , "sale_price" : "2300" , "description" : "22% off all the sales " , "color" : "#FF6347,#CD5C5C" , "size" : "S,M,L,XL,XXL" , "in_wishlist" : true, "images" : [ { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/336372/pexels-photo-336372.jpeg?auto=compress&cs=tinysrgb&w=1200" } ] } ] } 
*/