class Catalog{
  static final items=[
    Item(
      id:1,
      name: "Iphone",
      desc: "128gb",
     image: "https://www.91-img.com/gallery_images_uploads/3/d/3df5ca6a9b470f715b085991144a5b76e70da975.JPG?tr=h-550,w-0,c-at_max",
      price: 117,

    ),
    Item(
      id:1,
      name: "Iphone12",
      desc: "64gb",
    image: "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-12-3.jpg",
      price: 224,

    ),
    Item(
      id:1,
      name: "Iphone11",
      desc: "512gb",
      image: "https://i.ytimg.com/vi/gDkG0Fjjjuk/maxresdefault.jpg",
      price: 233,

    ),


  ];

}
class Item{

  final int id;
  final String name;
  final String desc;
  final num price;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.image});
  factory Item.fromMap(Map<String,dynamic>map){
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        image: map["image"],
        price: map["price"]);

  }


toMap() =>{
    "id":id,
    "name":name,
    "image":image,
    "desc":desc,
    "price":price,




};


}