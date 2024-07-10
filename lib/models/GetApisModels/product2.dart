class ProductsModelTwo {
  bool? success;
  String? message;
  List<Data>? data;

  ProductsModelTwo({this.success, this.message, this.data});

  ProductsModelTwo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  bool? onSale;
  int? salePercent;
  int? sold;
  bool? sliderNew;
  bool? sliderRecent;
  bool? sliderSold;
  String? date;
  String? title;
  Categories? categories;
  Subcat? subcat;
  Shop? shop;
  String? price;
  String? saleTitle;
  String? salePrice;
  String? description;
  String? color;
  String? size;
  bool? inWishlist;
  List<Images>? images;

  Data(
      {this.sId,
      this.onSale,
      this.salePercent,
      this.sold,
      this.sliderNew,
      this.sliderRecent,
      this.sliderSold,
      this.date,
      this.title,
      this.categories,
      this.subcat,
      this.shop,
      this.price,
      this.saleTitle,
      this.salePrice,
      this.description,
      this.color,
      this.size,
      this.inWishlist,
      this.images});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    onSale = json['on_sale'];
    salePercent = json['sale_percent'];
    sold = json['sold'];
    sliderNew = json['slider_new'];
    sliderRecent = json['slider_recent'];
    sliderSold = json['slider_sold'];
    date = json['date'];
    title = json['title'];
    categories = json['categories'] != null
        ? Categories.fromJson(json['categories'])
        : null;
    subcat = json['subcat'] != null ? Subcat.fromJson(json['subcat']) : null;
    shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
    price = json['price'];
    saleTitle = json['sale_title'];
    salePrice = json['sale_price'];
    description = json['description'];
    color = json['color'];
    size = json['size'];
    inWishlist = json['in_wishlist'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['on_sale'] = onSale;
    data['sale_percent'] = salePercent;
    data['sold'] = sold;
    data['slider_new'] = sliderNew;
    data['slider_recent'] = sliderRecent;
    data['slider_sold'] = sliderSold;
    data['date'] = date;
    data['title'] = title;
    if (categories != null) {
      data['categories'] = categories!.toJson();
    }
    if (subcat != null) {
      data['subcat'] = subcat!.toJson();
    }
    if (shop != null) {
      data['shop'] = shop!.toJson();
    }
    data['price'] = price;
    data['sale_title'] = saleTitle;
    data['sale_price'] = salePrice;
    data['description'] = description;
    data['color'] = color;
    data['size'] = size;
    data['in_wishlist'] = inWishlist;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? sId;
  String? type;
  int? salePercent;
  String? date;
  String? name;
  String? image;

  Categories(
      {this.sId,
      this.type,
      this.salePercent,
      this.date,
      this.name,
      this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    salePercent = json['sale_percent'];
    date = json['date'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['type'] = type;
    data['sale_percent'] = salePercent;
    data['date'] = date;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class Subcat {
  String? sId;
  String? type;
  int? salePercent;
  String? date;
  String? name;

  Subcat({this.sId, this.type, this.salePercent, this.date, this.name});

  Subcat.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    salePercent = json['sale_percent'];
    date = json['date'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['type'] = type;
    data['sale_percent'] = salePercent;
    data['date'] = date;
    data['name'] = name;
    return data;
  }
}

class Shop {
  String? sId;
  bool? isActive;
  String? createdAt;
  String? name;
  String? description;
  String? shopemail;
  String? shopaddress;
  String? shopcity;
  String? userid;
  String? image;

  Shop(
      {this.sId,
      this.isActive,
      this.createdAt,
      this.name,
      this.description,
      this.shopemail,
      this.shopaddress,
      this.shopcity,
      this.userid,
      this.image});

  Shop.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isActive = json['is_active'];
    createdAt = json['created_At'];
    name = json['name'];
    description = json['description'];
    shopemail = json['shopemail'];
    shopaddress = json['shopaddress'];
    shopcity = json['shopcity'];
    userid = json['userid'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['is_active'] = isActive;
    data['created_At'] = createdAt;
    data['name'] = name;
    data['description'] = description;
    data['shopemail'] = shopemail;
    data['shopaddress'] = shopaddress;
    data['shopcity'] = shopcity;
    data['userid'] = userid;
    data['image'] = image;
    return data;
  }
}

class Images {
  String? id;
  String? url;

  Images({this.id, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    return data;
  }
}

// json data for testing // paste in https://webhook.site/ for checking
/*
[{ "success" : true, "message" : "All data" , "data" : [ { "_id" : "asdf231asdfadsfsad2438rjsd" , "on_sale" : true, "sale_percent" : 20, "sold" : 20, "slider_new" : false, "slider_recent" : false, "slider_sold" : false, "date" : "2023-01-05T07: 56: 19.219Z" , "title" :"TMTS121-50199" , "categories" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" : "clothes" , "image" : "https: //images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "subcat" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" }, "shop" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "is_active" : false, "created_At" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" , "description" : "This is enderobe brand" , "shopemail" : "adenreobe@gmail.com" , "shopaddress" : "Islamabad F8" , "shopcity" : "Islamabad" , "userid" : "23asdfasfdsfd" , "image" : "https://images.pexels.com/photos/5531004/pexels-photo-5531004.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "price" : "2500" , "sale_title" : "Winter Sale" , "sale_price" : "2300" , "description" : "22% off all the sales " , "color" : "#FF6347,#CD5C5C" , "size" : "S,M,L,XL,XXL" , "in_wishlist" : true, "images" : [ { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/336372/pexels-photo-336372.jpeg?auto=compress&cs=tinysrgb&w=1200" } ] }, { "_id" : "asdf231asdfadsfsad2438rjsd" , "on_sale" : true, "sale_percent" : 20, "sold" : 20, "slider_new" : false, "slider_recent" : false, "slider_sold" : false, "date" : "2023-01-05T07: 56: 19.219Z" , "title" :"TMTS121-50199" , "categories" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" : "clothes" , "image" : "https: //images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "subcat" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" }, "shop" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "is_active" : false, "created_At" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" , "description" : "This is enderobe brand" , "shopemail" : "adenreobe@gmail.com" , "shopaddress" : "Islamabad F8" , "shopcity" : "Islamabad" , "userid" : "23asdfasfdsfd" , "image" : "https://images.pexels.com/photos/5531004/pexels-photo-5531004.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "price" : "2500" , "sale_title" : "Winter Sale" , "sale_price" : "2300" , "description" : "22% off all the sales " , "color" : "#FF6347,#CD5C5C" , "size" : "S,M,L,XL,XXL" , "in_wishlist" : true, "images" : [ { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/336372/pexels-photo-336372.jpeg?auto=compress&cs=tinysrgb&w=1200" } ] }, { "_id" : "asdf231asdfadsfsad2438rjsd" , "on_sale" : true, "sale_percent" : 20, "sold" : 20, "slider_new" : false, "slider_recent" : false, "slider_sold" : false, "date" : "2023-01-05T07: 56: 19.219Z" , "title" :"TMTS121-50199" , "categories" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" : "clothes" , "image" : "https: //images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "subcat" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "type" : "Women" , "sale_percent" : 20, "date" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" }, "shop" : { "_id" : "asdf231asdfadsfsad2438rjsd" , "is_active" : false, "created_At" : "2023-01-05T07: 56: 19.219Z" , "name" :"Shirts" , "description" : "This is enderobe brand" , "shopemail" : "adenreobe@gmail.com" , "shopaddress" : "Islamabad F8" , "shopcity" : "Islamabad" , "userid" : "23asdfasfdsfd" , "image" : "https://images.pexels.com/photos/5531004/pexels-photo-5531004.jpeg?auto=compress&cs=tinysrgb&w=1200" }, "price" : "2500" , "sale_title" : "Winter Sale" , "sale_price" : "2300" , "description" : "22% off all the sales " , "color" : "#FF6347,#CD5C5C" , "size" : "S,M,L,XL,XXL" , "in_wishlist" : true, "images" : [ { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" }, { "id" : "2342asdfasdf34", "url" : "https://images.pexels.com/photos/336372/pexels-photo-336372.jpeg?auto=compress&cs=tinysrgb&w=1200" } ] } ] } ]
 */