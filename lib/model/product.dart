
class ProductItemModal{
  String desc;
  String imageUrl;
  String type;
  String name;
  
  ProductItemModal({
    this.desc,
    this.imageUrl,
    this.type,
    this.name
  });

  factory ProductItemModal.fromJson(dynamic json){
   
    
     
    return ProductItemModal(
      desc:json['desc'],
      imageUrl:json['imageUrl'],
      type:json['type'],
      name:json['name'],
    );
  }
}


class ProductListModal{
  List<ProductItemModal> data;
  ProductListModal({this.data});

  factory ProductListModal.fromJson(List json){
    var tpm=  
      json.map((e) {
        return ProductItemModal.fromJson(e);
      }).toList();
    return  ProductListModal(data: tpm);
  }
}

